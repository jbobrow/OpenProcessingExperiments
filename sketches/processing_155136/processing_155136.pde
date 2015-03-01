
/*
   Use keys 0 - 9 for variations
   color (alpha-value) and shape vary with mouse position (diagonal)        
*/
triangleShape tri; 
float seite;         // side length of one triangle
float radius;        
float hoehe;         // height of one triangle
float canvDiag;      // canvas diagonal
int mode = 0; 

void setup() {
  size(500, 500); 
  background(255); 
  noStroke(); 
  smooth(); 
  canvDiag = sqrt(width*width + height*height); 

  seite = 45; 
  radius = sqrt(3.0) / 3.0 * seite; 
  hoehe = sqrt(3.0) / 2.0 * seite; 
  tri = new triangleShape(seite);
}

void draw() {
  background(255); 

  float angle1 = 0;
  float angle2 = 0; 
  float angle3 = 0; 
  float alpha; 
  float d;  
  int i = 0;  
  float mx, my, mxStart;   

  for (my = radius; my < height+hoehe; my += hoehe) {
    mxStart = (i%2 == 0) ? seite/2 : 0; 

    for ( mx = mxStart; mx < width+seite; mx += seite) {
      d = dist(mouseX, mouseY, mx, my);      
      if (mode == 0) { 
        angle1 = map(d, 0, canvDiag, 1, 0); 
        angle2 = 0.5; 
        angle3 = 0.5;
      }
      if (mode == 1) { 
        angle1 = map(d, 0, canvDiag, 0, 1); 
        angle2 = 0.5; 
        angle3 = 0.5;
      }
      if (mode == 2) { 
        angle1 = map(d, 0, canvDiag, 1, 0); 
        angle2 = 0.5; 
        angle3 = 1 - angle1;
      }
       if(mode == 3){
        angle1 = 0.5;
        angle2 = (i%2 == 0) ? map(d, 0, canvDiag, 0, 1) : map(d, 0, canvDiag, 1, 0);
        angle3 = 0.5;
      } 
      if (mode == 4) { 
        angle1 = map(d, 0, canvDiag, 0, 1); 
        angle2 = 0.5; 
        angle3 = 1 - angle1;
      }
      if(mode == 5){
        angle1 = (i%2 == 0) ? map(d, 0, canvDiag, 0, 1) : map(d, 0, canvDiag, 1, 0);
        angle2 = 0.5; 
        angle3 = 0.5;
      }     
      if (mode == 6) { 
        angle1 = map(d, 0, canvDiag, 1, 0); 
        angle2 = 1 - angle1; 
        angle3 = 1 - angle1;
      }
      if (mode == 7) { 
        angle1 = map(d, 0, canvDiag, 0, 1); 
        angle2 = 1 - angle1; 
        angle3 = 1 - angle1;
      }
      if (mode == 8) { 
        angle1 = map(d, 0, canvDiag, 1, 0); 
        angle2 = angle1; 
        angle3 = angle1;
      }
      if (mode == 9) { 
        angle1 = map(d, 0, canvDiag, 0, 1); 
        angle2 = angle1; 
        angle3 = angle1;
      }
      alpha = map(d, 0, canvDiag, 255, 75);
      fill(0, alpha); 
      tri.drawTriangle(mx, my, angle1, angle2, angle3);
    }
    i++;
  }

}

void keyReleased() {
  switch(key) {
  case '0': 
    mode = 0; 
    break; 
  case '1': 
    mode = 1; 
    break;
  case '2': 
    mode = 2; 
    break; 
  case '3': 
    mode = 3; 
    break; 
  case '4': 
    mode = 4; 
    break;
  case '5': 
    mode = 5; 
    break; 
  case '6': 
    mode = 6; 
    break; 
  case '7': 
    mode = 7; 
    break; 
  case '8': 
    mode = 8; 
    break;   
  case '9': 
    mode = 9; 
    break; 
  default: 
    mode = 0;
    break; 
  }
}


class triangleShape {
  PVector[] dreieck = new PVector[3];
  PVector[] bezier1 = new PVector[4];
  PVector[] bezier2 = new PVector[4];
  PVector[] bezier3 = new PVector[4];
  float seite; 
  float radius;

  triangleShape(float _a) {
    float x, y;  
    float angle;   

    seite = _a; 

    radius = sqrt(3.0) / 3.0 * _a; 

    /* Eckpunkte Dreieck */
    angle = -PI/2; 
    for (int i = 0; i < 3; i++) {
      x = cos(angle) * radius;
      y = sin(angle) * radius;
      dreieck[i] = new PVector(x, y);
      angle += radians(120);
    }

    /* Bezier-Punkte pro Dreieckseite */
    bezier1 = createBezierPoints(dreieck[0], dreieck[1]); 
    bezier2 = createBezierPoints(dreieck[1], dreieck[2]);
    bezier3 = createBezierPoints(dreieck[2], dreieck[0]);
  }

  PVector[] createBezierPoints(PVector _dr1, PVector _dr2) {
    PVector x_4, d, senkr; 
    PVector[] bezier = new PVector[4]; 

    x_4 = PVector.lerp(_dr1, _dr2, 0.25);
    d = PVector.sub(_dr2, x_4);            //Differenz-Vektor
    d.normalize();
    d.mult(seite / 4);  
    senkr = new PVector(-d.y, d.x);        //Senkrechte

    bezier[0] = new PVector(x_4.x + senkr.x, x_4.y + senkr.y);   
    bezier[2] = new PVector(x_4.x - senkr.x, x_4.y - senkr.y);

    x_4 = PVector.lerp(_dr1, _dr2, 0.75);
    d = PVector.sub(_dr2, x_4);
    d.normalize();
    d.mult(seite / 4);  
    senkr = new PVector(-d.y, d.x);   

    bezier[1] = new PVector(x_4.x + senkr.x, x_4.y + senkr.y);   
    bezier[3] = new PVector(x_4.x - senkr.x, x_4.y - senkr.y);

    return bezier;
  }

  void drawTriangle(float _mx, float _my, float _f1, float _f2, float _f3) {
    float cx1, cy1, cx2, cy2; 
    float factor = abs(_f1);         
    
    //fill(0); 
    pushMatrix();
    translate(_mx, _my); 
    
    beginShape(); 
    vertex(dreieck[0].x, dreieck[0].y);         
    cx1 = lerp(bezier1[0].x, bezier1[2].x, factor);
    cy1 = lerp(bezier1[0].y, bezier1[2].y, factor); 
    cx2 = lerp(bezier1[1].x, bezier1[3].x, factor);
    cy2 = lerp(bezier1[1].y, bezier1[3].y, factor);
    bezierVertex(cx1, cy1, cx2, cy2, dreieck[1].x, dreieck[1].y); 
    
    factor = abs(_f2); 
    cx1 = lerp(bezier2[0].x, bezier2[2].x, factor);
    cy1 = lerp(bezier2[0].y, bezier2[2].y, factor); 
    cx2 = lerp(bezier2[1].x, bezier2[3].x, factor);
    cy2 = lerp(bezier2[1].y, bezier2[3].y, factor);
    bezierVertex(cx1, cy1, cx2, cy2, dreieck[2].x, dreieck[2].y);    
       
    factor = abs(_f3); 
    cx1 = lerp(bezier3[0].x, bezier3[2].x, factor);
    cy1 = lerp(bezier3[0].y, bezier3[2].y, factor); 
    cx2 = lerp(bezier3[1].x, bezier3[3].x, factor);
    cy2 = lerp(bezier3[1].y, bezier3[3].y, factor);
    bezierVertex(cx1, cy1, cx2, cy2, dreieck[0].x, dreieck[0].y);
    endShape(CLOSE);
    popMatrix(); 
  }
}



