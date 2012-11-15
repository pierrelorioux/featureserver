<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
	xmlns:gml="http://www.opengis.net/gml"
	xmlns:regexp="http://exslt.org/regular-expressions" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	
	<xsl:param name="operationType" />
	<xsl:param name="geometryName" />
	<xsl:param name="srs" />
	
	<xsl:template match="/">
		<Statements>
			<xsl:apply-templates>
				<xsl:with-param name="geometryName" select="$geometryName" />
				<xsl:with-param name="srs" select="$srs" />
			</xsl:apply-templates>
		</Statements>
	</xsl:template>

	<xsl:template match="*[local-name(.)='Equals']">
		<xsl:param name="geometryName" />
		<xsl:param name="srs" />
        
        <xsl:if test="//*[local-name() = 'ValueReference']">
            <Statement>ST_Equals("<xsl:value-of select="//*[local-name() = 'ValueReference']" />", ST_GeomFromGML('<xsl:copy-of select="//*[local-name() = 'Literal']/*" />'))</Statement>
        </xsl:if>
        <xsl:if test="not(//*[local-name() = 'ValueReference'])">
            <Statement>ST_Equals("<xsl:value-of select="//*[local-name() = 'PropertyName']" />", ST_GeomFromGML('<xsl:copy-of select="//*[local-name() = 'Literal']/*" />'))</Statement>
        </xsl:if>
	</xsl:template>
	
	<xsl:template match="*[local-name(.)='Disjoint']">
		<xsl:param name="geometryName" />
		<xsl:param name="srs" />
        
        <xsl:if test="//*[local-name() = 'ValueReference']">
            <Statement>ST_Disjoint("<xsl:value-of select="//*[local-name() = 'ValueReference']" />", ST_GeomFromGML('<xsl:value-of select="//*[local-name() = 'Literal']" />'))</Statement>
        </xsl:if>
        <xsl:if test="not(//*[local-name() = 'ValueReference'])">
            <Statement>ST_Disjoint("<xsl:value-of select="//*[local-name() = 'PropertyName']" />", ST_GeomFromGML('<xsl:value-of select="//*[local-name() = 'Literal']" />'))</Statement>
        </xsl:if>
	</xsl:template>

	<xsl:template match="*[local-name(.)='Touches']">
		<xsl:param name="geometryName" />
		<xsl:param name="srs" />

        <xsl:if test="//*[local-name() = 'ValueReference']">
            <Statement>ST_Touches("<xsl:value-of select="//*[local-name() = 'ValueReference']" />", ST_GeomFromGML('<xsl:value-of select="//*[local-name() = 'Literal']" />'))</Statement>
        </xsl:if>
        <xsl:if test="not(//*[local-name() = 'ValueReference'])">
            <Statement>ST_Touches("<xsl:value-of select="//*[local-name() = 'PropertyName']" />", ST_GeomFromGML('<xsl:value-of select="//*[local-name() = 'Literal']" />'))</Statement>
        </xsl:if>
	</xsl:template>

	<xsl:template match="*[local-name(.)='Within']">
		<xsl:param name="geometryName" />
		<xsl:param name="srs" />

        <xsl:if test="//*[local-name() = 'ValueReference']">
            <Statement>ST_Within("<xsl:value-of select="//*[local-name() = 'ValueReference']" />", ST_GeomFromGML('<xsl:value-of select="//*[local-name() = 'Literal']" />'))</Statement>
        </xsl:if>
        <xsl:if test="not(//*[local-name() = 'ValueReference'])">
            <Statement>ST_Within("<xsl:value-of select="//*[local-name() = 'PropertyName']" />", ST_GeomFromGML('<xsl:value-of select="//*[local-name() = 'Literal']" />'))</Statement>
        </xsl:if>
	</xsl:template>

	<xsl:template match="*[local-name(.)='Overlaps']">
		<xsl:param name="geometryName" />
		<xsl:param name="srs" />

        <xsl:if test="//*[local-name() = 'ValueReference']">
            <Statement>ST_Overlaps("<xsl:value-of select="//*[local-name() = 'ValueReference']" />", ST_GeomFromGML('<xsl:value-of select="//*[local-name() = 'Literal']" />'))</Statement>
        </xsl:if>
        <xsl:if test="not(//*[local-name() = 'ValueReference'])">
            <Statement>ST_Overlaps("<xsl:value-of select="//*[local-name() = 'PropertyName']" />", ST_GeomFromGML('<xsl:value-of select="//*[local-name() = 'Literal']" />'))</Statement>
        </xsl:if>
	</xsl:template>

	<xsl:template match="*[local-name(.)='Crosses']">
		<xsl:param name="geometryName" />
		<xsl:param name="srs" />

        <xsl:if test="//*[local-name() = 'ValueReference']">
            <Statement>ST_Crosses("<xsl:value-of select="//*[local-name() = 'ValueReference']" />", ST_GeomFromGML('<xsl:value-of select="//*[local-name() = 'Literal']" />'))</Statement>
        </xsl:if>
        <xsl:if test="not(//*[local-name() = 'ValueReference'])">
            <Statement>ST_Crosses("<xsl:value-of select="//*[local-name() = 'PropertyName']" />", ST_GeomFromGML('<xsl:value-of select="//*[local-name() = 'Literal']" />'))</Statement>
        </xsl:if>
	</xsl:template>

	<xsl:template match="*[local-name(.)='Intersects']">
		<xsl:param name="geometryName" />
		<xsl:param name="srs" />

        <xsl:if test="//*[local-name() = 'ValueReference']">
            <Statement>ST_Intersects("<xsl:value-of select="//*[local-name() = 'ValueReference']" />", ST_GeomFromGML('<xsl:value-of select="//*[local-name() = 'Literal']" />'))</Statement>
        </xsl:if>
        <xsl:if test="not(//*[local-name() = 'ValueReference'])">
            <Statement>ST_Intersects("<xsl:value-of select="//*[local-name() = 'PropertyName']" />", ST_GeomFromGML('<xsl:value-of select="//*[local-name() = 'Literal']" />'))</Statement>
        </xsl:if>
	</xsl:template>

	<xsl:template match="*[local-name(.)='Contains']">
		<xsl:param name="geometryName" />
		<xsl:param name="srs" />

        <xsl:if test="//*[local-name() = 'ValueReference']">
            <Statement>ST_Contains("<xsl:value-of select="//*[local-name() = 'ValueReference']" />", ST_GeomFromGML('<xsl:value-of select="//*[local-name() = 'Literal']" />'))</Statement>
        </xsl:if>
        <xsl:if test="not(//*[local-name() = 'ValueReference'])">
            <Statement>ST_Contains("<xsl:value-of select="//*[local-name() = 'PropertyName']" />", ST_GeomFromGML('<xsl:value-of select="//*[local-name() = 'Literal']" />'))</Statement>
        </xsl:if>
    </xsl:template>

	<xsl:template match="*[local-name(.)='DWithin']">
		<xsl:param name="geometryName" />
		<xsl:param name="srs" />

        <xsl:if test="//*[local-name() = 'ValueReference']">
            <Statement>ST_DWithin("<xsl:value-of select="//*[local-name() = 'ValueReference']" />", ST_GeomFromGML('<xsl:value-of select="//*[local-name() = 'Literal']" />'), <xsl:value-of select="//Distance"/>)</Statement>
        </xsl:if>
        <xsl:if test="not(//*[local-name() = 'ValueReference'])">
            <Statement>ST_DWithin("<xsl:value-of select="//*[local-name() = 'PropertyName']" />", ST_GeomFromGML('<xsl:value-of select="//*[local-name() = 'Literal']" />'), <xsl:value-of select="//Distance"/>)</Statement>
        </xsl:if>
	</xsl:template>

	<xsl:template match="*[local-name(.)='Beyond']">
		<xsl:param name="geometryName" />
		<xsl:param name="srs" />

        <xsl:if test="//*[local-name() = 'ValueReference']">
            <Statement>NOT ST_DWithin("<xsl:value-of select="//*[local-name() = 'ValueReference']" />", ST_GeomFromGML('<xsl:value-of select="//*[local-name() = 'Literal']" />'), <xsl:value-of select="//Distance"/>)</Statement>
        </xsl:if>
        <xsl:if test="not(//*[local-name() = 'ValueReference'])">
            <Statement>NOT ST_DWithin("<xsl:value-of select="//*[local-name() = 'PropertyName']" />", ST_GeomFromGML('<xsl:value-of select="//*[local-name() = 'Literal']" />'), <xsl:value-of select="//Distance"/>)</Statement>
        </xsl:if>
	</xsl:template>

	<xsl:template match="*[local-name(.)='BBOX']">
		<xsl:param name="geometryName" />
		<xsl:param name="srs" />
		
		<xsl:variable name="lower" select="//*[local-name() = 'Envelope']/*[local-name() = 'lowerCorner']"/>
		<xsl:variable name="upper" select="//*[local-name() = 'Envelope']/*[local-name() = 'upperCorner']"/>
		<xsl:variable name="srsName" select="//*[local-name() = 'Envelope']/@srsName"/>
		 
		<xsl:variable name="geometry" select="$geometryName"/>
							 
        <xsl:variable name="lower1" select="regexp:replace(string($lower), string(' '), 'g', ',')"/>
        <xsl:variable name="upper1" select="regexp:replace(string($upper), string(' '), 'g', ',')"/>
        <xsl:variable name="srs1" select="regexp:replace(string($srsName), '.*:(?!.*:)', 'g', '')"/>
        
        <Statement>ST_Intersects("<xsl:value-of select="$geometry" />", Transform(ST_MakeEnvelope(<xsl:value-of select="$lower1" />,<xsl:value-of select="$upper1"/>, <xsl:value-of select="$srs1"/>), <xsl:value-of select="$srs" />))</Statement>
	</xsl:template>

</xsl:stylesheet>