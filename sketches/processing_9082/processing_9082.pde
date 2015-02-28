
/*
  IMPORT DATA

  - importiert die XML Datei (aus Excel erstellt)
  - speichert Tabellenstruktur und Inhalte in Arrays ab
*/
void importData () {
  // xml datei laden, zeilen laden
  XMLElement xml = new XMLElement ( this, "umweltinvestitionen.xml" );
  XMLElement[] rows = xml.getChildren();

  // zeilen zählen, kinder zählen
  int int_rows = xml.getChildCount()-1;
  int int_years = rows[0].getChildCount();
  int int_data = rows[1].getChildCount()-1;
    
  // Daten-Arrays vorbereiten
  years = new int[int_years];
  title = new String[int_rows];
  data = new float[int_rows][int_data];
  
  numberPoints = int_data;
  pointDistance = diagramWidth/(numberPoints-1);
  configPositionArrays( int_data );
  
  // zeilen lesen
  for ( int i = 0;  i<rows.length;  i++ ) {
    
    // Kinderelemente lesen
    XMLElement[] children = rows[i].getChildren();
    for ( int j = 0;  j<children.length;  j++ ) {
      
      // Kinderelemente in Arrays übertragen
      String tag = children[j].getName();
      if ( tag.equals("data") )
        data[i-1][j-1] = float( children[j].getContent() );
      else if ( tag.equals("year") )
        years[j] = int( children[j].getContent() );  
      else
        title[i-1] = children[j].getContent();
    }
  }
}




/*
  - sucht den absoluten Maximalwert für die dynamische Skala
*/
void getAbsoluteMaximum() {
  float maxData = 0;
  for ( int i = 0;  i < data.length; i++ ) {
    maxData = max ( data[i] );
    absoluteMaximum = max ( absoluteMaximum, maxData );
    }
  
}



/*
  - konfiguriert die Arrays für die Positionen der Datensatzpunkte
*/
void configPositionArrays( int rows ) {
  startP = new float[rows][2];
  endP = new float[rows][2];
}




/*
  - kalkuliert die Positionen für die Werte in Datensatz mit dem index tIndex
*/
float[][] calcPositions( int tIndex ) {
  float[][] temp = new float[numberPoints][2];
  float maxData = max ( data[tIndex] );
  float x = rand;
  
  for( int i=0; i < numberPoints ; i++ ) {
    temp[i][0] = x;
    temp[i][1] = lerp ( minY, maxY, data[tIndex][i]/maxData );
    x += pointDistance;   
  }
  
  return temp;
}




/*
  - ordnet die Positions-Arrays neu an
*/
void reorderPositions() {
  startP = endP;
  endP = calcPositions( index );
}



/*
  - berechnet das raster im hintergrund
*/
void calcGridinfo() {
  localMaximum = max ( data[index] );
  
  int divisor;
  for ( divisor=1; divisor < localMaximum; divisor*=10 );
  divisor *= 0.1;
  
  float gridNumber = round ( localMaximum/divisor );
  float gridValue = gridNumber * divisor;
  if(gridValue > localMaximum)
    gridValue -= 0.5*divisor;
  float y = lerp ( minY, maxY, gridValue/localMaximum );
  gridNumber = constrain ( gridNumber, 2, 10 );
  float gridDistance = (minY-y)/gridNumber;
  
  gridInfo[0] = gridNumber;
  gridInfo[1] = gridDistance;
  gridInfo[2] = gridValue;
}




/*
  - berechnet anhand des localMaximum
*/
void calcDiagramColor() {
  float colorFader = localMaximum/absoluteMaximum;
  colorFader = constrain ( colorFader, 0, 1 );

  float r = lerp ( 50, 200, 1-colorFader );
  float g = lerp ( 50, 200, colorFader );
  float b = lerp ( 50, 100, colorFader );

  diagramColor = color ( r, g, b );
}


