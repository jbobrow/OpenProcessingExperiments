

//Alcys_Pablo par jacques maire
PImage img, makeup;
float ax, ay, az, angl, w2, h2;
Quat q0, q, q1, q2;

void setup()
{
     size(829, 700);
     ax=120;
     ay=90;
     az=130;
     w2=(float)width/2.0;
     h2=(float)height/2.0;
     frameRate(40);
     img = loadImage("portrait.png");
     makeup=loadImage("portrait.png");
     initialiser();
}



void draw()
{      
     background(55+200*abs(sin(angl)), 20, 20+190*abs(sin(angl+2)));
     initialiser();
     makeup.updatePixels();
    // image(img, 0, 0);
     image(makeup, 0, 0);
}



void mousePressed() { 
     ax=(float)(mouseX-w2);
     ay=(float)(mouseY-h2);
     az=(ax+ay)/2;
     angl=atan2(mouseY-h2, mouseX-w2);
     println(angl);
}

void initialiser() {
     float aaa=(float)millis()/15000;
     angl=TWO_PI*cos(aaa);

     q0=new Quat(ax, ay, az, angl);
     q0.normalize();
     q1=new Quat(new PVector(ay, az, ax), angl);
     q1.normalize();
     q2=new Quat(new PVector(az, ax, ay), angl);
     q2.normalize();
     PVector v, vv;
     for (int x = 0; x< width; x++)
          for (int y = 0; y< height; y++)
          {
               int col= img.pixels[y*width + x] ;
               float rouge=red(col);
               float vert=green(col);
               float bleu=blue(col);
               float alph=alpha(col);
               v=new PVector(rouge, vert/3, bleu);
               q=Quat.mul(q1, q0);
               q=Quat.mul(q, q2); 
               vv=q.tourner(v);
               vv=comb(1.10, vv, -0.3700, v);
               makeup.pixels[y*width + x] =
                    color(abs(vv.x), abs(vv.y), abs(vv.z), 255);
          }
}


PVector comb(float t1, PVector v1, float t2, PVector v2) {
     PVector res=PVector.add(PVector.mult(v1, t1), PVector.mult(v2, t2));
     return res;
}


