
void setup() {
  size(800, 800);
  background(255);
  rectMode(CENTER);
  noFill();
  strokeWeight( 0.1 );
}
float a=0;
void draw() {
 
  fill(255, 255, 255, 100);
  noStroke();
  triangle(width/1, height/1, width, height);
 
 
  translate(width/1, height/1);
 
  drawFlake(  );
}
 
void drawFlake(  ) {
  noFill();
  strokeWeight( 0.1 );
  stroke(0);
 
  for ( int arm=0; arm <6; arm++) { 
    drawArm();
    rotate( radians( 360/6) );
  }
}
void drawArm( ) {
  pushMatrix();
  for (int i=0;i<3;i++) {
    pushMatrix();
    drawFeather( 9, 8, 6, 17 );
    drawFeather( 9, -8, 6, 17 ); 
    popMatrix();
 
    translate(70, 0);
 
    pushMatrix();
    drawFeather( 9, 8, 2, 4 );
    drawFeather( 9, -8, 2, 4 );
    popMatrix();
    translate(20, 0);
  } 
  popMatrix();
}
 
void drawFeather( int len, int toruosity, int min, int max) {
  float wooble = 1.4;
  pushMatrix();
  for (int part=0; part<len; part++) {
    float size = map( part, 0, len, min, max);
    rect( random(-wooble, wooble), random(-wooble, wooble), size, size);
     
//  ellipse( random(-wooble, wooble), random(-wooble, wooble), size, size);
     
    rotate( radians(toruosity) );
    translate(size, 0);
  }
  popMatrix();
}
