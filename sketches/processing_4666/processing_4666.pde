
carre[] carres = new carre[22];color couleurG = color(random(200,255),random(100,255),random(155));

void setup(){
 size(500,500);
  smooth();
 float l=500;
 rectMode(CENTER);
 stroke(0,0);
 for(int a=0;a<22;a++){
   carres[a]=new carre(a-1, l);
   l=l*0.86;
 }  
} 

void draw(){
 background(couleurG);
  for(int a=0;a<carres.length;a++){
    carres[a].avance();
  }
}

class carre{
  float largeur ;float x=250;float y=250;float vX; float vY;int num;
  float right, left, top, bottom;color coul;
  carre(int n, float l){
    num=n;
    largeur = l;
    if(num>-1){
    float ang=random(360)/(180.0/PI);
    float v=random(2,3);
    vX=cos(ang)*v;
    vY=sin(ang)*v;   
    } else {
      vX=0;
      vY=0; 
    }
     coul = color(random(200,255),random(100,255),random(155));
    cale(); 
    dessine(); 
  }
  void avance(){
      x+=vX;
      y+=vY;
    dessine();
    cale();
    if (num>-1){
      carre lautre = carres[num];
      if (left<lautre.left){
        vX= abs(vX);
        x=lautre.left+largeur/2;
      }
      if (right>lautre.right){
        vX= -abs(vX);
        x=lautre.right-largeur/2;
      }
      if (top<lautre.top){
        vY= abs(vY);
        y=lautre.top+largeur/2;
      }
      if (bottom>lautre.bottom){
        vY= -abs(vY);
        y=lautre.bottom-largeur/2;
      }
    }
  }
  void dessine(){
    //if(num<22){
    fill(coul);
    ellipse(x,y,largeur,largeur);
    //}else{
    //  copy(0,0,500,500,int(x-largeur/2),int(y-largeur/2),int(largeur),int(largeur));
    //}
  }
  void cale(){
     right = x+largeur/2;
     left = x-largeur/2;
     bottom = y+largeur/2;
     top = y-largeur/2;
    
  }
}

