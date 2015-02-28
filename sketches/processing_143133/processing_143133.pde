
float a,b;
float x;

float angle,angle2,angle3;
float px, py, px1, px2, py2, px3, py3;
float radius = 50;
void setup() {
  size(640, 360, P2D);
  smooth();
  for (int c = 0; c <= 700; c += 300) { 

for (int d = 0; d <= 600; d += 150) { 

      


    } 


  } 

}



void draw() {
  background(175, 100, 220);
  translate(mouseX, mouseY);
  
  a=mouseX;
  b=mouseY;
  
  radius=sqrt(sq(a/2)+sq(b/2));
  angle--; 


  angle2-=2; 


  angle3-=3; 
  
  
  px = 360+ cos(radians(angle))*(radius)/2; 


  py = 240 + sin(radians(angle))*(radius)/2; 
  px2 = 360+ cos(radians(angle2))*(radius); 
  py2 = 240 + sin(radians(angle2))*(radius); 
  px3 = 360+ cos(radians(angle3))*(radius)/4; 
  py3 = 240 + sin(radians(angle3))*(radius)/2; 


  
  fill(RGB);
  stroke(255);
  strokeWeight(2);
  beginShape();
  vertex(0, py3);
  fill(190, 6, py);
  vertex(14, -20);
  vertex(47, -15);
  fill(py3, 150, 6);
  vertex(23, 7);
  vertex(29, 40);
  vertex(0, 25);
  vertex(-29, 40);
  vertex(-23, 7);
  vertex(-47, -15);
  vertex(-14, -20);
  endShape(CLOSE);
  
  beginShape();
  vertex(0, -50);
  vertex(14, -20);
  vertex(47, -15);
  vertex(23, 7);
  vertex(29, 40);
  vertex(0, 25);
  vertex(-29, 40);
  vertex(-23, 7);
  vertex(-47, -15);
  vertex(-14, -20);
  endShape(CLOSE);
  
  //heart
   fill(RGB);
      beginShape();
      vertex(50, 15);
      fill(150, 0, 0);
      bezierVertex(50, -5, 90, 5, 50, 40);
      vertex(50, 15);
      fill(150, 0, py);
      bezierVertex(50, -5, 10, 5, 50, 40);
      endShape();



}



