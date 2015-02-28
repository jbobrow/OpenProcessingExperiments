
import remixlab.proscene.*;

Scene scene;


//Alcys_Picasso par jacques maire
//mardi 19 avril 2012
PImage img, makeup;
float  angl, w2, h2, inc;
int depart, arrivee, large, haut,d;
Quat  qs, qd, qa;
int[] hpt;

public void setup()
{
     size(800, 700, P3D);
     scene=new Scene(this);
     scene.setAxisIsDrawn(false);
      scene.setGridIsDrawn(false);    
     inc=0.030f;
     d=2;

     frameRate(60);
     img = loadImage("va.jpg");
     makeup=loadImage("va.jpg");
     large=img.width;
     haut=img.height;
     hpt=new int[large*haut];
     w2=(float)large/2.0f;
     h2=(float)haut/2.0f;
     depart=img.pixels[100*large + 100];
     arrivee=img.pixels[200*large + 200];
     qd=new Quat(alpha(depart), red(depart), green( depart), blue( depart));
     qa=new Quat(alpha(arrivee), red(arrivee), green(arrivee), blue(arrivee));
     scene.camera().setPosition(new PVector(0, 0, 700));
    
}



public void draw()
{      
     background( 0);
     
     initialiser();
     makeup.updatePixels();
     
}




public void initialiser() {
     angl=angl+inc;
     if (angl>1) {
          angl=0  ;
          changer();
     }
     
     PVector v;
     qs=Quat.slerp1(qd, qa, angl);
     qs=qs.puissance(angl*5);
     for (int x = 0; x< large; x++)
          for (int y = 0; y< haut; y++)
          {
               int col= img.pixels[y*large + x] ;
               v=new PVector(red(col), green(col), blue(col));
               v=qs.tourner(v); 
               makeup.pixels[y*large + x] =color(v.x, v.y, v.z);
               stroke(  makeup.pixels[y*large + x]);
               hpt[y*large + x]= floor(sqrt(v.x*v.y*v.z)/10);
          }   
     noStroke();
     for (int x =d; x< large-d; x+=d*2)
          for (int y = d; y< haut-d; y+=d*2)
          {    
               fill(makeup.pixels[y*large + x]);
               beginShape();
               vertex(x-d-w2, y-d-h2,hpt[(y-d)*large + x-d]);
               vertex(x+d-w2, y-d-h2, hpt[(y-d)*large + x+d]); 
               vertex(x+d-w2, y+d-h2, hpt[(y+d)*large + x+d]);
               vertex(x-d-w2, y+d-h2, hpt[(y+d)*large + x-d]);
               endShape();
          }
}

public void changer() {  
     depart=arrivee;
     int yy=floor(random(2, haut-1));
     int xx=floor(random(2, large-1));
     arrivee=img.pixels[yy*large + xx];
     qd=new Quat(255, red(depart), green( depart), blue( depart));
     qa=new Quat(255, red(arrivee), green(arrivee), blue(arrivee));
}






