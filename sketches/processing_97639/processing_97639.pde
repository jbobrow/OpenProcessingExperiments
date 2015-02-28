


void setup() {
  frameRate(5);
  size(300,300);
  stroke(0);
}


void draw() {
  background(130,214,212);
  for (float e=0; e<width+25; e=e+50){
    fill(232,120,e+50);
    rect(e-20,e+250, 200, 50, 50);
  }
  for (float e=0; e<width+25; e=e+50){
    fill(232,205,e+50);
    rect(e-20,e+200, 200, 50, 50);
  }
  for (float e=0; e<width+25; e=e+50){
    fill(189,232,e+50);
    rect(e-20,e+150, 200, 50, 50);
  }
  for (float e=0; e<width+25; e=e+50){
    fill(e+50,232,200);
    rect(e-20,e+100, 200, 50, 50);
  }
  for (float e=0; e<width+25; e=e+50){
    fill(25,10,e+50);
    rect(e-20,e+50, 200, 50, 50);
  }
  for (float f=0; f<height+25; f=f+50){
    fill(14,232,f+50);
    rect(f-20,f, 200, 50, 50);
  }
  for (float g=0; g<width+25; g=g+50){
    fill(146,232,g+50);
    rect(g-20,g-50, 200, 50, 50);
  }
  for (float h=0; h<width+25; h=h+50){
    fill(212,232,h+50);
    rect(h-20,h-100, 200, 50, 50);
  }
  for (float j=0; j<width+25; j=j+50){
    fill(232,143,j+50);
    rect(j-20,j-100, 200, 50, 50);
  }
  for (float j=0; j<width+25; j=j+50){
    fill(232,74,j+50);
    rect(j-20,j-150, 200, 50, 50);
  }
  for (float j=0; j<width+25; j=j+50){
    fill(232,31,j+50);
    rect(j-20,j-200, 200, 50, 50);
  }
  for (float j=0; j<width+25; j=j+50){
    fill(200,74,j+50);
    rect(j-20,j-250, 200, 50, 50);
  }
  for (float j=0; j<width+25; j=j+50){
    fill(100,74,j+50);
    rect(j-20,j-300, 200, 50, 50);
  }
/*es el fons de l'exercici en el que he fet que la variable vagi variant de 50 en 50 de color i posició*/  
  
  for (int i=10; i<width; i=i+10) {
    fill(232,random(255),0);
    ellipse(i,i,random(70),random(70));
  }
  for (float d=10; d<width; d=d+10){
    fill(107,0,random(232));
    ellipse(d+100,d, random(70), random(70));
  }
  for (float d=10; d<width; d=d+10){
    fill(232,89,random(250));
    ellipse(d+200,d, random(70), random(70));
  }
  for (float d=10; d<width; d=d+10){
    fill(0,59,random(250));
    ellipse(d-100,d, random(70), random(70));
  }
  for (float d=10; d<width; d=d+10){
    fill(232,170,random(250));
    ellipse(d-200,d, random(70), random(70));
  }
/*he fet que les elipses vagin canviant de forma i color i cada for, l'he separat 100 pixels en l'eix de les y*/
  

  

}


