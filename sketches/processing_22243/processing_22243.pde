
float angle=0.5;
float u;
float v;
float w;
float x;
float y;
float z;
float r;
float g;
float b;
float a;

void setup(){
  size(screen.width,screen.height);
  background(255);
  smooth();
}
void draw(){
  if(mousePressed==true){
    u=mouseX;
    v=mouseY;
    w=mouseX+20;
    x=mouseY-40;
    y=mouseX+40;
    z=mouseY;
    r=random(255);
    g=random(255);
    b=random(255);
    a=random(255);
   
    translate(mouseX,mouseY);
    rotate(angle);
    triangle(u,v,w,x,y,z);
    fill(r,g,b,a);
    angle +=0.7;
  }

}
void keyPressed(){
  if (key=='s'){
    saveImage();}}



