
//by Maxime Pont 
//
float x,y,l,h;

void setup(){
  size(600,400);
  background(0);
  noFill(); // aucun remplissage
  smooth(); // adouci les aroondis (pixels)
  
x= 22.5;
y= 200;
l=50;
h=50;

  
}

void draw() {
 
  strokeWeight(random(5,15));// epaisseur contour
  for(int i=0;i<20; i++);{ // boucle avec trois info, le debut la fin et comment sa recommence) i++ est aussi i = i+1
if (x>=100){
 stroke(255, 120); 
 } 
 if (x<100){ stroke(0,250,0, 120); }
  x=random(0,width); // width est une valeur générique, elle se base sur la largeur de l'écran (height = hauteur)
  y=random(0,height);
  filter(BLUR);
  ellipse(x,y,l,h);

  }
}


