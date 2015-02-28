
class Carre {

  float larg = 5;
  float haut = larg;

  int X = 0;
  int Y = 0;

  int dpx;
  int dpy;

  float posX = X-(larg/2);
  float posY = Y-(haut/2);

  Carre(){
    
  }

  void draw(float r,float v,float b,float op){

    noStroke();        
    beginShape();

    noStroke();
    fill(b,r,v,op);
    vertex(posX+dpx,posY+dpy);
    fill(r,v,b,op);
    vertex(posX+dpx+larg,posY+dpy);
    fill(r,v,b,op);
    vertex(posX+dpx+larg,posY+dpy+haut);
    fill(b,r,v,op);
    vertex(posX+dpx,posY+dpy+haut);

    endShape();
  }
}




