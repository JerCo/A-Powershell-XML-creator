$file_input = get-content -path C:\Users\rest_of_filepath
$file_output = "C:\Users\rest_of_filepath"

# Set The Formatting
$xmlsettings = New-Object System.Xml.XmlWriterSettings
$xmlsettings.Indent = $true
$xmlsettings.IndentChars = " "

# Set the File Name Create The Document
$XmlWriter = [System.XML.XmlWriter]::Create($file_output, $xmlsettings)
# Write the XML Decleration and set the XSL
$xmlWriter.WriteStartDocument()
$xmlWriter.WriteProcessingInstruction("xml-stylesheet", "type='text/xsl' href='style.xsl'")

# Start the Root Element
$xmlWriter.WriteStartElement("monsters")

foreach ($index in $file_input){
	$index = $index.Trim()
	$xmlWriter.WriteElementString($index, "")
}

$xmlWriter.WriteEndElement() # <-- End <Root>

# End, Finalize and close the XML Document
$xmlWriter.WriteEndDocument()
$xmlWriter.Flush()
$xmlWriter.Close()
Read-Host -Prompt "XML File Created"