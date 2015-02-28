
 /*Mandala Creation
By: Caroline Sievers
September 15th, 2010
http://www.michaelbrown.org/images/MandalaSwirl-350.gif*/

void setup(){
  size(400,400);
  background(155);
  
  fill(225, 0, 230);
  stroke(255);
  smooth();
  ellipse(200, 200, 350, 350);
  
  fill(0, 75, 235);
  stroke(240, 240, 0);
  smooth();
  ellipse(200, 200, 315, 315);
  
  fill(255, 0, 230);
  stroke(240, 240, 0);
  smooth();
  ellipse(200, 200, 285, 285);
  
  fill(0, 75, 235);
  stroke(240, 240, 0);
  smooth();
  ellipse(200, 200, 260, 260);
  
  fill(255, 0, 230);
  stroke(240, 240, 0);
  smooth();
  ellipse(200, 200, 235, 235);
  
  fill(0, 75, 235);
  stroke(240, 240, 0);
  smooth();
  ellipse(200, 200, 215, 215);
  
  smooth();
  polyStar((float)width/2, (float)height/2, 8, 170.0, 90.0, color(0, 75, 235), color(240, 240, 0), 3.2, 40);
  
  //inside polyStar that is purple
  smooth();
  noStroke();
  polyStar2((float)width/2, (float)height/2, 8, 80.0, 60.0, color(225, 0, 230), 20);
  
  //inside polyStar that is blue with yellow stroke
  smooth();
  polyStar3((float)width/2, (float)height/2, 8, 60.0, 45.0, color(0, 75, 235), color(240, 240, 0), 2.7, 5.05);
  
  //top ellipse
  fill(225, 0, 230);
  noStroke();
  smooth();
  ellipse(194, 90, 25, 25);
  
  //1st clockwise ellipse
  fill(225, 0, 230);
  noStroke();
  smooth();
  ellipse(272, 120, 25, 25);
  
  //2nd clockwise ellipse
  fill(225, 0, 230);
  noStroke();
  smooth();
  ellipse(312, 194, 25, 25);
  
  //3rd clockwise ellipse
  fill(225, 0, 230);
  noStroke();
  smooth();
  ellipse(281, 272, 25, 25);
  
  //4th clockwise ellipse
  fill(225, 0, 230);
  noStroke();
  smooth();
  ellipse(207, 315, 25, 25);
  
  //5th clockwise ellipse
  fill(225, 0, 230);
  noStroke();
  smooth();
  ellipse(128, 282, 25, 25);
  
  //6th clockwise ellipse
  fill(225, 0, 230);
  noStroke();
  smooth();
  ellipse(88, 207, 25, 25);
  
  //7th clockwise ellipse
  fill(225, 0, 230);
  noStroke();
  smooth();
  ellipse(119, 127, 25, 25);
  
  fill(0, 95, 235);
  noStroke();
  smooth();
  ellipse(200, 200, 60, 60);
  
  fill(225, 0, 230);
  noStroke();
  smooth();
  ellipse(200, 200, 25, 25);
  
 
  
 
}

void polyStar(float x, float y, int pts, float outerRad, float innerRad, 
  color fillCol, color strokeCol, float strokeWt, float theta){
    float px = 200.0;
    float py = 200.0;
    // vertices is 2 times the outer point count, 8 pts
    float vertices = pts*2;
    fill(fillCol);
    stroke(strokeCol);
    strokeWeight(strokeWt);
    beginShape();
    for(int i=0; i<pts; i++){
      // calculate outer radius
      px = x + cos(theta)*outerRad;
      py = y + sin(theta)*outerRad;
      vertex(px, py);
      theta += TWO_PI/vertices;
      // calculate inner radius
      px = x + cos(theta)*innerRad;
      py = y + sin(theta)*innerRad;
      vertex(px, py);
      theta += TWO_PI/vertices;  
    
  }
  endShape(CLOSE);
  }
  
void polyStar2(float x, float y, int pts, float outerRad, float innerRad, 
  color fillCol, float theta){
    float px = 200.0;
    float py = 200.0;
    // vertices is 2 times the outer point count, 8 pts
    float vertices = pts*2;
    fill(fillCol);
    
    beginShape();
    for(int i=0; i<pts; i++){
      // calculate outer radius
      px = x + cos(theta)*outerRad;
      py = y + sin(theta)*outerRad;
      vertex(px, py);
      theta += TWO_PI/vertices;
      // calculate inner radius
      px = x + cos(theta)*innerRad;
      py = y + sin(theta)*innerRad;
      vertex(px, py);
      theta += TWO_PI/vertices;  
    
  }
  endShape(CLOSE);
  }
  
void polyStar3(float x, float y, int pts, float outerRad, float innerRad, 
  color fillCol, color strokeCol, float strokeWt, float theta){
    float px = 200.0;
    float py = 200.0;
    // vertices is 2 times the outer point count, 8 pts
    float vertices = pts*2;
    fill(fillCol);
    stroke(strokeCol);
    strokeWeight(strokeWt);
    beginShape();
    for(int i=0; i<pts; i++){
      // calculate outer radius
      px = x + cos(theta)*outerRad;
      py = y + sin(theta)*outerRad;
      vertex(px, py);
      theta += TWO_PI/vertices;
      // calculate inner radius
      px = x + cos(theta)*innerRad;
      py = y + sin(theta)*innerRad;
      vertex(px, py);
      theta += TWO_PI/vertices;  
    
  }
  endShape(CLOSE);
  }

