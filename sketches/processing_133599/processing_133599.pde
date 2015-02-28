
Hair[] myHairs;

void setup(){
  size( 800, 400 );
  
  myHairs = new Hair[100];
  for( int i=0; i<myHairs.length; i=i+1){
    float newX = map( i, 0, myHairs.length, 0, width );
    float newRed = map( i, 0, myHairs.length, 0, 255 );
    color newColor = color( newRed, 0, 255 );
    myHairs[i] = new Hair( newX, newColor );
  }
}

void draw(){
  fill( 50, 1 );
  rect( 0, 0, width, height );
  
  for( int i=0; i<myHairs.length; i=i+1){
    myHairs[i].update();
    myHairs[i].display();
  }
}

class Hair {
  float x;
  float y;
  color fillColor;
  
  // constructor
  Hair( float theX, color theColor ){
    x = theX;
    y = 0;
    fillColor = theColor;
  }
  
  void update(){
    x = x + random(-1,1);
    y = y + random(-1,1) + 2;
  }
  
  void display(){
    noStroke();
    fill(fillColor);
    ellipse( x, y, 4, 4 );
  }
}



