
 float aumento = 0;
 
 void setup (){
  size(1000,800);
  background(0,0,0);
  colorMode(HSB);
}
void draw() {
  noStroke();
float vt = dist(mouseX,mouseY,pmouseX,pmouseY);
  fill(random(50),random(250),200,180);
ellipse(mouseX, mouseY, vt*1.2, vt*1.5);
  aumento +=10;
}
