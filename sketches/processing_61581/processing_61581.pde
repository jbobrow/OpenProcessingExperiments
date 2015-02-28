
void setup() { background(0); size (400,400);  smooth();  noCursor(); }
 
void draw() {
  noStroke();  fill(255);
//rect(0,0,width, height);
   
 
   
if(mousePressed)  {
  ellipse(mouseX, mouseY,20,20);
  fill(0,30);
  stroke(255);
  noCursor ();
}
 
else {
 ellipse(mouseX, mouseY,110,110);
  fill(0);
  stroke(255,80);
}
 
 ellipse(mouseX, mouseY,100,100);
}
