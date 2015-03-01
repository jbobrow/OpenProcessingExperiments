
void setup(){
  size(500,500,P3D);
  background(255);
  frameRate(10);
}

void draw(){
float r = random(125,255);
float g = random(125,255);
float b = random(125,255);
float s = random(10,60);
float d = random(-100,100);
fill(150,150,b);
textSize(s);
text("H2O", mouseX, mouseY,d); 
 
}
