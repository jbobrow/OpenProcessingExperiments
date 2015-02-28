
float radius =100;
float z =-radius;
float speed =2;
boolean night =false;
void setup() {
  size(400,400);
  smooth();
  background(0,150,255);
}
  
  void draw(){
    if (night){
      background(0);
      for (int y = 0; y <= height; y += random(10,20)) {
  for (int x = 0; x<=width; x += random(30,40)) {
    fill(255);
    ellipse(x,y, 1, 1);
    ellipse(y, x, 1,1);}}
    fill(247);
    z -=speed;
    if(z<-radius){
      z=width+radius;}
    ellipse(z,0,radius,radius);
    stroke(255);
    fill(0,0,255);
    rect(-1,350,401,345);
    fill(205,100,100);
    ellipse(205,120,40,70);
    fill(204);
    quad(180,130,230,130,260,350,150,350);
     fill(129,90,13);
    quad(140,345,270,345,300,360,110,360);
    fill(255,255,0,200);
    triangle(mouseX,mouseY,mouseX,mouseY-100,205,110);}
   
    else{ stroke(0);
    background(0,150,255);
    fill(205,100,100);
    ellipse(205,120,40,70);
    fill(204);
    quad(180,130,230,130,260,350,150,350);
    fill(0,255,255);
    rect(-1,350,401,345);
    fill(129,90,13);
    quad(140,345,270,345,300,360,110,360);
    fill(255,255,0);
    z -=speed-1;
    if(z<-radius){
      z=width+radius;}
    ellipse(z,0,radius,radius);
  }}
  
  void mouseClicked()
 {night=!night;
 }
 

