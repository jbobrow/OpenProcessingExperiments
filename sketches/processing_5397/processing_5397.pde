


class Ligne {
  color couleur;
  float x,y;
  float v;
  float A;
  boolean e=false;
  
  Ligne() {
  }
  
  void creer(){
    if (random(0,1)>0.995){
      e=true;
      posval();
    }
  }
  void posval(){
    couleur = color(random(0,255),255,255);
    A=int(random(0,4));
    v=random(1,5);
    if(A%2==0){
      x=width*(1-cos(A*PI/2))/2;
      y=0;
    }
    if(A%2==1){
      x=0;
      y=height*(1-sin(A*PI/2))/2;
    }
  }
  void bouger() {
    x+=v*cos(A*PI/2);
    y+=v*sin(A*PI/2);
    if(x>width || x<-1 || y>height || y<-1){
      colbg=couleur;
      e=false;
    }
  }

 void dessiner() {
   stroke(couleur);
   strokeWeight(6);
   if(A%2==0)  line(x,0,x,height);
   if(A%2==1)  line(0,y,width,y);   
 }

}

