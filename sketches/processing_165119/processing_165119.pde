
void setup(){
size(500,500);
frameRate(10);
stroke(50,50,50,80);
float a;
float b;
}
void draw(){
  
  float a=random(0,500);
  float b=random(0,500);
  line(100,150,a,b);
  line(250,400,a,b);
  line(400,100,a,b);
  if (mousePressed){
    stroke(100,random(0,255),100,80);
  line(mouseX,mouseY,a,b);
  
  }
  
}
