
float a = 0.0;
float s = 0.0;
int starcolor;
int bordercolor;

void setup() {
  size(700, 400);
}

void draw() {
  background(85,127,54);
  
  //we need to calculate the scale
  a = a + 0.04;
  s = cos(a)*1.8;

  translate(width/2, height/2);
  scale(s); 
  drawstar(100,0);

  translate(75, 0);
  scale(s);
  drawstar(233,200);
  






}







 
void drawstar(int starcolor, int bordercolor){ 
  fill(starcolor);
  stroke(bordercolor);
  strokeWeight(4);
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
 }
  


