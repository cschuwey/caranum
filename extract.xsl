<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:param name="edition">P_ed1_ex1</xsl:param>
    
    <xsl:template match="/">
        <html><head></head><body><xsl:apply-templates select="//tei:div2[contains(@source,$edition)]"/></body></html>
    </xsl:template>
    
    <xsl:template match="tei:div2">
        <div style="margin-bottom:12pt"><xsl:apply-templates select="tei:p[contains(@source,$edition) and @xml:id]"/></div>
    </xsl:template>
    
    <xsl:template match="tei:p">
        <p style="margin-bottom:3pt"><xsl:apply-templates/></p>
    </xsl:template>
    
    <xsl:template match="tei:app">
        <span style="color:red"><xsl:apply-templates/></span>
    </xsl:template>
    
    <xsl:template match="tei:rdg">
        <xsl:apply-templates select=".[contains(@source,$edition)]"></xsl:apply-templates>
    </xsl:template>
    
</xsl:stylesheet>