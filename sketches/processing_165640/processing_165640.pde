
float kulaX;
float kulaY;
 
float liturR;
float liturG;
float liturB;

float kassiX;
float kassiY;
 
void setup() {
  size(400,400);       
  kulaX = width/2;      
  kulaY = height + 100; 
  kassiX = width - 400;
  kassiY = height/2;
  smooth();
}
 
void draw() {
 
  background(130,30,0);  
 
  ellipseMode(CENTER);
  rectMode(CENTER);
 
  stroke(0);
  liturR=random(255);
  liturG=random(255);
  liturB=random(255);
  fill(liturR,liturG,liturB);
 
  ellipse(kulaX,kulaY+100,60,60);
 
  kulaY = kulaY - 1;
  
  rect(kassiX,kassiY,50,50);
  
  kassiX = kassiX + 1;


 
  
}


