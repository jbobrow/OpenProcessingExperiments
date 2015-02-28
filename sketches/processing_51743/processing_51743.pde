
PImage[] lightScreen;

PImage img;
PFont fontRegular;
PFont fontBold;

String fileName;

boolean reload;

void setup() {
  size( 512, 512 );
  smooth();
  
  lightScreen = new PImage[8];
  lightScreen[0] = loadImage( "lightleak_01.jpg" );
  lightScreen[1] = loadImage( "lightleak_02.jpg" );
  lightScreen[2] = loadImage( "lightleak_03.jpg" );
  lightScreen[3] = loadImage( "lightleak_04.jpg" );
  lightScreen[4] = loadImage( "lightleak_05.jpg" );
  lightScreen[5] = loadImage( "lightleak_06.jpg" );
  lightScreen[6] = loadImage( "lightleak_07.jpg" );
  lightScreen[7] = loadImage( "lightleak_08.jpg" );
  
  fontRegular = loadFont( "HelveticaWorld-Regular-64.vlw" );
  fontBold = loadFont( "HelveticaWorld-Bold-64.vlw" );
  
  reload = true;
}

void draw()
{
  if( reload )
  {
    fileName = "";
    
    drawRandomAlbumArt();
    drawRandomLightLeak();
    
    float scaleOffset;
    float randAlign;
    int horizAlign;
    int vertAlign;
    
    scaleOffset = random( 1.0, 2.0 );
    randAlign = random( 0, 3 );
    if( randAlign < 1 )
      horizAlign = LEFT;
    else if( randAlign < 2 )
      horizAlign = CENTER;
    else
      horizAlign = RIGHT;
    
    randAlign = random( 0, 3 );
    if( randAlign < 1 )
      vertAlign = TOP;
    else if( randAlign < 2 )
      vertAlign = CENTER;
    else
      vertAlign = BOTTOM;
      
    drawRandomBandName( scaleOffset, horizAlign, vertAlign );
    
    scaleOffset = random( 0.5, 1.5 );
    randAlign = random( 0, 3 );
    if( randAlign < 1 )
      horizAlign = LEFT;
    else if( randAlign < 2 )
      horizAlign = CENTER;
    else
      horizAlign = RIGHT;
    
    randAlign = random( 0, 3 );
    if( randAlign < 1 ) {
      if( vertAlign == TOP )
        vertAlign = CENTER;
      else
        vertAlign = TOP;
    }
    else if( randAlign < 2 ) {
      if( vertAlign == CENTER )
        vertAlign = BOTTOM;
      else
        vertAlign = CENTER;
    }
    else {
      if( vertAlign == BOTTOM )
        vertAlign = TOP;
      else
        vertAlign = BOTTOM;
    }
      
    drawRandomAlbumTitle( scaleOffset, horizAlign, vertAlign );
    
    reload = false;
  }
}

void mouseClicked() {
  noStroke();
  fill( 0, 127 );
  quad( 0, 0, 0, height, width, height, width, 0 );
  
  reload = true;
}

void keyPressed() {
  if( key == 's' || key == 'S' )
    save( fileName + ".png" );
}




void drawRandomAlbumArt() {
  String url = getRandomFlickrImageURL();
  
  if( url == null ) {
    noStroke();
    fill( 255, 0, 0, 127 );
    quad( 0, 0, 0, height, width, height, width, 0 );
    return;
  }
    
  img = loadImage( url );
  
  float imgScale = 1.0f;
  if( img.width < width )
    imgScale = (float)width / (float) img.width;
  if( img.height < height )
    imgScale = max( (float)height / (float) img.height, imgScale );
  
  image( img, (width/2) - (img.width/2*imgScale), (height/2) - (img.height/2*imgScale), (float)img.width*imgScale, (float)img.height*imgScale );
}

void drawRandomLightLeak() {
  int index = (int)random( 0.0, 7.999 );
  blend( lightScreen[index], 0, 0, lightScreen[index].width, lightScreen[index].height, 0, 0, lightScreen[index].width, lightScreen[index].height, SCREEN );
}

void drawRandomBandName( float scale, int horizAlignment, int vertAlignment ) {
  String bandName = getRandomWikipediaArticleTitle();
  
  fileName += bandName + " - ";
  
  fill( 255 );
  textFont( fontBold, 64 * scale );
  textAlign( horizAlignment );
  
  if( textWidth( bandName ) > width - 32 ) {
    scale *= (width-32)/textWidth( bandName );
    textFont( fontBold, 64 * scale );
  }
    
  PVector pos = new PVector( 0, 0 );
  switch( horizAlignment ) {
    case LEFT:
      pos.x = 16;
      break;
    case CENTER:
      pos.x = width/2;
      break;
    case RIGHT:
      pos.x = width - 16;
      break;
  }
  switch( vertAlignment ) {
    case TOP:
      pos.y = textAscent() + 16;
      break;
    case CENTER:
      pos.y = height/2 + textAscent()/2 - textDescent()/2;
      break;
    case BOTTOM:
      pos.y = height - textDescent() - 16;
      break;
  }
  text( bandName, pos.x, pos.y );
}

void drawRandomAlbumTitle( float scale, int horizAlignment, int vertAlignment ) {
  String albumTitle = getRandomQuotePhrase();
  
  fileName += albumTitle;
  
  fill( 255 );
  textFont( fontRegular, 64 * scale );
  textAlign( horizAlignment );
  
  if( textWidth( albumTitle ) > width - 32 ) {
    scale *= (width-32)/textWidth( albumTitle );
    textFont( fontRegular, 64 * scale );
  }
    
  PVector pos = new PVector( 0, 0 );
  switch( horizAlignment ) {
    case LEFT:
      pos.x = 16;
      break;
    case CENTER:
      pos.x = width/2;
      break;
    case RIGHT:
      pos.x = width - 16;
      break;
  }
  switch( vertAlignment ) {
    case TOP:
      pos.y = textAscent() + 16;
      break;
    case CENTER:
      pos.y = height/2 + textAscent()/2 - textDescent()/2;
      break;
    case BOTTOM:
      pos.y = height - textDescent() - 16;
      break;
  }
  text( albumTitle, pos.x, pos.y );
}  




String getRandomFlickrImageURL() {
  int pageNum = int( random(2048) );
  
  String rest = "http://api.flickr.com/services/rest/?method=flickr.photos.getRecent";
  rest += "&api_key=fec5d0a2d7898636272029ec0f9ce800";
  rest += "&per_page=1";
  rest += "&page=" + pageNum;
  
  XMLElement xml;
  try {
    xml = new XMLElement( this, rest );
  }
  catch( Exception e ) {
    return null;
  }
  String farm =   xml.getChild(0).getChild(0).getStringAttribute( "farm" );
  String server = xml.getChild(0).getChild(0).getStringAttribute( "server" );
  String id =     xml.getChild(0).getChild(0).getStringAttribute( "id" );
  String secret = xml.getChild(0).getChild(0).getStringAttribute( "secret" );
  
  return "http://farm" + farm + ".static.flickr.com/" + server + "/" + id + "_" + secret + "_b.jpg";
}

String getRandomWikipediaArticleTitle() {
  String lines[] = loadStrings( "http://en.wikipedia.org/wiki/Special:Random" );
  
  if( lines == null )
    return "Article Failure";
  
  for( int i = 0; i < lines.length; i++ ) {
    // Look for <h1 id="firstHeading" class="firstHeading">*</h1>
    String[] result = match( lines[i], "<h1 id=\"firstHeading\" class=\"firstHeading\">.*</h1>" );
    if( result != null ) {
      String[] tokenized = splitTokens( result[0], "<>()" );
      if( tokenized[1].equals( "i" ) )
        return tokenized[2];
      return tokenized[1];
    }
  }
  
  return "Article Failure";
}

String getRandomQuotePhrase() {
  String lines[] = loadStrings( "http://www.quotationspage.com/random.php3" );
  
  if( lines == null )
    return "Quote Failure";
  
  for( int i = 0; i < lines.length; i++ ) {
    // Look for <dt class="quote"><a title="Click for further information about this quotation" href="/quote/*.html">*</a> </dt>
    String[] result = match( lines[i], "<dt class=\"quote\"><a title=\"Click for further information about this quotation\" href=\"/quote/.*\\.html\">.*</a> </dt>" );
    if( result != null ) {
      String[] tokenized = splitTokens( result[0], "<>" );
      tokenized = splitTokens( tokenized[2], " .!?" );
      return tokenized[tokenized.length-4] + " " + tokenized[tokenized.length-3] + " " + tokenized[tokenized.length-2] + " " +  tokenized[tokenized.length-1];
    }
  }
  
  return "Quote Failure";
}


