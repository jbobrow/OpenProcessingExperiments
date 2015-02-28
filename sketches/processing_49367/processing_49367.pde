
Kiki k1;
Kiki k2;

// perlin noise
float xt1 = 0.0;
float yt1 = 100.0;
float xt2 = 200.0;
float yt2 = 300.0;
float increment1 = 0.01; // controls distance between numbers
float increment2 = 0.05; // controls distance between numbers

void setup() {
  size (500,500);
  frameRate(30);
  smooth();
   
  // init balls
  k1 = new Kiki(240,320, color(83,234,205));
  k2 = new Kiki(240,400, color(212,227,21));
}

void draw () {
 background(0);
  // get coordinates for ball 1
  float x1 = k1.x;
  float y1 = k1.y;
  float x2 = k2.x;
  float y2 = k2.y;
 
  // check for hit
  k2.hitTest(k1);
 
  // add noise
  x1 = width * noise(xt1);
  y1 = height * noise(yt1);
  x2 = width * noise(xt2);
  y2 = height * noise(yt2); 
   
  // display balls
  k1.display(x1, y1);
  k2.display(x2, y2);
   
  // increment timers
  xt1 += increment1;
  yt1 += increment1;
  xt2 += increment2;
  yt2 += increment2;
   
}


