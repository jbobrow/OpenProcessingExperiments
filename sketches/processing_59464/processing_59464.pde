



//Alcys_Picasso par jacques maire
//mardi 19 avril 2012
PImage img, makeup;
float  angl, w2, h2, inc;
int depart, arrivee;
Quat  qs, qd, qa;

public void setup()
{
     size(434, 600);
     inc=0.010f;
     w2=(float)width/2.0f;
     h2=(float)height/2.0f;
     frameRate(30);
     img = loadImage("c.png");
     makeup=loadImage("c.png");
     depart=img.pixels[100*width + 100];
     arrivee=img.pixels[400*width + 400];
     qd=new Quat(alpha(depart), red(depart), green( depart), blue( depart));
     qa=new Quat(alpha(arrivee)/2, red(arrivee), green(arrivee), blue(arrivee));
}



public void draw()
{      
     background(255);
     initialiser();
     makeup.updatePixels();
     image(makeup, 0, 0);
}



public void mousePressed() { 
     depart=arrivee;
     arrivee=img.pixels[mouseY*width + mouseX];
     qd=new Quat(255, red(depart), green( depart), blue( depart));
     qa=new Quat(255, red(arrivee), green(arrivee), blue(arrivee));
}

public void initialiser() {
     angl=angl+inc;
     if (angl>1) {
        angl=0  ;changer();
     }
     PVector v;
     qs=Quat.slerp1(qd, qa, angl);
     qs=qs.puissance(angl*15.3f);
     for (int x = 0; x< width; x++)
          for (int y = 0; y< height; y++)
          {
               int col= img.pixels[y*width + x] ;
               v=new PVector(red(col), green(col), blue(col)); 
               v=qs.tourner(v);         
               makeup.pixels[y*width + x] =color(v.x-50, v.y, v.z);
          }
}

public void changer(){  depart=arrivee;
int yy=floor(random(2,height-1));
int xx=floor(random(2,width-1));
     arrivee=img.pixels[yy*width + xx];
     qd=new Quat(255, red(depart), green( depart), blue( depart));
     qa=new Quat(255, red(arrivee), green(arrivee), blue(arrivee));
}






