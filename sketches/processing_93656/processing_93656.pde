
float r;
float g;
float b;
float a;

void setup (){
  
  background(250);
  size(300,300);
  
}

void draw (){
  r= random(255);
  g=random(255);
  b=random(255);
  a=random(255);
  stroke(r,g,b,a);
  
  line(mouseX,mouseY,150,150);
   
}

void mousePressed(){
  
  stroke(r,g,b,a);
  fill(mouseX,0,mouseY);
  triangle (mouseX, mouseY, 116,16,150,16);
  
  
}
