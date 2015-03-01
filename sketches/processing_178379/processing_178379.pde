
float easing = 0.7;
suiveur chef;

void setup(){
  size(400,400);
  chef = new suiveur();
}

void draw(){
  background(255);
   chef.dessine(mouseX, mouseY);
}

class suiveur{
  suiveur suivant; 
  float x,y;
  suiveur(){
    suivant = new suiveur(120);
    x=width/2;y=height/2;
  }
  suiveur(int n){
    if(n>0) suivant = new suiveur(n-1);
  } 
  void dessine(float _x, float _y){
    x=_x+(x-_x)*easing;
    y=_y+(y-_y)*easing;
    ellipse(x,y,30,50);
     if(suivant!=null){
       suivant.dessine(x,y);
     }
  }
}
