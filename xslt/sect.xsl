<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    version="2.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"         
    xpath-default-namespace="http://www.utc.fr/ics/hdoc/xhtml"  
    xmlns="http://www.utc.fr/ics/hdoc/xhtml"
    >
    
    <xsl:output method="xml" indent="yes"/>
    
    <xsl:template match="map">
        <xsl:processing-instruction name="oxygen">
            RNGSchema="http://scenari.utc.fr/hdoc/schemas/xhtml/hdoc1-xhtml.rng" type="xml"
        </xsl:processing-instruction>
        <html>
            <head>
                <xsl:apply-templates mode="header"></xsl:apply-templates>
            </head>
            <body>        
                <xsl:apply-templates/>
            </body>
        </html>
        
    </xsl:template>
    
    
    <xsl:template match="node[1]" mode="header">
            <title><xsl:value-of select="@TEXT"/></title>
            <meta charset="utf-8"/>
            <meta name="author" content=""/>
    </xsl:template>
    
    <xsl:template match="node">
        <xsl:element name="section" >
            <header>
                <h1>
                    <xsl:value-of select="@TEXT"/>
                </h1>
            </header>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="node[not(node)]" priority="5">
        <xsl:element name="section" >
            <xsl:attribute name="data-hdoc-type">unit-of-content</xsl:attribute>
            <header>
                <h1>
                    <xsl:value-of select="@TEXT"/>
                </h1>
            </header>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>


<xsl:template match="richcontent"/>
   
   
</xsl:stylesheet>
