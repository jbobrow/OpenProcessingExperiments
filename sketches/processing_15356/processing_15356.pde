
//je voudrais que les couleurs de mon cube se changent moins vite...

PImage A;
int coulr;
float Rcarre;
float Vcarre;
float Bcarre;

void setup() {
  coulr=0;
 Rcarre=random(255);
  A=loadImage("lucas.jpg");
  size(500, 500,P3D);
  background(250);
}

void draw() {
  coulr++;
     Rcarre=random(255);
     Vcarre=random(255);
     Bcarre=random(255);
     
  image (A,random(500),random(500));
  if(coulr%10==0){
      Rcarre=random(255);
      Vcarre=random(255);
      Bcarre=random(255);
  }

  
  fill(Rcarre,Vcarre,Bcarre);
  stroke(0);
  strokeWeight(2);
  translate(250,250,0);
  rotateY(mouseY/150);
  rotateX(mouseX/150);
  box(250); 
}

