
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
 // fill(30, 60, 20);
  noStroke (); //removes any stroke from the shapes
 
rect(100, 200, mouseX, mouseY);
ellipse(mouseX, mouseY, 100, 100);

strokeWeight (5);
stroke(mouseX, mouseY, mouseY-mouseX); //gives mouse movement control over colour
line(100, 100, mouseX, mouseY);
 
if (mouseX < width/2){
fill (0, 0, 100);
ellipse (mouseX, mouseY, 20, 20);

 }else{
  fill (100, 0, 0);
  ellipse (mouseY, 200, 100, 100);
 }
  
  
}




