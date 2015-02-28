
float angle=0.0;
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
 background (55);
 smooth();
 noStroke();
 for (int y = 0; y <= height; y += 40) {
   for (int x = 0; x <= width; x += 40) {
     fill (250,114,3);
     ellipse(x,y,45,45);
   }}
}
void draw(){
  if(mousePressed==true){
    u=mouseX;
    v=mouseY;
    w=mouseX+20;
    x=mouseY-40;
    y=mouseX+40;
    z=mouseY;
    r=255;
    g=216;
    b=18;
    a=random(255);
   
    translate(mouseX,mouseY);
    rotate(angle);
    triangle(u,v,w,x,y,z);
    fill(r,g,b,a);
    angle +=0.8;
  }

}



void keyPressed(){
  if (key=='s'){
   saveImage();}}



