

//Alcys_Makeup2 par jacques maire
PImage img, makeup;
float ax, ay, az, angl, w2, h2;
Quat q0, q, q1, q2;

void setup()
{
     size(620, 768);
     ax=120;
     ay=90;
     az=130;
     w2=(float)width/2.0;
     h2=(float)height/2.0;
     frameRate(20);
     img = loadImage("greta1.png");
     makeup=loadImage("greta1.png");
     initialiser();
}



void draw()
{      
     background(55+200*abs(sin(angl)),20,20+190*abs(sin(angl+2)));
     initialiser();
     makeup.updatePixels();
     image(img, 0, 0);
     image(makeup, 0, 0);
}



void mousePressed() { 
     ax=(float)(mouseX-w2)*6.0;
     ay=(float)(mouseY-h2)*3.0;
     az=(ax+ay)/2;
     angl=atan2(mouseY-h2, mouseX-w2)*5;
     println(angl);
}

void initialiser() {
     angl=TWO_PI*cos((float)millis()/2000);
   
     q0=new Quat(ax, ay, az, 0.19*angl);
     q0.normalize();
     q1=new Quat(new PVector(ay, az, ax), 0.21*angl);
     q1.normalize();
     q2=new Quat(new PVector(az, ax, ay),0.18*angl);
     q2.normalize();
      PVector v,vv;
     for (int x = 0; x< width; x++)
          for (int y = 0; y< height; y++)
          {
               int col= img.pixels[y*width + x] ;
               float rouge=red(col);
               float vert=green(col);
               float bleu=blue(col);
               float alph=alpha(col);
              v=new PVector(rouge, vert, bleu);
               q=Quat.mul(q1, q0);
               q=Quat.mul(q, q2); 
              vv=q.tourner(v);
            vv=comb(1.45,vv,-1.45,v);
               makeup.pixels[y*width + x] =
                    color(abs(vv.x), abs(vv.y), abs(vv.z), 255);
          }
}



PVector comb(float t1, PVector v1, float t2, PVector v2) {
     PVector res=PVector.add(PVector.mult(v1, t1), PVector.mult(v2, t2));
     return res;
}

