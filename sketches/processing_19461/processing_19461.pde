
color Red= color (255,0,0);
color Green= color (0,255,0);
color Blue= color (0,0,255);
color Postalcolour=color(Red);
PFont font;
float rotates=2;

void setup() {
  size(250,250);
  background(0);
  smooth();
  font=createFont("Futura",40);
 
}



void draw() {
  noStroke();
  fill(0,0,0,20);
  rect(0,0,width,height);
  textMode(CENTER);
  strokeWeight(1);
  stroke(Red);
  rect(1,1,83,83); 
  stroke(Blue);
  rect(0,0,166,166);
  stroke(Green);
  rect(0,0,249,249);
  textFont(font,10);
  
if (mousePressed){
pushMatrix();
translate(mouseX,mouseY);
  rotate(radians(rotates));
  fill(Postalcolour);
  text("L2R 3R9",0,0);
  popMatrix();
  rotates+=10;
  
}
if (mouseX<83||mouseY<83){
Postalcolour=Red;
}
if (mouseX>83&&mouseX<166||mouseY>83&&mouseY<166){
Postalcolour=Blue;
}
if (mouseX>166||mouseY>166){
Postalcolour=Green;
}
}


