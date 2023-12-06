<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs"
    version="1.0">
    <xsl:template match="tei:TEI">
        <html>
            <head></head>
            <body>
                <xsl:apply-templates/>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="tei:teiHeader"></xsl:template>
    
    
    <!-- encodage pour la préface -->
    
    <xsl:template match="tei:front">
        <h1 style="text-align: center; font-size:14pt; font-weight: bold">
            Les Caractères - La Bruyère
        </h1>
        <h2 style="text-align: center; font-size:12pt; font-weight: bold">
            Préface 
        </h2>
        <xsl:apply-templates/>
    </xsl:template>
    
    
    <!-- encodage pour le texte -->
    
    <xsl:template match="tei:div1/tei:head">
        <h2 style="text-align: center; font-size:12pt; font-weight: bold">
            <xsl:apply-templates/>
        </h2>
    </xsl:template>
    
    <xsl:template match="tei:div2[contains(@source,'#Paris_ed6') or tei:p[contains(@source,'#Paris_ed6')]]">
        <xsl:apply-templates/>
        <p> </p>
        <p> </p>
    </xsl:template>
    
    <xsl:template match="tei:div2[not(contains(@source,'#Paris_ed6') or tei:p[contains(@source,'#Paris_ed6')])]"/>
    
    
    <xsl:template match="tei:div2/tei:p[contains(@source,'#Paris_ed6') or not(@source)]">
        <xsl:choose>
            <xsl:when test="position()=2"> <!-- Pour une raison que je ne m'explique pas, la position du premier p est systématiquement 2 -->
                <p>(<xsl:value-of select="../@n"/>) <xsl:apply-templates/></p>
            </xsl:when>
            <xsl:otherwise>
                <p><xsl:apply-templates/></p>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="tei:div2/tei:p[not(contains(@source,'#Paris_ed6') or not(@source))]"/>
 
</xsl:stylesheet>
