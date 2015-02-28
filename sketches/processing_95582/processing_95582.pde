
PFont f;
String a= "EXPAND";
int l= a.length();
char c[]=new char[l];
float[] xx= new float [l];
float[] yy= new float [l];
float[] targetX= new float[l];
float targetY= 250;


void setup() {
  smooth();
  f = loadFont("SansSerif.plain-48.vlw");
  size (500, 500, P3D);

  textFont (f, 48);
  for (int i=0; i<l;i++) {


    xx[i]=random(0, 500);
    yy[i]=random(0, 500);
  }
}

void draw() {
  

 
  frameRate(15);
  background(0);    
  for (int k=0;k<l;k++) {
    c[k]= a.charAt(k);
  }
  for (int k=0;k<l;k++) {
    targetX[k]=170+k*mouseX;
    text(c[k], xx[k], yy[k]);
    xx[k]=targetX[k];
    yy[k]=targetY;
  }
}
void mouseMoved(){
   if (mouseX>pmouseX) {
    a="EXPAND";
  }
   if (mouseX<pmouseX)
  {
    a="SHRINK";
  }
}


