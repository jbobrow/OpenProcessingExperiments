
float a=0;


void setup(){
  size(600,600,P3D);
  background(255);
}

void draw(){
  
  
  
  translate(300,300);  
  float bx =mouseX;
  float by =mouseY;
  float cx= a;
  float cy= a;
  float distb = sqrt(bx*bx+by*by);
  float distc = sqrt(cx*cx+cy*cy);
  float oizuk = abs(bx*cy-by*cx);
  float c = map(oizuk,0,180,0,255);
  strokeWeight(3);
  rotateY(cos(a));
  
  stroke(255,c,c,20);
  rotateZ(sin(a));
  fill(0);
  box(200-a*10);
  a+=0.005;
  if (a>20) a=20;

}



