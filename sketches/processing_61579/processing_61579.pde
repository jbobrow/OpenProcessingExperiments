
void setup() { background(0); size (400,400);  smooth();  noCursor(); }
 
void draw() {
  noStroke();  fill(200,55,30);
//rect(0,0,width, height);
   
 
   
if(mousePressed)  {
  ellipse(mouseX, mouseY,10,10);
  fill(0,30);
  stroke(255);
  noCursor ();
}
 
else {
 ellipse(mouseX, mouseY,100,100);
  fill(255,60);
  stroke(0);
}
 
 ellipse(mouseX, mouseY,80,80);
}
