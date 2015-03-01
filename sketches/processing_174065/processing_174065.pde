
float r= 100;
float g = 150;
float b = 200;
float a = 200;
float diam = 100;
float x = 100;
float y = 100;
float compteur;
void setup () {
  size(1200,600);
  background(0);
  smooth();
   
}


void draw () {
  stroke (100);
  fill(r,g,b,a);
  ellipse (mouseX,mouseY,diam,diam);
  rect(mouseX,mouseY,diam,diam);
  x = int(random(0,255));
  y = int(random(0,255));
  r = int(random(0,255));
  g = int(random(0,255));
  b = int(random(0,255));
  a = int(random(0,255));
  diam = int(random(100));

    compteur = compteur + 1;{
    translate(x,y);
    rotate(compteur);
    rectMode(CENTER); 
  } 

}



