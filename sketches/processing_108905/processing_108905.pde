
void setup() {
  
  size (400,400);
}
 void draw() { 
   background(255, 255, 255);
   rectMode(CENTER);
   ellipseMode(CENTER);
   rect(200,150,80,100);
   // body
   ellipse(200,100,100,100);
   
   fill(0,250,0); // face
    rect(180,90,25,10);
    rect(220,90,25,10);
    line(170,80,190,80);
    line(210,80,230,80);
    point( 195,95);  //eyes
    line(170,130,200,130);//mouth
   line(130,170,160,170); //arms
    line(240,170,270,170);
  ellipse (173, 90, 8, 8);
  ellipse (225, 90, 8, 8);
  fill(0,100,250);
 }
 


