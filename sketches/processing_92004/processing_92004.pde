
void setup()
{
size(500, 500);
 background(255);
 smooth();
}

void draw(){
  noStroke();
 
  translate(width/2, height/2);
  
  int posx1;
  posx1=-30;
  int posx2;
  posx2=35;
  int posy1;
  posy1=-85;
  int posy2;
  posy2=-5;
  int posy3;
  posy3=-45;
  int largeur;
  largeur=100;
  int hauteur;
  hauteur=35;
  int hauteur2;
  hauteur2=65;
  
//faire tourner le motif 4 fois  
 for (int i=0;i<360;i=i+30){
  rotate(radians(90));
  fill(#FF8764,10); 
  
  //dessiner ㄱ
  rect(posx1,posy1,largeur,hauteur);
  rect(posx2,posy1,hauteur,hauteur2+10);
  noFill();
  //dessiner ㄴ
  fill(#6EB95F,10);
  rect(posx1,posy2,largeur,hauteur);
  rect(posx1,posy3,hauteur,hauteur2);
  noFill();
  //dessiner - au milieu
  fill(#739BD2,10);
  rect(posx1,posy3,largeur,hauteur);
  noFill();
  //saveFrame();
 }
}


