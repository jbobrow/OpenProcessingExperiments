
float inicio1=0.0;
float fin1=TWO_PI;
float inicio2=0.63;
float fin2=5.61;
float temp=0.0;



void setup(){
  
  
  size (400,400);
  smooth();
  strokeWeight(2);
  noStroke();
  fill(255,255,0);
frameRate(7);
 ellipseMode(CORNER);
  
}

void draw(){
  background(0);
  fill(255,255,0);
  arc(mouseX, mouseY, 100, 100, inicio1, fin1);
  fill (255,0,0);
  ellipse(mouseX+25,mouseY+8,35,30);
  fill (0,0,0);
  ellipse(mouseX+30,mouseY+15,15,15);


  
  temp=inicio1;
  inicio1=inicio2;
  inicio2=temp;
  
  temp=fin1;
  fin1=fin2;
  fin2=temp;
  
}  
