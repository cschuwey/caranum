<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    exclude-result-prefixes="xs fo tei" version="2.0">

    <xsl:strip-space elements="*"/>

    <xsl:param name="base_copy"/>

    <xsl:template match="tei:TEI">
        <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
            
            <!-- Layout master setup -->
            <fo:layout-master-set>
                <!-- Define a simple page layout -->
                <fo:simple-page-master master-name="A4" page-height="29.7cm" page-width="21cm" margin-top="2cm" margin-bottom="2cm" margin-left="2cm" margin-right="2cm">
                    <fo:region-body margin-top="2cm" margin-bottom="2cm"/>
                    <fo:region-before extent="2cm"/>
                    <fo:region-after extent="2cm"/>
                </fo:simple-page-master>
            </fo:layout-master-set>
            
            <!-- Page sequence to apply the layout to a series of pages -->
            <fo:page-sequence master-reference="A4">
                <fo:static-content flow-name="xsl-region-before">
                    <!-- Content for the header (region-before) -->
                    <fo:block text-align="center" font-size="12pt">Document Title</fo:block>
                </fo:static-content>
                <fo:static-content flow-name="xsl-region-after">
                    <!-- Content for the footer (region-after) -->
                    <fo:block text-align="center" font-size="10pt">Page <fo:page-number/></fo:block>
                </fo:static-content>
                
                <!-- Flow content for the document body -->
                <fo:flow flow-name="xsl-region-body">
                    <xsl:apply-templates select="//tei:div3"/>
                    
                </fo:flow>
            </fo:page-sequence>
        </fo:root>

    </xsl:template>
    

    <xsl:template match="tei:div3">
        
        <xsl:if test="tei:p[contains(@source, $base_copy)]">
            
            <fo:block font-family="Arial, sans-serif" font-size="12pt" line-height="1.5">
                <!-- Insert your main content here -->
                <fo:block text-align="justify">
                    <xsl:apply-templates/>
                </fo:block>
            </fo:block>
        </xsl:if>

    </xsl:template>


    <!--<xsl:template match="tei:p">
        <xsl:if test="contains(@source, $base_copy)">
            <p class="paragraph">
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
        </xsl:if>
    </xsl:template>

    <xsl:template match="tei:app">
        <xsl:apply-templates select="tei:rdg[contains(@source, $base_copy)]"/>
    </xsl:template>

    <xsl:template match="tei:note"> </xsl:template>
    
    <xsl:template match="tei:g">
        <xsl:if test="contains(@source, $base_copy)">
            <xsl:variable name="id"><xsl:value-of select="@ref"/></xsl:variable>
            <xsl:value-of select="ancestor::tei:TEI/tei:teiHeader//tei:glyph[contains(@xml:id,$id)]/tei:desc"/>
        </xsl:if>
    </xsl:template>-->

</xsl:stylesheet>
