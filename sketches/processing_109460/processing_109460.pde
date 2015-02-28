
void setup() {
 
  size (400,400);
}
 void draw() { 
    float r;
   float g;
   float b;
    r=random(255);
    g=random(255);
    b=random(255);
   background(r, g, b);
   rectMode(CENTER);
   ellipseMode(CENTER);
   
   fill(r,g,b);
   rect(200,150,80,100);
   // body
   float randface1=random(100);
   float randface2=random(100);
   fill(150,200,150);
   ellipse(200,100,randface1,randface2);
   
   fill(0,250,0); // face
    rect(180,90,25,10);
    rect(220,90,25,10);
    line(170,80,190,80);
    line(210,80,230,80);
    point( 195,95);  //eyes
    float a;
     a=random (200);
    line(a,130,200,130);//mouth
   line(130,170,160,170); //arms
    line(240,170,270,170);
  ellipse (173, 90, 8, 8);
  ellipse (225, 90, 8, 8);
  fill(0,100,250);
 }
 


