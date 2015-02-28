
/** Mandala Creation
* By Joe Nelson
* Created Sept. 15, 2010
*/

void setup() {
  size(400, 400);
  background(250);
  fill(247, 112, 0);
  smooth();
  ellipse(width/2, height/2, 350, 350); 
  
  polygon((width/2), (height/2), int(6), (PI/2), (174));
}

void  polygon(float originX, float originY, int sides, float theta, float radius) {
  float x = 0;
  float y = 0;
  beginShape();
  fill(0, 0, 180);
  for(int i=0; i<sides; i++) {
      x = originX + cos(theta)*radius;
      y = originY + sin(theta)*radius;
    vertex(x, y);
    theta += TWO_PI/sides;
  }
  endShape(CLOSE);
  
  {
    fill(0, 200, 0);
  smooth();
  ellipse(width/2, height/2, 220, 220);
  }
  
  fill(150, 0, 0);
  makePoly(width/2, height/2, 6, 109);
}

void makePoly(int x, int y, int points, float radius){
  float px=0, py=0;
  float angle = 9.5*PI;
  beginShape();
  
  for (int i=0; i<points; i++){
    px = x+cos(radians(angle))*radius;
    py = y+sin(radians(angle))*radius;
    vertex(px, py);
    angle+=360/points;
  }
  endShape(CLOSE);
  
 {
   fill(255);
   smooth();
   ellipse(width/2, height/2, 110, 110);
 }
 
fill(135, 0, 175);
  makePoly2(width/2, height/2, 6, 55);
}

void makePoly2(int x, int y, int points, float radius){
  float px=0, py=0;
  float angle = 9.5*PI;
  beginShape();
  
  for (int i=0; i<points; i++){
    px = x+cos(radians(angle))*radius;
    py = y+sin(radians(angle))*radius;
    vertex(px, py);
    angle+=360/points;
  }
  endShape(CLOSE);
  
  strokeWeight(1.5);
  line(width/2, 27, width/2, 89);
 
 strokeWeight(1.5);
line(295, 145, 350, 112); 

strokeWeight(1.5);
line(295, 255, 350, 289);

strokeWeight(1.5);
line(width/2, 311, width/2, 373);

strokeWeight(1.5);
line(105, 255, 50, 286);

strokeWeight(1.5);
line(105, 145, 50, 112);

translate(width/2, height/2);
rotate(.5);
fill(230, 230, 0);
ellipse(0, -90, 40, 170); 

rotate(1.05);
fill(230, 230, 0);
ellipse(0, -90, 40, 170);

rotate(1.1);
fill(230, 230, 0);
ellipse(0, -90, 40, 170);

rotate(1);
fill(230, 230, 0);
ellipse(0, -90, 40, 170);

rotate(1.05);
fill(230, 230, 0);
ellipse(0, -90, 40, 170);

rotate(1.07);
fill(230, 230, 0);
ellipse(0, -90, 40, 170);

fill(0);
ellipse(0, 0, 10, 10);
 
}



