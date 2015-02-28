
import processing.opengl.*;

gradient newgrad;
psystem somewhat;
float Xrot, Yrot, someX, someY = 0;

void setup() {  
  size(700, 700,P3D);
  background(0);
  newgrad = new gradient();
  somewhat = new psystem();
}

void draw() {  //draw function loops

newgrad.printgradient();
    pushMatrix();
    //translate (0,0,250);
    //rotateZ(0.1);
    somewhat.showsystem();
    popMatrix();
}


    class gradient {
    color startc = color(204,208,212);
    color endc = color(82,96,110);

    void printgradient () {
        float amt = 0;
        float u = (float) height;
        float step = 1 / u;
        for (int i=0;i<height+1;i++) {
            stroke (lerpColor(startc, endc, amt));
            line (0,i,width,i);
            amt += step; 
            }
        }
    }
    
    class particle {
        float x, y, z;
        float psize;
        float noisescale = 0.03;
        
        particle (float a, float b, float c) {
          x = a;
          y = b;
          z = c;
          psize = noise(x*noisescale,y*noisescale,z*noisescale)*5 + 1;
        }
        
        void display() {
          pushMatrix();
          translate(0,0,z);
          fill (255,255,255,z/10 + 10);
          stroke (255,255,255,z/10 + 20);
          ellipse (x,y, psize, psize);
          popMatrix();
        }
    }
    
    class psystem {
        particle[] miony;
        float depthz = 500;
        
        psystem () {
            int a = int (random(1000));
            miony = new particle [a];
            for (int i=0; i<miony.length; i++) {
                miony[i] = new particle(random(width) ,random(height),random(depthz)+300);
            }
        }
        
        void showsystem () {
            for (int i = 0; i<miony.length; i++) {
                miony[i].display();
            }    
        }
    }
