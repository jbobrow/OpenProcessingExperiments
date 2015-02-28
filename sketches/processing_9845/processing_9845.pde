
int nb=0,nbMax=5;
void setup(){
size(400,400);
frameRate(30);
smooth();
rectMode(CORNER);
}
void draw(){
carre(0,0,400,nb);
if(nb>nbMax)nb=0;
if(frameCount%30==0)nb++ ;
}
void carre(int x,int y,float taille, int nb){
taille*=0.5;
fill(255);
rect(x,y,taille,taille);
rect(x,y+taille,taille,taille);
rect(x+taille,y+taille,taille,taille);
fill(0);
rect(x+taille,y,taille,taille);
if(nb>0){
  nb--;
  
  carre(x,y,taille,nb);
  pushMatrix();
  translate(x,y+taille);
  carre(x,y,taille,nb);
  popMatrix();
  pushMatrix();
  translate(x+taille,y+taille);
  carre(x,y,taille,nb);
  popMatrix();
  
}
}

