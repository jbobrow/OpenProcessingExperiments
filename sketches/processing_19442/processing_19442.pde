
color Red= color (255,0,0);
color Green= color (0,255,0);
color Blue= color (0,0,255);
color Postalcolour=color(Red);
PFont font;


void setup() {
  size(250,250);
  background(0);
  smooth();
  font=createFont("Futura",40);
  fill(Red);
  rect(0,0,20,20);
  fill(Green);
  rect(20,0,20,20);
  fill(Blue);
  rect(40,0,20,20);
}



void draw() {
  noStroke();
  fill(0,0,0,20);
  rect(0,0,width,height);
   fill(Red);
  rect(0,0,20,20);
  fill(Green);
  rect(20,0,20,20);
  fill(Blue);
  rect(40,0,20,20);
  stroke(0);
  textMode(CENTER);
  fill(Postalcolour);
  textFont(font,40);
  
  fill(0,0,255);
  text("L2R 3R9", pmouseX,pmouseY);
  fill(Postalcolour);
  text("L2R 3R9",mouseX,mouseY);
if (mousePressed){
if (mouseX<20&&mouseY<20){
Postalcolour=Red;
}
if (mouseX<40&&mouseY<20&&mouseX>20){
Postalcolour=Green;
}
if (mouseX<60&&mouseY<20&&mouseX>40){
Postalcolour=Blue;
}
}
}


