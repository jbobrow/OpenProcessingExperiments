

float tx = 0.;
float ty = 0.;
float sx = 0.05;
float sy = 0.101;


void setup()
{
  size(600, 600);
  smooth();
  background(255);
  
}

void draw(){
 
  
  float xpos = map(sin(tx), -1., 1., 0, width);
  float ypos = map(sin(ty), -1., 1., 0, height);
  
  float distance = dist(xpos, ypos, width / 2, height / 2);
  int fcolor = (int)map(distance, 0, width / 2, 255, 180 );
  
  fill(fcolor);
  ellipse(xpos, ypos-height/2, 2, 2); 
  noFill();
  strokeWeight(ypos/height );
  stroke(ypos/width);
  stroke(color(0,50,fcolor));
  bezier(800, xpos/2-10, 400 , 10, 400+ypos, 800,0, 10+xpos); 
  tx = tx + sx;
  ty = ty + sy;
   
}

void mousePressed() {
  
  background(255);
  sx = random(0., 0.2);
  sy = random(0., 0.2);  
  
}


