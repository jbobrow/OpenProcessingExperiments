
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/148758*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */

  /**
 * Chaplin
 * 
 * Fait par Jacques Maire
 * le dimanche 18 mai 2014
 */
  /* @pjs preload="chaplin.jpg"; */
  PImage img;
  float angle, co, si,dxdy;
        float[] cx,cy;
        int nbp=800;

public  void setup() {
size(334, 400);
    img=loadImage("chaplin.jpg");
    img.loadPixels();
         cx=new float[nbp];
         cy=new float[nbp];
           for (int i=0;i<nbp;i++){
      
        cx[i]=random(img.width);
        cy[i]=random(img.height);
      }
       strokeWeight(2); 
      dxdy=width*height-1; 
  }

public  void draw() {
    background(255);
  angle+=0.1;
    co=cos(angle);
    si=sin(angle);
    for (int i=0;i<nbp;i++){
     
        hachure( cx[i],cy[i]);
      
    }
  }
  //+++++++++++++++++++++++++++++++++++++++++++++++
  void hachure(float fromx,float fromy) {
    int compteur=0;
   float tox,toy;
    while ( cadree (fromx,fromy) && compteur<100) {
      float ncol=couleur(fromx,fromy);
      tox=dir(ncol).x+fromx;
            toy=dir(ncol).y+fromy;
      compteur++;
    if (cadree(tox,toy)) {
        stroke(ncol);
      line(tox,toy, fromx,fromy);
      fromx=tox;
            fromy=toy;
    }
  }
  }

  boolean cadree(float vx,float vy) {
    return ((vx>0)&&(vx<width)&&(vy<height)&&(vy>0));
  }

  float couleur(float vx,float vy) {
    int c;
   int u=round(floor(vy)*img.width+vx);
   if ((u<0)||(u>dxdy)) c=0x999999;else
    c= img.pixels[u];
    return (green(c)+blue(c)+red(c))/3.0;
  }

  PVector dir(float cc) {
    float r=map(cc, 0, 255,-1,1);
          float s=sqrt((1-r*r));
    PVector res= new PVector(0.4*r*co,-4.0*(1-r*r)*si);  
    return res;
  }


  void ligne(PVector u, PVector v, float cc) { 
    stroke(cc);
 
    line(u.x, u.y, v.x, v.y);
  }

  



