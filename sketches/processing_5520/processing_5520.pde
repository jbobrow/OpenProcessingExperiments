
//color kolor = color(200,200,255);

int exx =40;
float exx1 =10;
int sizer = 2;
float k=0;
float bux = 0;

void setup() {
  size(600,600,P3D);
  background(0);
  strokeWeight(2);
  lights();

}

void draw() {
  
  
  pushMatrix();
  translate(300,300,-700);
  rotateX(k/2);
  rotateY(-k);


  //background(0);
  glow(exx, sizer,bux);
  exx+=exx1;
  if (exx > width-sizer) {
    exx1=-exx1;

  }
  if (exx < sizer) {
    exx1=-exx1;
  }




  k+=0.03;
  bux = sin(k/2)*200; 
  popMatrix();
}


void glow(int x, int y, float c) {

  for (float i=-y; i < y; i+=0.01){

    line(x+i,0,x+i,20);
    stroke(c,255,255,5);
  }
}


