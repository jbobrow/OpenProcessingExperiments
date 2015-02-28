
void setup(){
size(400,400);
background(60);
  smooth();
}
void draw(){
  frameRate(75);
if ((mousePressed==true)&&(mouseButton==LEFT)){
  colorMode(HSB);
  stroke(130, mouseX/2, random(100, 255));
  fill(255);
}
else if((mousePressed==true)&&(mouseButton==RIGHT)){
  stroke(60);
  fill(60);
}
else if (mousePressed==false){
 noStroke(); 
 noFill();
}

float a = random (30);
strokeWeight(5);
line(mouseX, mouseY, pmouseX, pmouseY);
ellipse(mouseX, mouseY, a, a);
}

