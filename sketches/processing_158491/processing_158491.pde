

float i = 0;
void setup() {
  noCursor();
  smooth();
  size(800, 800);
  background(75, 199, 255);
  noStroke();
//fill(mouseX,243,10,50);
ellipse (width,height, 20,20);
 
}
void draw() {
 

  
  
i=i+0.05;
float posicionX = 400*sin(i);
float posicionY = 400*cos(i);
 fill(mouseY,i,100,150);
  rect(0,0,width,height);
  fill(255, 157, 241);
  noStroke();
  ellipse(width/2+posicionX, height/2+posicionY, 50, 50);

float Lana = 150*sin(i);
float Lanas = 150*cos(i);
float Peeta=5;
Peeta= Peeta+5;
  fill(mouseY*2,i-80,100,150);
  //rect(0,0,width,height);
  fill(255, 7, 241);
  noStroke();
  ellipse(width/2+Lana+10, height/2+Lanas+10, 50, 50);
  fill(255,Peeta*900,77,50);
ellipse (width/2,height/2, 150,150);

}

