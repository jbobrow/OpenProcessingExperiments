
//Name: Fireworks in the Night
//A beautiful night with a fantastic fireworks art. 
//Erase it and start again, and again.

//Global Variables
PImage landscapeBack;

//setup()
void setup(){
  size(720,720);
  colorMode(HSB, 360,100,100,100);
  landscapeBack = loadImage("night.jpg");
  background(landscapeBack);
   //presets
  }

//draw()
void draw(){
  
if(mousePressed){
background(landscapeBack);
  pushMatrix();
  translate(mouseX, mouseY);
  int radius = mouseX-width/2;
  
 //style
  noFill();
  stroke(random(0,90),random(20,80),100,50);
  star(random(-20,20),random(-20,20),radius,radius*0.5,int(random(5,15)));
  stroke(random(90,180),random(20,80),100,50);
  star(random(-20,20),random(-20,20),radius*0.8,radius*0.4,int(random(5,15)));
  stroke(random(180,270),random(20,80),100,50);
  star(random(-20,20),random(-20,20),radius*0.6,radius*0.3,int(random(5,15)));
  stroke(random(270,360),random(20,80),100,50);
  star(random(-20,20),random(-20,20),radius*0.4,radius*0.2,int(random(5,15)));
  stroke(random(0,360),random(20,80),100,50);
  star(random(-20,20),random(-20,20),radius*0.2,radius*0.1,int(random(5,15)));
  fill(0,0,100,30);
  star(random(-20,20),random(-20,20),radius*0.1,radius*0.05,int(random(5,15)));
  popMatrix();
}
}

//keyPressed()

void keyReleased(){
  if(key == DELETE || key == BACKSPACE) {
    background(landscapeBack);
  }  
  if(key == 's' || key == 'S') saveFrame("screenshot.png");
}



//star definition
void star(float x, float y, float radius1, float radius2, int npoints) {
  float angle = TWO_PI / npoints;
  float halfAngle = angle/2.0;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius2;
    float sy = y + sin(a) * radius2;
    vertex(sx, sy);
    sx = x + cos(a+halfAngle) * radius1;
    sy = y + sin(a+halfAngle) * radius1;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}

