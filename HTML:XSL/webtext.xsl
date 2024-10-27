<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs tei" version="2.0">

    <xsl:strip-space elements="*"/>

    <xsl:param name="base_ed"/>
    <xsl:param name="base_copy"/>
    <xsl:param name="selected_remark">r12_17_01</xsl:param>

    <xsl:template match="/">
        <html>
            <head>
                <style type="text/css">
                    * {
                        margin: 0;
                        padding: 0
                    }
                    body {
                        background: black;
                    
                    }
                    
                    .main {
                        width: 960px;
                        margin-left: auto;
                        margin-right: auto;
                    }
                    
                    .site_title {
                        width: 100%;
                        color: white;
                    }
                    
                    .site_menu {
                        width: 100%;
                        color: white;
                    
                    }
                    
                    .site_menu div {
                        margin-left : auto;
                        margin-right : auto;
                    }
                    
                    .site_menu span {
                        display: inline-block;
                        margin-right: 30px;
                    }
                    
                    .main_text {
                        width: 100%;
                        color: white;
                        font-family: 'EB Garamond';
                        font-weight : 400;
                        font-size: 22px;
                        line-height: 1.1em;
                        text-align: justify;
                    }
                    
                    .cpanel {
                    
                    }
                    
                    .title {
                    
                    }
                    
                    
                    div.remark {
                        padding: 5px;
                        margin-bottom: 12pt;
                    }
                    
                    
                    p.text {
                        padding: 5px;
                        margin-bottom: 3pt;
                    }
                    
                    p.followed {
                        background-color: lightblue;
                    }
                    
                    .change {
                    
                    }
                    
                    .var_none {
                        display: none;
                    }
                    
                    .varexs {
                        color: blue;
                    }
                    
                    .vareds {
                        color: red;
                    }
                
                
                </style>
                


            </head>
            <body>
                <div class="main">
                    <div class="site_title"> </div>

                    <div class="site_menu">
                        <div>
                            <xsl:for-each select="tei:TEI/tei:teiHeader//tei:listBibl/tei:listBibl">
                                <span>
                                    <xsl:value-of select="@xml:id"/>
                                </span>
                            </xsl:for-each>
                        </div>
                    </div>

                    <div class="main_text">
                        <xsl:for-each select="tei:TEI/tei:teiHeader//tei:listBibl/tei:listBibl">
                            <div id="{@xml:id}">
                                <p class="edition_head">
                                    <xsl:value-of select="@xml:id"/>
                                </p>
                                <xsl:apply-templates select="ancestor::tei:TEI//tei:div2">
                                    <xsl:with-param name="base_ed" tunnel="yes">
                                        <xsl:value-of select="@xml:id"/>
                                    </xsl:with-param>
                                    <xsl:with-param name="base_copy" tunnel="yes">
                                        <xsl:value-of select="@xml:id"/><xsl:choose>
                                            <xsl:when test="@xml:id = 'P_ed04'">_ex3</xsl:when>
                                            <xsl:otherwise>_ex1</xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:with-param>
                                    
                                </xsl:apply-templates>

                            </div>

                        </xsl:for-each>
                    </div>
                </div>
            </body>
        </html>
    </xsl:template>


    <xsl:template match="tei:div2/tei:head">
        <div class="chap_title">
            <xsl:apply-templates/>
        </div>
    </xsl:template>

    <xsl:template match="tei:div3">
        <xsl:param name="base_ed" tunnel="yes"/>
        <xsl:param name="base_copy" tunnel="yes"/>
        <!-- DEBUG
        BASEED:<xsl:value-of select="$base_ed"/>
        BASECO:<xsl:value-of select="$base_copy"/> -->

        <xsl:if test="*[contains(@source, $base_copy)]">
            <div class="remark">
                <xsl:apply-templates select="*[contains(@source, $base_copy)]"/>
            </div>
        </xsl:if>
    </xsl:template>

    <xsl:template match="tei:p">
        <xsl:param name="base_ed" tunnel="yes"/>
        <xsl:param name="base_copy" tunnel="yes"/>
        <p>
            <!-- follow the fleet -->
            <xsl:attribute name="class">text<xsl:if
                    test="contains(@xml:id, $selected_remark) or contains(@corresp, $selected_remark)"
                    > followed</xsl:if>
            </xsl:attribute>


            <!-- creating the content -->
            <xsl:choose>
                <xsl:when test="@corresp">
                    <xsl:variable name="corresp">
                        <xsl:value-of select="@corresp"/>
                    </xsl:variable>
                    <xsl:apply-templates select="ancestor::tei:TEI//tei:p[@xml:id = $corresp]"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:apply-templates/>
                </xsl:otherwise>
            </xsl:choose>
        </p>

    </xsl:template>

    <xsl:template match="tei:g">
        <xsl:param name="base_ed" tunnel="yes"/>
        <xsl:param name="base_copy" tunnel="yes"/>

        <xsl:if test="contains(@source, $base_copy)">
            <!--<xsl:apply-templates select="tei:desc"/><xsl:text> </xsl:text>--> ❡  </xsl:if>

    </xsl:template>

    <xsl:template match="tei:seg[tei:app]">
        <xsl:param name="base_ed" tunnel="yes"/>
        <xsl:param name="base_copy" tunnel="yes"/>

        <span class="var_range">
            <xsl:apply-templates/>
        </span>
    </xsl:template>

    <xsl:template match="tei:app">
        <xsl:param name="base_ed" tunnel="yes"/>
        <xsl:param name="base_copy" tunnel="yes"/>

        <span>
            <xsl:attribute name="class">
                <xsl:choose>
                    <xsl:when test="count(tei:rdg[contains(@source, $base_ed)]) > 1"
                        >varexs</xsl:when>
                    <xsl:otherwise>vareds</xsl:otherwise>
                </xsl:choose>
            </xsl:attribute>
            <xsl:apply-templates/>
        </span>
    </xsl:template>

    <xsl:template match="tei:rdg">
        <xsl:param name="base_ed" tunnel="yes"/>
        <xsl:param name="base_copy" tunnel="yes"/>

        <xsl:choose>
            <xsl:when test="contains(@source, $base_copy)">
                <span class="var_display">
                    <xsl:apply-templates/>
                </span>
            </xsl:when>
            <xsl:otherwise>
                <span class="var_none">
                    <xsl:apply-templates/>
                </span>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="text()">
        <xsl:value-of select="replace(., 'ſ', 's')"/>
    </xsl:template>



</xsl:stylesheet>
