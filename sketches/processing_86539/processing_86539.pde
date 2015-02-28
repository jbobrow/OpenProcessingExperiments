
int RED = 50;
int BLUE = 60;
int GREEN = 20;
int ellipsesize = 120;

void setup(){
 size(600,500);
 background (RED, GREEN, BLUE);
}

void draw(){
  background (RED, GREEN, BLUE);
  println (mouseX + "" + mouseY); //gives mouse control over the associated co-ordinates
  fill(99, 183, 72); //R,G,B values for the shapes
  noStroke (); //removes any stroke from the shapes
rect(50, 100, 65, 300);
ellipse(mouseX, mouseY, ellipsesize, ellipsesize);

strokeWeight (5);
stroke(mouseX, mouseY, mouseY-mouseX); //gives mouse movement control over colour
line(100, 100, 260, 100);
  
}




