
//margaux_leuci_french_graphic_design_student, beginner in processing :)
/* still searching how can the 
background can return to its starting value (255) ... 
the fill's color stays instead of the background...any help is welcome thanks :) */

cercle[] tousLesCercles;

void setup(){
  size(500,500);
  background(255);
  fill(0);
  noStroke();
  frameRate(30);
  tousLesCercles=new cercle[0];
}

void draw(){
  for(int a=0;a<tousLesCercles.length;a++){
    tousLesCercles[a].dessine();
  }
  if(tousLesCercles.length>0 && tousLesCercles[0].taille>5000){
    tousLesCercles=(cercle[]) subset(tousLesCercles,1);
  }
}

class cercle{
  int x,y;
  float taille;
  float vitesse;
  color maCouleur;
  cercle(){
    x=mouseX;
    y=mouseY;
    taille=0.1;
    vitesse=random(1,7);
    //use layer mode with maCouleur like in photoshop! :) nice effects but not with all  
    maCouleur=color(random(255),random(255),random(255),ADD);
    tousLesCercles= (cercle[]) append(tousLesCercles,this);
  }
  void dessine(){
    if(taille<5000){
      taille*=1.01;
      taille+=vitesse;
      fill(maCouleur);
      ellipse(x,y,taille,taille);
    }
  }
}
//mouseMoved is making processing "crash" any suggestion ? :) 
void mouseReleased(){ 
  new cercle();
} 


