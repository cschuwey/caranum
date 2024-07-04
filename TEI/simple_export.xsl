<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:param name="exemplaire">P_ed1_ex1</xsl:param>
    <xsl:param name="edition">ed1</xsl:param>
    
    <xsl:template match="/">
        <html><head></head><body><xsl:apply-templates select="//tei:div3[tei:p[contains(@source,$exemplaire) and @xml:id]]"/></body></html>
    </xsl:template>
    
    <xsl:template match="tei:div3">
        <div style="margin-bottom:12pt"><xsl:apply-templates select="tei:p[contains(@source,$exemplaire) and @xml:id]"/></div>
    </xsl:template>
    
    <xsl:template match="tei:p">
        <p style="margin-bottom:3pt"><xsl:apply-templates/></p>
    </xsl:template>
    
    <xsl:template match="tei:app">
        <xsl:choose>
            <xsl:when test="count(tei:rdg[contains(@source,$edition)])&gt;1"><span style="color:red">
                <xsl:apply-templates select="tei:rdg[contains(@source,$exemplaire)]"/>
                [<xsl:for-each select="tei:rdg[contains(@source,$edition) and not(contains(@source,$exemplaire))]">
                    <xsl:apply-templates/> 
                </xsl:for-each>]</span></xsl:when>
            <xsl:otherwise><xsl:apply-templates select="tei:rdg[contains(@source,$exemplaire)]"/></xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    
    <xsl:template match="tei:g[contains(@source,$exemplaire)]">
        <xsl:variable name="id"><xsl:value-of select="@ref"/></xsl:variable>
        <xsl:value-of select="//tei:glyph[contains(@xml:id,$id)]/tei:desc"/>
    </xsl:template>
    <xsl:template match="tei:g[not(contains(@source,$exemplaire))]"/>
    
    
</xsl:stylesheet>