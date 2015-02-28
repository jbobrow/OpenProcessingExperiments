
import netscape.javascript.*;


float x, y;
float vx, vy;
float ay;
////////
int balls=10;
float[]c=new float[balls];
float[]d=new float[balls];
float[]vc=new float[balls];
float[]vd=new float[balls];
float ed;
///////////
float n, w;
float vn, vw;
float aw;
//////////

void setup() {
  size(700, 700);
  x=350;
  y=350;
  vx=4;
  vy=5;
  ay=0.5;
  /////////////
  n=300;
  w=300;
  vn=8;
  vw=4;
  aw=0.8;
  ////////
  for (int i=0; i<balls; i++) {
    c[i]=random(width);
    d[i]=random(height);
    vc[i]=random(30);
    vd[i]=random(20);
  }
  ed=0.1;
  ///////////
}
void draw() {
  background(200);
  //////////
  
  
  intestine(int(n), int(w));
  n=n+vn;
  w=w+vw;
  if (n>400) vn=-vn;
  if (n<200) vn=-vn;
  if (w>400) { 
    vw=-vw;
    w=400-(w-400);
  }
  if (w<200) vw=-vw;

  vw=vw+aw;
  ///////
  ball(int(x-20), int(y-40));

  x=x+vx;
  y=y+vy;
  if (x>400) vx=-vx;
  if (x<250) vx=-vx;
  if (y>400) { 
    vy=-vy;
    y=400-(y-400);
  }
  if (y<250) vy=-vy;

  vy=vy+ay;
  
  

  if (mousePressed) {
    if ((mouseX>x-100) && (mouseX<x+50) && (mouseY>y-100) && (mouseY<y+50)) {
      x=mouseX;
      y=mouseY;
      vx=0;
      vy=0;

      /////////
      /*mouseclicked intestine*/
      
      for (int i=0; i<balls; i++) {
        mouse(int(c[i]), int(d[i]));
        c[i]=c[i]+vc[i];
        d[i]=d[i]+vd[i];

        if (c[i]>700) {
          vc[i]=-vc[i];
          c[i]=700-(c[i]-700);
        }
        if (c[i]<0) {
          vc[i]=-vc[i];
        }

        if (d[i]>700) {
          vd[i]=-vd[i];
          d[i]=700-(d[i]-700);
        }
        if (d[i]<0) {
          vd[i]=-vd[i];
        }

        vd[i]=vd[i]+ed;
      }
      //////////

    }
  } else {
    
     body();
 
    
  }
  ////////////
}

void mouseReleased() {
  vx=mouseX-pmouseX;
  vy=mouseY-mouseY;
}

