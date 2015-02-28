


void setup() {
size(500,500);
smooth();
strokeWeight(15);
stroke(0,100);
}
void draw() {
  background(226);
 
 //left eye 
 ellipse(100,100,110,55);
 //right eye
 ellipse(240,100,110,55);
 //linke Pupille
 int m=constrain(mouseX,80,120);
 int n=constrain(mouseY,96,104);
 ellipse(m,n,20,20);
 //rechte Pupille
 int o=constrain(mouseX,220,260);
 int p=constrain(mouseY,96,104);
 ellipse(o,p,20,20);
//Nose
triangle(170,130,210,180,130,180);
ellipse(170,230,70,15);
rectMode(CENTER);
rect(100,40,70,0);
rect(240,40,70,0);
}


void mousePressed() {
  ellipse(170,270,60,90);
   
  }
  





