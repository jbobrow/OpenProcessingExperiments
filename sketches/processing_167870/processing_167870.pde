
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/167870*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
/* @pjs preload="0.jpg";  */
 
int n=12,r=1,w=280,m=int(w*.2),f=6/*settings: n=steps r=border w=width,height m=mouseradius f=force*/;PImage t;pe[][]p=new pe[w+1][w+1];
Boolean vMode=true;//move vertex or texture
 
void setup() {
  size(w, w, P3D);
  colorMode(HSB, 2);
  noStroke();
  t=loadImage("0.jpg");
  t.resize(w-r*n*2, w-r*n*2);
  mouseX=w/2;  mouseY=w/2;
  setPe();
}
void setPe(){for (int x=r; x<w/n-r; x++) {  for (int y=r; y<w/n-r; y++) {   p[x][y]=new pe(x*n, y*n);  }}}
 
void keyPressed(){if(key==' ') setPe();else vMode=!vMode;}
 
void draw() { background(0);
  for (int x=r; x<w/n-r-1; x++) {    for (int y=r; y<w/n-r-1; y++) {     p[x+1][y+1].u();
      if (x!=r&&y!=r) { 
        float k=1+sin((abs(p[x][y].o.z)*abs(p[x][y].d.z)));     tint(k, k, constrain(3-p[x][y].D/100f,.5f,3));
        beginShape();   texture(t);       
  if(vMode){ vertex(p[x][y].d.x, p[x][y].d.y, p[x][y].o.x-r*n, p[x][y].o.y-r*n);
             vertex(p[x+1][y].d.x, p[x+1][y].d.y, p[x+1][y].o.x-r*n, p[x+1][y].o.y-r*n);
             vertex(p[x+1][y+1].d.x, p[x+1][y+1].d.y, p[x+1][y+1].o.x-r*n, p[x+1][y+1].o.y-r*n);
             vertex(p[x][y+1].d.x, p[x][y+1].d.y, p[x][y+1].o.x-r*n, p[x][y+1].o.y-r*n);
           } 
       else{ vertex(p[x][y].o.x, p[x][y].o.y, p[x][y].d.x-r*n, p[x][y].d.y-r*n);
             vertex(p[x+1][y].o.x, p[x+1][y].o.y, p[x+1][y].d.x-r*n, p[x+1][y].d.y-r*n);
             vertex(p[x+1][y+1].o.x, p[x+1][y+1].o.y, p[x+1][y+1].d.x-r*n, p[x+1][y+1].d.y-r*n);
             vertex(p[x][y+1].o.x, p[x][y+1].o.y, p[x][y+1].d.x-r*n, p[x][y+1].d.y-r*n);
    }   endShape();
      } }  }
}
 
class pe {  PVector o=new PVector(0, 0, 0);  PVector d=new PVector(0, 0, 0);   float D=0;
  pe(int tx, int ty) {
    o.x=tx;    o.y=ty;
    d.x=r+random(w/2);    d.y=r+random(w/2); //start from random location
  }
  
  void u() {
    o.z+=0.01*(o.x-d.x);    d.z+=0.01*(o.y-d.y);
           D=dist(mouseX, mouseY, d.x, d.y);
           float iD=0.001*f*(m/D);
if (mousePressed) {
      if (mouseButton==LEFT) {   o.z+=iD*(mouseX-d.x);        d.z+=iD*(mouseY-d.y);  }
      else {     o.z+=-iD*(mouseX-d.x);        d.z+=-iD*(mouseY-d.y);      }
    }
    o.z*=.95;    d.z*=.95;
    d.x+=o.z;    d.y+=d.z;
  }
}
