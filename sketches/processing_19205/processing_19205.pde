
float angle = 0.0;
float x = 60;
 
  
void setup() {
 
  size(250, 250);
  smooth();
  background(200);
  frameRate(170);
  //fill(#4ECBFA,40);
  strokeWeight(.1);
//noCursor();
}
 
 
void draw() {
  translate(mouseX, mouseY);
  rotate(angle);
  line(-18, -15, x, x);
  angle += random(0.9);
  x-=0.1;
  if (x<0){
    x=60;}
  if (mousePressed == true){
    background(200);
  }
}

  

