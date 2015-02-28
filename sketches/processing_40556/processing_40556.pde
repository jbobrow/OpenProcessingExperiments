
int x =0;
int y=300;
int c=0;


void setup() {
  size(800, 600);


  background(255);
  boxes();
  circles();
 
  for (int i=0;i<3000;i+=10) {
    ln(0,height/2,i,360);
  }
}

void draw() {

}

void boxes() {
  noStroke();
  for (int x=0;x<width;x+=40) {
    for (int y=0;y<height; y +=40) {
      fill(random(25)+225);
      rect(x, y, 40, 40);
      rndTri(x,y,40);
    }
  }
  noStroke();
}
void rndTri(int x,int y, int d){
  if(random(1001) > 900){
    
    //triangle(x,y,x+d,y,x+d,y+d);
    fill(random(25)+225);
    triangle(x,y,x,y+d,x+d,y+d);
  }
}
void circles() {
  noStroke();
  fill(0, 100, 100, 2);
  for (int i=0;i<width*400;i++) {
    if (x==width+1) {
      x=0;
      y=height/2;
    }
    ellipse(x++, y+=(random(11)-5), random(8), random(8));
  }
}
void ln(float x, float y, float a, int l) {
  float magnatute = 2;
  for (int i=0;i<l;i++) {
    x = x+(cos(radians(a)) )*magnatute;
    y = y+(sin(radians(a+=1)) )*magnatute;
    ellipse(x+random(magnatute), y+random(magnatute), random(magnatute)+magnatute, random(magnatute)+magnatute);
  }
}

