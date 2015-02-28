
// Copyright Shannon Impellicceiri 2014
// Computer Arts with Processing T/H 11:30-1:30
// ICE #5
// 1/30/14

float x, y, dx, wd, ht; 
color bgColor, ellipseColor;

void setup( ) {
  size( 400, 400 ); 
  background( 0 ); 
  wd = 39; 
  ht = 29; 
  x = wd/2;
  y = height/2;
  dx = 1;
  bgColor = color( 0, 10 ); 
  ellipseColor = color(255, 0, 0 ); 
  noStroke ( );
}

void draw( ) {
  prepareWindow( ); 
  moveEllipse( ); 
  drawEllipse( );
}

void prepareWindow() {
  fill(bgColor);
  rect(0,0,width,height);
}

void moveEllipse(){
  x += dx;
  
  // if the ellipse is too far to the right
  if(x>(width-(wd/2))){
    // move left
    dx = dx*-1;
  }else if(x<(wd/2)){ // if the ellipse is too far to the left
    // move right
    dx = dx*-1;
  }
}

void drawEllipse(){
  fill(ellipseColor);
  ellipse(x,y,wd,ht);
}

void keyPressed(){
  if(key=='+'){
    if(dx>=0){ // if ellipse is stopped or moving right, move faster right
      dx++;
    }else if(dx<0){ // if ellipse is moving left, move faster left
      dx--;
    }
  }else if(key =='-'){
    if(dx>=0){ // if ellipse is stopped or moving right, move slower right
      dx--;
    }else if(dx<0){ // if ellipse is moving left, move slower left
      dx++;
    }
  }
}


