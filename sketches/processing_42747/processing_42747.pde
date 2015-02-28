
int num = 5;
int s =200;

int [] x = new int [num];
int [] y = new int [num];

void setup() {
  size(500, 500);
  smooth();
  for (int i = 0; i <num; i++) {
    x[i] = int(random(width));
    y[i] = int(random(height));
    }
}

void draw () {
  
  colorMode(HSB, 360, 100, 100);
for (int i = 0; i < height; i++) {
  stroke(20, map(i, 0, height, 99, 0), 99);
  line(0, i, width, i);
  
   PImage img;
img = loadImage("condo.jpg");
int p = img.width/4;
int q = img.height/4;
image (img, 210, 160, p/1, q/1);
  
  
 
}
  colorMode(RGB, 255);
  for (int i = 0; i <num; i++) {
    x[i]++;
    //y[i]++;
    if (x[i]>width+s) {
      x[i]=-s;
      y[i]=int(random(height));
      }
   
    cloud(x[i], y[i]);
  }
}


void cloud(int x, int y) {
  noStroke();
  fill(255);
  ellipse(x+105, y+55, 110, 110); 
  ellipse(x+35, y+75, 70, 50);
  ellipse(x+155, y+70, 85, 70); 
}



