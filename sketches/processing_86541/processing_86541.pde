
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
  fill(RED, mouseX - mouseY);
  noStroke (); //removes any stroke from the shapes
 
rect(100, 200, mouseX, mouseY);
ellipse(mouseX, mouseY, ellipsesize, ellipsesize);

strokeWeight (5);
stroke(mouseX, mouseY, mouseY-mouseX); //gives mouse movement control over colour
line(100, 100, mouseY, mouseX);
  
}




