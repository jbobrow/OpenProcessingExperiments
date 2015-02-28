
/**
 * Chaplin
 * 
 * Fait par Jacques Maire
 * le Samedi 17 mai 2014
 */
  /* @pjs preload="chaplin.jpg"; */
    PImage img;
    float angle, co, si;
        PVector[] coord;
        int nbp=500;

public  void setup() {
size(334, 400);
//frameRate(300);
      img=loadImage("chaplin.jpg");
      img.loadPixels();
         coord=new PVector[nbp];
           for (int i=0;i<nbp;i++){
      
        coord[i]=new PVector(random(img.width),random(img.height));
      }
        strokeWeight(3); 
    }

public  void draw() {
      background(255);
  angle+=0.05;
      co=cos(angle);
      si=sin(angle);
      for (int i=0;i<nbp;i++){
       
          hachure( coord[i]);
        
      }
    }
    //+++++++++++++++++++++++++++++++++++++++++++++++
    void hachure(PVector depart) {
      int compteur=0;
      float ncol;
      PVector arrivee;

      while ( cadree (depart) && compteur<500) {
        ncol=couleur(depart);
        arrivee=PVector.add(dir(ncol),depart);
        compteur++;
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
      return (blue(c)+red(c)+green(c))/3;
    }

    PVector dir(float cc) {
      float r=map(cc, 0, 255,-1,1);
      PVector res= new PVector(r*co,(1-r)*si);
      res.normalize();
     // res= PVector.mult(res,4);
      return res;
    }


    void ligne(PVector u, PVector v, float cc) { 
      stroke(cc);
 
      line(u.x, u.y, v.x, v.y);
    }

    

    



