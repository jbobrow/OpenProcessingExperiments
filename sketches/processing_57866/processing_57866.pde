
PImage img;
int s;
int minSize = 2;
int steps = 5;
boolean shft;
 
dot mom;
 
void setup() {
 
  size(800,600);
  img = loadImage("phanton of the opera.jpg");
  s=img.width;

  smooth(); noStroke();
  mom = new dot(s/2,s/2,s,s/2,s/2,s);
}
 
void draw() {
  //background(0);
  mom.draw();
}
 
void mouseMoved() {
  mom.interact();
}
 
class dot {
 
  boolean alife = true; 
  int x0, y0, d0, x, y, d;
  color c0, c;
  float t;
     
  dot[] kids;
 
  dot(int _x0, int _y0, int _d0, int _x, int _y, int _d) {
    x0=_x0; y0=_y0; d0=_d0; x=_x; y=_y; d =_d; 
    c = img.get(x,y); c0 = img.get(x0,y0);
  }
   
  void draw() {
    t = constrain(t + 1f/steps ,0,1);
    if(alife) {
      float xt = lerp(x0, x, t), yt = lerp(y0, y, t), dt = lerp(d0, d, t);
      color ct = lerpColor(c0, c, t);
      fill(ct); 
      if (shft==false){
        ellipse(xt,yt,dt,dt);
      }else{
       rect(xt,yt,dt,dt);
      }
    }
    else for(int i=0; i<4; i++) kids[i].draw();
  }
  
  void impressionize(){
     rect(0,0,s,s);
  }
 
  void interact() {
    if(alife) { if (t==1 && d>minSize) giveBirth(); }
    else kids[(mouseX-x<0?2:0) + (mouseY-y<0?1:0)].interact();
  }
   
  void giveBirth() {
    int e = d/4, f = d/2;
    kids = new dot[] {
      new dot(x,y,d,x+e,y+e,f), new dot(x,y,d,x+e,y-e,f),
      new dot(x,y,d,x-e,y+e,f), new dot(x,y,d,x-e,y-e,f)
    };
    alife = false;
  }
}

void keyPressed() { 
 if (key == CODED) {
   if (keyCode == SHIFT) {
     if (shft == true)
       shft = false;
     else if (shft == false)
       shft = true;
   }}}


