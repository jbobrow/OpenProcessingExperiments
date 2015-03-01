
float px = 1;
float py = 300;
float pa = 4;
float pb = 150;

void setup() {
  size(600, 600);
  colorMode(HSB);

}
void draw() {
  float aleatorio = random(0, 250);
  background ((aleatorio), 122, 255);

  for (int i = 500;i>0;i=i-2) {
    
 
    stroke((i/2)+(mouseX/3), 100, 255);
    ellipse(300, 300, i, i);
  }
  { if (px<width/2) {
    px = px + 10;
  }else{
    py=py -10;
  }

  ellipse (px, py, 100, 100);
} { if (pa<height) {
    pa = pb +2;
  }
  ellipse (300, 300, aleatorio, aleatorio);
}

}


