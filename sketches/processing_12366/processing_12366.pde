
/*
Sam Wood
CSE 1341 - Lab 3
9/22/10
*/

/* good amount of code borrowed from Ira Greenburg and then revised */

void setup(){
  size(500, 500);
  background(183, 211, 255);
  smooth(); 
  color efc = color(180, 32, 2);
  color esc = color(198, 166, 0);
  color psfc = color(11, 77, 134, 160);
  color pssc = color(98, 56, 17);
  color pgfc = color(10, 113, 14);
  color pgsc = color(3, 111, 65); 
  fill(efc);
  stroke(esc);
  strokeWeight(5);
  ellipse(width/2, height/2, 400, 400);
  PVector v = new PVector(width/2, height/2);
  // repeatingPolygon(x and y coords, # of shapes, radius of circle of shapes)
  repeatingPolygon(v, 30, 130);
  polyStar1(width/2, height/2, 8, 195, 75, psfc, pssc, 2.5, PI/4.0);
  psfc = color(198, 159, 0);
  pssc = color(170, 34, 0);
  polyStar2(width/2, height/2, 8, 225, 30, psfc, pssc, 2.5, PI/8.0);
  
}    

void repeatingPolygon(PVector vec, int vertices, float radius){
  fill(0, 70, 33, 15);
  stroke(0, 70, 0);
  strokeWeight(1);
  // local variables
  float theta = 0.0;
  float px = 0.0;
  float py = 0.0;
  
  for(int i=0; i<vertices; i++){
    px = vec.x + cos(theta)*radius;
    py = vec.y + sin(theta)*radius;
    drawPolygon(px, py, 8, 50);
    theta+=TWO_PI/vertices;
  }
  
}

void drawPolygon(float x, float y, float sides, float radius){
  float theta = 0.0;
  float px = 0.0;
  float py = 0.0;
  
  beginShape();
  for(int i=0; i<50; i++){
    px = x + cos(theta)*radius;
    py = y + sin(theta)*radius;
    vertex(px, py);
    theta+=TWO_PI/sides;
  }
  endShape(CLOSE);
}  
  
  void polyStar1(float x, float y, int pts, float outerRad, float innerRad, 
  color fillCol, color strokeCol, float strokeWt, float theta){
    float psx = 0.0;
    float psy = 0.0;
    // vertices is 2 times the outer point count
    float vertices = pts*2;
    fill(fillCol);
    stroke(strokeCol);
    strokeWeight(strokeWt);
    beginShape();
    for(int i=0; i<pts; i++){
      // calculate outer radius
      psx = x + cos(theta)*outerRad;
      psy = y + sin(theta)*outerRad;
      vertex(psx, psy);
      theta += TWO_PI/vertices;
      // calculate inner radius
      psx = x + cos(theta)*innerRad;
      psy = y + sin(theta)*innerRad;
      vertex(psx, psy);
      theta += TWO_PI/vertices;
    }
    endShape(CLOSE);
    
}

void polyStar2(float x, float y, int pts, float outerRad, float innerRad, 
  color fillCol, color strokeCol, float strokeWt, float theta){
    float psx = 0.0;
    float psy = 0.0;
    float vertices = pts*2;
    fill(fillCol);
    stroke(strokeCol);
    strokeWeight(strokeWt);
    beginShape();
    for(int i=0; i<pts; i++){
      psx = x + cos(theta)*outerRad;
      psy = y + sin(theta)*outerRad;
      vertex(psx, psy);
      theta += TWO_PI/vertices;
      psx = x + cos(theta)*innerRad;
      psy = y + sin(theta)*innerRad;
      vertex(psx, psy);
      theta += TWO_PI/vertices;
    }
    endShape(CLOSE);
    
}



        
      
    
  




