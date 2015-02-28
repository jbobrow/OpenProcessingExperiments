
int a=100;
int b=200;
int c=700;
int d=-60;
float r;
float g;
float B;
float o;

void setup() {
  size(300,600);
  smooth ();
  noStroke();  
}

void draw() {
  background(g,r,B);
  fill(b,a,c/3,o);
  rect(70,c,60,60);
  if (c>-60){
    c-=3;
  } else if (c<-60){
    c=700;
  }
  fill(a,d+c,b,o);
  rect(170,d,60,60);
  if (d<600){
    d+=3;
  } else if (d>-70){
    d=-60;
  }
  fill(B,g,r,o);
  triangle(a,a,a/2,b,150,b);
  fill(r,B,g,o);
  triangle(b,a,150,b,250,b);   
}
void mouseClicked(){
  r = random(255);
  g = random(255);
  B = random(255);
  o = random(255);
}

