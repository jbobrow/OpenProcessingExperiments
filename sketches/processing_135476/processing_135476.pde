
float aumento = 0;
  
 void setup (){
  size(1000,800);
  background(0,0,0);
  colorMode(HSB);
}
void draw() {
  noStroke();
float vt = dist(mouseX,mouseY,pmouseX,pmouseY);
float x = 100*sin(aumento);
  stroke(50,40,250,50);
line(mouseX, mouseY, x*1.2, vt*1.5);
line(mouseY,mouseX,  x*1.2, vt*1.5);
  aumento +=20;
}

