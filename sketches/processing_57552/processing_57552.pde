

Graph graph;
int[] barValues;
boolean graphGridUpdated = false;
color BACKGROUND_COLOR = color (171,185,199); //color( 191,195,219);
int barMaxWidth = 305;
int barMinWidth = 10;
float cmillis = 0;

void setup(){
  frameRate( 30 );
  smooth();
  size(400,400);
  
  barValues = new int[8];
   for ( int c = 0; c < 8 ; c++ ) {
     barValues[c] = floor( random(0,0.99999)*8 );
     //print( barValues[c] +", " );
   }
   //println();
  graph = new Graph();
  graph.setWidthBounds(barMinWidth,barMaxWidth); 
  graph.setPosition(30,40);
  updateGraphValues();
  
  color[] cColors = { color(204,254,167) , color(199,252,170) , color(194,250,173) , color(189,248,176) , color(184,246,179) , color(179,244,182) ,  color(174,242,185) , color(169,240,188) };
  graph.setColors( cColors );
  
}
void draw(){ 
  noStroke();
  fill( BACKGROUND_COLOR);
  rect(0,0,width,height);
  
  drawGraphDeco();
  graph.update();
  
  if( (floor(millis()/1000) - (floor(cmillis/1000)+1)) == 1 ) {
    cmillis = millis();
    updateGraphValues();
    //print( " >>> " );
  }
  //println( floor(millis()/1000) + " - " + (floor(cmillis/1000)+1) );
  
}
void updateGraphValues(){
  float[] barValuesPercent = new float[8];
   for ( int c = 0; c < 8 ; c++ ) {
     barValuesPercent[c] = map(random(8),0,7,0,100);
     //print( barValuesPercent[c] +", " );
   }
  graph.setValues( barValuesPercent ); 
}

void drawGraphDeco(){
  strokeCap( PROJECT );
  strokeWeight(1);
  stroke(255);
  noFill();
  line( 20 , 30 , 20 , 30+(8*25)+15 );
  line( 20 , 30+(8*25)+15, 380, 30+(8*25)+15 );
  stroke(255, 255, 255, 100);
  for( int c = 0; c < 8; c++ ) {
    line( 30+(barMinWidth/2) + (c*((barMaxWidth-(barMinWidth/2))/7)) , 30, 30+(barMinWidth/2) + (c*((barMaxWidth-(barMinWidth/2))/7)) , 30+(8*25)+15 );
  }
}








/********************/

class Graph {
  int x, y, maxWidth, minWidth = 0;
  int barHeight = 20;
  int barGap = 5;
  float[] values, currentValues;
  color[] colors;
  boolean hasPreviousValues = false;
  boolean USE_GRADIENT = true;
  float animationDelay = 0.3;

  Graph() {
    minWidth = 10;
    maxWidth = 400;
  }

  void setPosition ( int newX, int newY ) {
    x = newX;
    y = newY;
  }
  
  void setWidthBounds( int minW, int maxW ){
    maxWidth = maxW;
    minWidth = minW;
  }
  
  void setValues ( float[] newValues ) {
    values = normalizeValues(newValues);
    if (!hasPreviousValues) {
      hasPreviousValues = true;
      currentValues = new float[values.length];
      for ( int c = 0; c < values.length ; c++ ) {
        currentValues[c] = 0;
      }
    }
    else { // PENDIENTE
      if ( values.length > currentValues.length ) {
      }
      else if ( values.length < currentValues.length ) {
      }
    }
  }
  float[] normalizeValues( float[] newValues ){
    float[] processedValues = new float[newValues.length];
    //println();
    for ( int c = 0; c < newValues.length ; c++ ) {
      processedValues[c] = map( newValues[c] , 0,100, minWidth , maxWidth );
      //print( processedValues[c] +", " );
    }
    return processedValues;
  }
  void setColors ( color[] newColors ) {
    colors = newColors;
  }

  void update() {
    pushMatrix();
      translate(x, y);
      float value;
      for ( int c = 0; c < values.length ; c++ ) {
        value = ((values[c] - currentValues[c])*animationDelay);
        currentValues[c] += value;
        drawBar( c * ( barGap+barHeight) , currentValues[c] , colors[c] );
      }
    popMatrix();
  }

  void drawBar( float cY, float cW, color cColor ) {
    if( !USE_GRADIENT ){
      noStroke();
      fill( cColor );
      rect( 0, cY, cW , barHeight );
    }else{
      noFill();
      strokeCap( PROJECT );
      strokeWeight(1);
      for( int c = 0; c < barHeight ; c++ ){
        stroke( lerpColor( cColor , color(0) , c*0.025) );
        line( 0 , cY+c, cW, cY+c );
      }
    }
  }
  
  color[] getColors(){  return colors;  }
  
}




