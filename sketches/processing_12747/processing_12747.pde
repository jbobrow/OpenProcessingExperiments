
void setup(){
  size(600, 600);
  background(255);
  
  strokeWeight (2.8);
  ellipse(height/2, width/2, 578, 578);
  ellipse(height/2, width/2, 535, 535);
  ellipse(height/2, width/2, 518, 518);
  ellipse(height/2, width/2, 500, 500);
  
  
  color fc = color (255);
  //color sc = color(10, 100, 0);
  for (int i=0; i<10; i++){
    
  /*polyStar(float x, float y, int pts, float outerRad, float innerRad, 
  color fillCol, color strokeCol, float strokeWt, float theta)*/
  color sc = color(0);
  polyStar(width/2, height/2, 16, 280, 215, fc, sc, 8, PI/4.0);
  strokeWeight(2);
  for (int k=0; k<16; k++){
    pushMatrix();
    translate(64, -51);
    rotate(radians(3.5*PI));
    PVector v = new PVector(width/2, height/2);
    calculateVerticesT (v, 16, 207.0);
    popMatrix();
  polyStar(width/2, height/2, 16, 220, 165, fc, sc, 8, PI/4.0);
  polyStar(width/2, height/2, 16, 145, 110, fc, sc, 6, PI/4.0);
  polyStar(width/2, height/2, 16, 90, 72, fc, sc, 5, PI/4.0);
  polyStar(width/2, height/2, 16, 65, 50, fc, sc, 4, PI/4.0);
  }
}
}



