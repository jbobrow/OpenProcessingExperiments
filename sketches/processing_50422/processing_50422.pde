
float inicio1=0.0;
float fin1=PI*2;
float inicio2=0.63;
float fin2=5.61;
float temp=0.0;
void setup(){
  size(1000,1000); 
  smooth();
  strokeWeight(2);
  noStroke();
  fill(255,255,0);
  frameRate(7);
  ellipseMode(CORNER);
 
}
void draw(){
  background(0,50,255);
//  background(mouseX,mouseY,mouseX+50);
  noStroke();
  
arc(mouseX,mouseY,100,100,inicio1,fin1);
temp=inicio1;
inicio1=inicio2;
inicio2=temp;

temp=fin1;
fin1=fin2;
fin2=temp;
stroke(0);
strokeWeight(6);
line(mouseX+40,mouseY+10,mouseX+55,mouseY+31);
line(mouseX+36,mouseY+26,mouseX+58,mouseY+13);
}
 







