
ArrayList pts;
int g;
int r;
int b;
int a,e,c,d;
int s;

void setup() {
  size(500,500);
  pts = new ArrayList();
  r = 255;
  g = 255;
  b = 255;
  a = 3;
  e = 3;
  c = 493;
  d = 493;
  s = 255;
  smooth();
  background(0);
}

void draw() {
  int i = 0;
  pt p = new pt(1,1);
  pt p2;
  if(mousePressed && (mouseButton == RIGHT)){
      r = (int) random(0,255);
      g = (int) random(0,255);
      b = (int) random(0,255);
  }
  if(pts.size() > 1){
  i = pts.size() - 1;
  p = (pt) pts.get(i);
  }
  for(i = pts.size() - 1; i > 0; i--){
    p2 = (pt) pts.get(i-1);
    stroke(r,g,b);
    strokeWeight(1);
    line(p.getx(),p.gety(),p2.getx(),p2.gety());
  }
  
  if(keyPressed){
    if(key == 'c' || key == 'C'){
     background(0); 
     pts = new ArrayList();
     a = 3;
  e = 3;
  c = 493;
  d = 493;
    }
    if(key == 'n' || key == 'N')
      pts = new ArrayList();
      
    if(key == 'r' || key == 'R'){
     stroke(s);
     strokeWeight(.5);
     noFill();
     rect(a,e,c,d); 
     a+=5;
     e+=5;
     c-=10;
     d-=10;
     if(a > 500){
       int z = (int) random(1,10);
      a = z;
      e = z;
      c = 500 - 2*z;
      d = 500 - 2*z; 
     }
    }
    if(key == 's' || key == 'S'){
      s = (int) random (0,255);
    }
  }
}

void mouseClicked(){
  if(mouseButton == LEFT){
   noFill();
   stroke(255);
   strokeWeight(2);
   ellipse(mouseX,mouseY,40,40); 
   pts.add(new pt(mouseX,mouseY));
  }
}

class pt{
  int x;
  int y;
  pt(int a, int b){
     x = a;
     y = b;
  } 
  
  int getx(){
     return x; 
  }
  
  int gety(){
     return y; 
  }
}





