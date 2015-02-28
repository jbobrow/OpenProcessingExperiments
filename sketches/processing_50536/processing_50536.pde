
float inicio1=0.0;
float fin1=TWO_PI;
float inicio2=0.5;
float fin2=5.61;
float temp=0.0;

void setup(){
  //van las funciones de entorno
  size(400,400);
  strokeWeight(2);
  smooth();
  noStroke(); 
  frameRate(10); 
  ellipseMode(CORNER);
 
}

void draw(){
background(0);
  fill(255,255,0);
  arc(mouseX,mouseY,50,50,inicio1,fin1);
    fill(0);
    ellipse(mouseX+10,mouseY+5,15,15);
  
temp=inicio1;
inicio1=inicio2;
inicio2=temp;
temp=fin1;
fin1=fin2;
fin2=temp;

}










