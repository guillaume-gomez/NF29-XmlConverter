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
   
    <!-- Get the main title -->
    <xsl:template match="node[1]" mode="header">
           <title><xsl:value-of select="@TEXT"/></title>
            <meta charset="utf-8"/>
            <meta name="author" content=""/>
    </xsl:template>
    
    <xsl:template match="node">
        <xsl:element name="section" >
            <xsl:element name="header" >
                <xsl:element name="h1" >
                    <xsl:value-of select="@TEXT"/>
                </xsl:element>
            </xsl:element>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
    <!-- get a n-3 node to match it as sect -->
    <xsl:template match="node[not(node/node/node)]">
        <xsl:element name="section" >
            <xsl:attribute name="data-hdoc-type">unit-of-content</xsl:attribute>
            <xsl:element name="header" >
                <xsl:element name="h1" >
                    <xsl:value-of select="@TEXT"/>
                    </xsl:element>
            </xsl:element>
             <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
    <!-- get a n-2 to make it div
         the n - 1 is matched here too because a p tag must be in a div tag -->
    <xsl:template match="node[not(node/node)] | node[not(node)]">
        <xsl:element name="div" >
            <xsl:element name="h6" >
                <xsl:value-of select="@TEXT"/>
            </xsl:element>
            <p/>
        </xsl:element>
        <xsl:apply-templates/>
    </xsl:template>
    
    <!-- to avoid div between sect list -->
    <xsl:template match="node[not(node/node) and (preceding-sibling::node/node/node or  following-sibling::node/node/node)]" priority="5">
        <xsl:element name="section">
            <xsl:attribute name="data-hdoc-type">unit-of-content</xsl:attribute>
            <xsl:element name="header">
                <xsl:element name="h1"><xsl:value-of select="@TEXT"/></xsl:element>
            </xsl:element>
            
                <xsl:apply-templates/>         
        </xsl:element>
    </xsl:template>

<!-- it does not manage html freemind tag -->
<xsl:template match="richcontent"/>
        
</xsl:stylesheet>
