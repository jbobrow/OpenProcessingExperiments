
import processing.video.*; 

Capture camara;  
int cuadros =100;
PImage[] m;

int trans = 5;
int[] alfa;

void setup() 
{
  
  size(600, 400, P3D);
  camara = new Capture(this, width, height, 30);
  m= new PImage[cuadros];
  for (int i= 0; i<cuadros;i++){
    m[i]=createImage(width,height,RGB);
  }

alfa = new int[width*height];
    for (int i = 0;i<alfa.length-10;i++) {
alfa[i]=trans;
    }

}

void captureEvent(Capture camara) {
  camara.read();
  
  
}

void draw() {
  filter(BLUR,1);
  filter(ERODE);
  
  tint (0,153,204,10);
  
  camara.mask(alfa);
  image(camara, 0,0);
  m[cuadros-1]=camara;
  for (int i = 0;i<cuadros-1;i++) {
      m[i].set(0, 0, m[i+1]);
      m[i].updatePixels();
    }

  for (int i =0; i<200;i++) {
    int x = (int)random(width);
    int y = (int)random(height);
  color col=  camara.get(x,y);
  fill (col);
  
  noStroke();
  //smooth();
  float bri = brightness(col);
  
  ellipse(x,y,bri/20,bri/10);
 

  }
}

