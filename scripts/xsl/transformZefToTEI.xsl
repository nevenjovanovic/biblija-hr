<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    exclude-result-prefixes="tei">
    <xsl:output method = "xml" indent="yes" omit-xml-declaration="no" /> 
    <!-- transform Zefania XML to TEI-->
    
    <xsl:template match="//XMLBIBLE">
        <xsl:element name="TEI" namespace="http://www.tei-c.org/ns/1.0">
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="//INFORMATION">
        <xsl:element name="teiHeader" namespace="http://www.tei-c.org/ns/1.0">
            <xsl:element name="fileDesc" namespace="http://www.tei-c.org/ns/1.0">
                <xsl:element name="titleStmt" namespace="http://www.tei-c.org/ns/1.0">
                    <xsl:element name="title" namespace="http://www.tei-c.org/ns/1.0"><xsl:value-of select="./title"/></xsl:element>
                    
                </xsl:element>
                <xsl:element name="publicationStmt" namespace="http://www.tei-c.org/ns/1.0">
                    <xsl:element name="publisher" namespace="http://www.tei-c.org/ns/1.0"><xsl:value-of select="./publisher"/></xsl:element>
                    <xsl:element name="publisher" namespace="http://www.tei-c.org/ns/1.0"><xsl:value-of select="./contributors"/></xsl:element>
                    <xsl:element name="date" namespace="http://www.tei-c.org/ns/1.0"><xsl:value-of select="./date"/></xsl:element>
                </xsl:element>
                <xsl:element name="sourceDesc" namespace="http://www.tei-c.org/ns/1.0">
                    <xsl:element name="bibl" namespace="http://www.tei-c.org/ns/1.0"><xsl:value-of select="./description"/></xsl:element>
                    <xsl:element name="bibl" namespace="http://www.tei-c.org/ns/1.0"><xsl:value-of select="./source"/></xsl:element>
                </xsl:element>
        </xsl:element>
            <xsl:element name="profileDesc" namespace="http://www.tei-c.org/ns/1.0">
                <xsl:element name="langUsage" namespace="http://www.tei-c.org/ns/1.0">
                    <xsl:element name="language" namespace="http://www.tei-c.org/ns/1.0">
                        <xsl:attribute name="ident"><xsl:value-of select="./language"/></xsl:attribute>
                    <xsl:value-of select="./language"/></xsl:element>
                </xsl:element>
            </xsl:element>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="//*:BIBLEBOOK">
        <xsl:element name="text" namespace="http://www.tei-c.org/ns/1.0">
            <xsl:attribute name="n"><xsl:value-of select="./@bnumber"/></xsl:attribute>
            <xsl:attribute name="ana"><xsl:value-of select="./@bsname"/></xsl:attribute>
            <xsl:attribute name="type"><xsl:value-of select="replace(./@bname, '\s', '')"/></xsl:attribute>
            <xsl:element name="body" namespace="http://www.tei-c.org/ns/1.0">
            <xsl:apply-templates/> 
        </xsl:element>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="//*:CHAPTER">
        <xsl:element name="div" namespace="http://www.tei-c.org/ns/1.0">
            <xsl:attribute name="n"><xsl:value-of select="./@cnumber"/></xsl:attribute>
                <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="//VERS">
        <xsl:element name="p" namespace="http://www.tei-c.org/ns/1.0">
            <xsl:attribute name="n"><xsl:value-of select="./@vnumber"/></xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="//BR">
        <xsl:element name="lb" namespace="http://www.tei-c.org/ns/1.0">
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
</xsl:stylesheet>

