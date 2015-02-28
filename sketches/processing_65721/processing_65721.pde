

float x = (600*2)/3 ; // Variable x
float y = (600*2)/3 ; // Variable y
float x2 = 600/3 ; // Variable x
float y2 = 600/3 ; // Variable y

void setup() {
  size(600,600);
  noStroke() ;
  smooth();
}

void draw() {
 background(0);
 
 x += random(-5,5) ; // random(limite basse,limite haute)
 y += random(-5,5) ;
 fill(240,80,220); // R,V,B
 ellipse(x,y,150,150); // (X,Y,largeur,hauteur)
 
 x2 += random(-5,5) ; // random(limite basse,limite haute)
 y2 += random(-5,5) ;
 fill(200,180,160); // R,V,B
 ellipse(x2,y2,100,100); // (X,Y,largeur,hauteur)
 
}



