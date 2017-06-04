<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    exclude-result-prefixes="tei">
    <xsl:output method = "xml" indent="yes" omit-xml-declaration="no" /> 
    <!-- transform Zefania XML to TEI-->
    
    <xsl:template match="//XMLBIBLE">
        <xsl:element name="TEI">
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="//INFORMATION">
        <xsl:element name="teiHeader">
            <xsl:element name="fileDesc">
                <xsl:element name="titleStmt">
            <xsl:element name="title"><xsl:value-of select="./title"/></xsl:element>
                    
                </xsl:element>
                <xsl:element name="publicationStmt">
                    <xsl:element name="publisher"><xsl:value-of select="./publisher"/></xsl:element>
                    <xsl:element name="publisher"><xsl:value-of select="./contributors"/></xsl:element>
                    <xsl:element name="date"><xsl:value-of select="./date"/></xsl:element>
                </xsl:element>
                <xsl:element name="sourceDesc">
                    <xsl:element name="bibl"><xsl:value-of select="./description"/></xsl:element>
                    <xsl:element name="bibl"><xsl:value-of select="./source"/></xsl:element>
                </xsl:element>
        </xsl:element>
            <xsl:element name="profileDesc">
                <xsl:element name="langUsage">
                    <xsl:element name="language">
                        <xsl:attribute name="ident"><xsl:value-of select="./language"/></xsl:attribute>
                    <xsl:value-of select="./language"/></xsl:element>
                </xsl:element>
            </xsl:element>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="//*:BIBLEBOOK">
        <xsl:element name="text">
            <xsl:attribute name="n"><xsl:value-of select="./@bnumber"/></xsl:attribute>
            <xsl:attribute name="ana"><xsl:value-of select="./@bsname"/></xsl:attribute>
            <xsl:attribute name="type"><xsl:value-of select="replace(./@bname, '\s', '')"/></xsl:attribute>
            <xsl:element name="body">
            <xsl:apply-templates/> 
        </xsl:element>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="//*:CHAPTER">
        <xsl:element name="div">
            <xsl:attribute name="n"><xsl:value-of select="./@cnumber"/></xsl:attribute>
                <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="//VERS">
        <xsl:element name="p">
            <xsl:attribute name="n"><xsl:value-of select="./@vnumber"/></xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="//BR">
        <xsl:element name="lb">
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
</xsl:stylesheet>

