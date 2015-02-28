
PFont font;
float spin = 10.0; 
float diameter = 20.0; 
float angle;

float angle_rot; 
int rad_points = 150;

void setup() 
{
  size(600, 300);
  noStroke();
  smooth();
}

void draw() 
{ 
  background(#003030);
  font = loadFont("Chronicle.vlw"); 
  
  translate(150, 150);
  
  fill(#FFFFFF);
  ellipse(0, 0, 15, 15);
  
  angle_rot = 0;
  fill(51);

  for(int i=0; i<5; i++) {
    pushMatrix();
    rotate(angle_rot + -105);
    ellipse(-116, 100, diameter, diameter);
    popMatrix();
    angle_rot += PI*4/9;
  }
  
  //font edit
textFont(font, 80); 
text("Pulse", 170, 40);



  diameter = 45 * sin(angle) + 168;
  
  angle += 0.09;
  if (angle > TWO_PI) { angle = 0; }
}





