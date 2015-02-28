
float w,r;
float wm=0.1;
float rm=0.4;
int sz=15;
int m;
float tr;
int n=5;

void setup() {
  colorMode(HSB,TWO_PI);
  size(600,600);
  background(0);
  m = width/2;
  smooth();
  noStroke();  
}

void draw() {

  for(int i=0; i< n; i++) {
    float w2= w+(TWO_PI/(float)n)*(float)i;
    fill(w2%TWO_PI,TWO_PI-w/2,-noise(tr)+TWO_PI,noise(tr)*PI);
    ellipse(m+cos(w2)*r,m+sin(w2)*r,sz*noise(tr/2)*r,r*sz*(noise(tr-1)));
  }

  tr+=random(0.1);
  w+=0.01;
  w= w% TWO_PI;
  r+=rm;
  if(r>100){
    rm=-0.4;
    n++;
    if(n==10){
    //  w+= random(PI);
    }
  }
  if(r<30){
    rm=0.4;
  }
} 

void mousePressed() {
  println(r+"/"+n);
}


