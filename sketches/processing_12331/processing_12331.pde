
/*
/Jake Winstel
/Mandala Project
*/

void setup() {
  size(800, 800);
  background(255, 0, 0);
  smooth();
  backCircles(width/2, height/2, 700, 700, color(120, 10, 200), color(255));
  backCircles(width/2, height/2, 600, 600, color(15, 10, 230), color(255));
  backCircles(width/2, height/2, 500, 500, color(10, 230, 230), color(255));
  backCircles(width/2, height/2, 400, 400, color(50, 200, 30), color(255));
  backCircles(width/2, height/2, 300, 300, color(255, 230, 0), color(255));
  backCircles(width/2, height/2, 200, 200, color(255, 130, 0), color(255));
  backCircles(width/2, height/2, 100, 100, color(255, 0, 0), color(255));
  
  polyStar(width/2, height/2, 10, 400, -200, color(10, 145, 60), PI/2);
  polyStar(width/2, height/2, 10, 300, -175, color(255, 200, 0), PI);
  
  polygon(60, 60, 3, 70, color(255, 255,0), PI/2);
  polygon(740, 60, 3, 70, color(255, 255,0), PI/2);
  polygon(740, 730, 3, 70, color(255, 255,0), PI/2);
  polygon(60, 730, 3, 70, color(255, 255,0), PI/2);
}

void backCircles(float originX, float originY, float ellipseWidth, float ellipseHeight, color fillColor, color strokeColor){
  stroke(strokeColor);
  fill(fillColor);
  beginShape();
  ellipse(originX, originY, ellipseWidth, ellipseHeight);
  endShape();
}

void polyStar(float x, float y, int pts, float outerRad, float innerRad, color fillCol, float theta){
    float px = 0.0;
    float py = 0.0;
    fill(fillCol);
    float vertices = pts*2;
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
  
  void polygon( float x, float y, int sides, float radius, color fillCol, float theta){
    float px = 0.0;
    float py = 0.0;
    fill(fillCol);
    beginShape();
    for(int i=0; i<sides; i++){
      px = x + cos(theta)*radius;
      py = y + sin(theta)*radius;
      vertex(px, py);
      theta += TWO_PI/sides;
    }
    endShape(CLOSE);
  }
 
    
  
  
  


