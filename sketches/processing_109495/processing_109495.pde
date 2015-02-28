
float angulo, radio, centroX,centroY,incA,incR;

void setup() {

  size(600, 600);
  colorMode(HSB,360,50,50,50);

angulo=0; // locacion de inicio
radio=0; 
centroX=width/2; // 
centroY=height/2;
incA=PI/180; //velocidad angular
incR=0.1; //incremento del espiral

}
void draw() {

  float x=centroX+radio*cos(angulo);
  float y=centroY+radio*sin(angulo); 

noStroke();
fill(degrees(angulo+PI)%360,50,100);
ellipse(x,y,20,20);
  
  stroke(degrees(angulo)%360,50,100,20);
  line(centroX,centroY,x,y);
 
  fill(degrees(angulo+(2*PI/2))%360,50,100,20);
  triangle(x,y,mouseX,mouseY,pmouseX,pmouseY);
 
 
 
  angulo = angulo + incA*3;
  radio= radio + incR*3;
  radio = radio % int(width/2);

}


