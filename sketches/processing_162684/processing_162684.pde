
// By Antoine DERRIEY ;); modified by Maxime Pont !
// int x = 0;
int l = 40, h = 40;
float x,y;

void setup(){ 
  size(600,600); // taille 
  background(0,0,210); // fond

x=0;
y=0;
l=50;
h=50;

 stroke(255,255,255,210); // couleurs contour
 strokeWeight(10); // epaisseur contour
  smooth();
  rectMode(CENTER); // centrer
  
}


void draw() {
 
fill(230,0,0,80); // couleur de la forme

  for (int t=0; t<width; t+=20){ // boucle
  //  x= x+20;
  
    
     
 rect(t,t,l,h) ;
}
  
  if (mousePressed == true) { // clic
       filter(BLUR,6);
       l=+20;
       h=h+20;
    
  }

}






