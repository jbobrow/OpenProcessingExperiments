

 
int pixelSize;

PImage img;

  float a = 500;
  float b = 500;
  int c = 500;
  int d = 500;
  int e = 500;

void setup() {
colorMode(HSB, 200);
noStroke();
size (800,600);
img = loadImage("treeline2.png");
}
void draw() {

    a=mouseX*.2+200; 
    b=mouseX*.5+200;
    c=mouseX*1+200;
    d=mouseX*2+200;
    e=mouseX*int(random(5)+200);


background (mouseX/4,100,100);
pixelSize = 20+(mouseY/10);
for (int i=0; i < width; i=i+pixelSize) {
   for (int j=0; j < height; j=j+pixelSize) {
     strokeWeight(random(1));
     fill(mouseX/4, random(255), random(200), random(250));
    }
  }


ellipse(500,125,30,30);
ellipse(a,a,60,60);
ellipse(b,b,120,120);
ellipse(c,c,200,200);
ellipse(d,d,400,400);
ellipse(40,100,e,4);

 k(c, 180, 20, 20);
 k(d, 300, 50, 50);
 k(a, 80, 5, 5);
 

 image(img,0, 280);
  
}

void k(float x, float y, int w, int h){

  rect(x, y, w, h);

  rect(x-80, y-80, w-10, h-10);

  rect(x-60, y-60, w-12, w-12);

  rect(x-20, y-120, w-18, h-18);
}



