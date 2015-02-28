
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/62911*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */

/**
 * Alcys_Esclave_Grecque
 *Esclave grecque, d'après la sculpture sur marbre d'Hiram Powers
 *Musée canadien des civilisations
 *No de cat. : A-3466
 *Diapo No 17941
 *
 * Fait par Jacques Maire
 * le samedi 2 juin 2012
 */
    PImage img;
    float angle, co, si;
public  void setup() {
      size(600, 676, P2D);
      img=loadImage("esc.jpg");
      img.loadPixels();
      frameRate(40);
    }
 
public  void draw() {
      background(0);
      angle+=0.01;
      co=cos(angle);
      si=sin(angle);
      for (int i=0;i<img.width-1;i+=30) {
        for (int j=0;j<img.height-1;j+=30) {
          hachure( new PVector( i, j));
        }
      }
    }
    //+++++++++++++++++++++++++++++++++++++++++++++++
    void hachure(PVector depart) {
      int compteur=0;
      float ncol;
      PVector arrivee;
 
      while ( cadree (depart) && compteur<100) {
        ncol=couleur(depart);
        arrivee=PVector.add(dir(ncol,compteur),depart);
        compteur++;if(keyPressed) println(compteur);
      if (cadree(arrivee)) {
        ligne(depart, arrivee, ncol);
       depart=arrivee;
      }
    }
    }
 
    boolean cadree(PVector v) {
      return ((v.x>=0)&&(v.x<img.width)&&(v.y<img.height)&&(v.y>=0));
    }
 
    float couleur(PVector v) {
      int c;
     int u=round(floor(v.y)*img.width+v.x);
     if ((u<0)||(u>img.width*img.height-1)) c=0x999999;else
      c= img.pixels[u];
      return blue(c);
    }
 
    PVector dir(float cc,int n) {
      float r=range(cc, 0, 255,0,1);
     PVector  res= new PVector(2*co-r*si,r*si+2*co);
    
      res=rotation(res,n);
      res.normalize();
      res= PVector.mult(res,4);
      return res;
    }
 PVector rotation(PVector v,int na){
   float c=cos(mouseX*0.0004*na);
   float s=sin(mouseY*0.0020*na);
   return new PVector(c*v.x-s*v.y,s*v.x+c*v.y);
 }
 
    void ligne(PVector u, PVector v, float cc) {
      stroke(round(cc));
      line(u.x, u.y, v.x, v.y);
    }
 
    float range(float x, float a, float b, float aa, float bb) {
      return aa+(x-a)*(bb-aa)/(b-a);
    }


