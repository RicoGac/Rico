<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:foaf="http://xmlns.com/foaf/0.1/"
                xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  
  <!-- Déclaration du type de sortie -->
  <xsl:output method="html" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
              doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" 
              encoding="UTF-8" indent="yes"/>
  
  <!-- Transformation du fichier RDF en HTML -->
  <xsl:template match="/rdf:RDF">
    <html xmlns="http://www.w3.org/1999/xhtml" lang="fr">
      <head>
        <title>Profil FOAF de Ton Nom</title>
        <meta charset="UTF-8"/>
      </head>
      <body>
        <h1>Profil FOAF de <xsl:value-of select="foaf:Person/foaf:name"/></h1>

        <p><strong>Pseudo :</strong> <xsl:value-of select="foaf:Person/foaf:nick"/></p>

        <p><strong>Email :</strong> 
          <a href="mailto:{foaf:Person/foaf:mbox/@rdf:resource}">
            <xsl:value-of select="foaf:Person/foaf:mbox/@rdf:resource"/>
          </a>
        </p>

        <p><strong>Page personnelle :</strong> 
          <a href="{foaf:Person/foaf:homepage/@rdf:resource}">
            <xsl:value-of select="foaf:Person/foaf:homepage/@rdf:resource"/>
          </a>
        </p>

        <h2>Connaissances</h2>
        <ul>
          <xsl:for-each select="foaf:Person/foaf:knows">
            <li>
              <strong>Nom :</strong> <xsl:value-of select="foaf:Person/foaf:name"/>
              (<a href="{foaf:Person/foaf:homepage/@rdf:resource}">Page personnelle</a>)
            </li>
          </xsl:for-each>
        </ul>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
