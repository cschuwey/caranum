<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:param name="edition">ed1</xsl:param>
    
    <xsl:template match="/">
        <html><head></head>
        
        <body>
            <!--<xsl:apply-templates/>-->
            <xsl:for-each select="//tei:div2[@xml:id='ch3_r32' or @corresp='#ch3_r32']">
                <xsl:variable name="edition"><xsl:value-of select="@source"/></xsl:variable>
                <xsl:apply-templates select="./preceding-sibling::tei:div2[contains(@source,$edition)][1]" mode="display"/>
                <p><xsl:apply-templates select="." mode="display"/></p>
                <xsl:apply-templates select="./following-sibling::tei:div2[contains(@source,$edition)][1]" mode="display"/>
                </xsl:for-each>
        </body>
        
        </html>
    </xsl:template>
    
    <!--<xsl:template match="*[@source]" priority="1">
        <xsl:if test="contains(@source,$edition)">
            <xsl:choose>
                <xsl:when test="@corresp">
                    <xsl:variable name="id">
                        <xsl:value-of select="substring(@corresp,2)"/>
                    </xsl:variable>
                    <xsl:apply-templates select="//tei:div2[contains(@xml:id,$id)]" mode="display"></xsl:apply-templates>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:apply-templates/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:if>
    </xsl:template>-->
            
    
    <xsl:template match="tei:teiHeader"></xsl:template>
    
    <xsl:template match="tei:div2" mode="display" priority="10">
        Édition <xsl:value-of select="@source"/>
        <xsl:choose>
            <xsl:when test="@corresp">
                <xsl:variable name="id">
                    <xsl:value-of select="substring(@corresp,2)"/>
                </xsl:variable>
                <xsl:apply-templates select="//tei:div2[contains(@xml:id,$id)]" mode="display"></xsl:apply-templates>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    
    
    <xsl:template match="tei:p" mode="display" priority="10">
        <p><xsl:apply-templates/></p>
    </xsl:template>
    
</xsl:stylesheet>