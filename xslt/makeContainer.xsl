<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="1.0"
    xmlns="urn:utc.fr:ics:hdoc:container"
    >

<xsl:template match="*">
    <xsl:processing-instruction name="oxygen">
        RNGSchema="http://scenari.utc.fr/hdoc/schemas/container/hdoc1-container.rng" type="xml"
    </xsl:processing-instruction>
    <xsl:element name="container" >
        <xsl:attribute name="version">1.0</xsl:attribute>
        <rootfiles>
            <rootfile full-path="content.xml" media-type="text/xml"/>
        </rootfiles>
     </xsl:element>
</xsl:template>
    
</xsl:stylesheet>
