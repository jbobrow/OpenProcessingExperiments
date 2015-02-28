
void setup(){
size(600,600);
colorMode(HSB);
noCursor();
smooth();
}
void draw(){
  
}

void mousePressed(){
  fill(random(255),random(255),random(255));
  ellipse(mouseX,mouseY,90,90);
  ellipse(mouseX +(45),mouseY +(45),70,70);
  ellipse(mouseX -(45),mouseY +(45),70,70);
  fill(10,210,10);
  line(mouseX,mouseY,10, 10);
  
}
