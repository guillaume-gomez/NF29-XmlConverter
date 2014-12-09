<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl:template match="*">
    <xsl:processing-instruction name="oxygen">
        RNGSchema="http://scenari.utc.fr/hdoc/schemas/container/hdoc1-container.rng" type="xml"
    </xsl:processing-instruction>
    <container version="1.0">
        <rootfiles>
            <rootfile full-path="content.xml" media-type="text/xml"/>
        </rootfiles>
    </container>
</xsl:template>
    
</xsl:stylesheet>
