
Kitty Kitty1;
Kitty Kitty2;

//perlin noise
float xt1 = 0.0;
float yt1 = 100.0;
float xt2 = 200.0;
float yt2 = 300.0;
float increment1 = 0.01;
float increment2 = 0.05;

void setup() {
  size (640,480);
  frameRate(30);
  smooth();
  
  Kitty1 = new Kitty(0,100,178);
  Kitty2 = new Kitty(330,70,178);
}

void draw() {
  background(0);
  
  float x1 = Kitty1.x;
  float y1 = Kitty1.y;
  float x2 = Kitty2.x;
  float y2 = Kitty2.y;
  
  Kitty1.hitTest(Kitty2);
  
  x1 = width * noise(xt1);
  y1 = height * noise(yt1);
  x2 = width * noise(xt2);
  y2 = height * noise(yt2);
  
  Kitty1.display(x1,y1);
  Kitty2.display(x2,y2);
  
  xt1 += increment1;
  yt1 += increment1;
  xt2 += increment2;
  yt2 += increment2;
}

