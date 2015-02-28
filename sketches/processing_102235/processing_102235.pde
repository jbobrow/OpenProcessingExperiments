
float offset = 100;
float xpos1;
float ypos1;
float xpos2;
float ypos2;
float xpos3;
float ypos3;

float ds;

void setup() {
  size(300,300);
}
 
void draw() {
  background(0);
  stroke(200);
  translate (width/2, height/2 + offset);
  
  int xtop = 0;
  float ytop = -offset*2;  
  ds = 3;
  
  xpos1 = cos(frameCount*0.03)*offset;
  ypos1 = sin(frameCount*0.03)*offset*0.20;
  
  xpos2 = cos((frameCount+60)*0.03)*offset;
  ypos2 = sin((frameCount+60)*0.03)*offset*0.20;
  
  xpos3 = cos((frameCount+120)*0.03)*offset;
  ypos3 = sin((frameCount+120)*0.03)*offset*0.20;
  
  
  line (xtop, ytop, xpos1, ypos1);
  line (xtop, ytop, xpos2, ypos2);
  line (xtop, ytop, xpos3, ypos3);
  line (xpos3, ypos3, xpos1, ypos1);
  line (xpos1, ypos1, xpos2, ypos2);
  line (xpos2, ypos2, xpos3, ypos3);
  
  ellipse (xtop, ytop, ds, ds);
  ellipse (xpos1, ypos1, ds, ds);
  ellipse (xpos2, ypos2, ds, ds);
  ellipse (xpos3, ypos3, ds, ds);
}
