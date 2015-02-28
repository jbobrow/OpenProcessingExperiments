
/* @pjs preload= "washing.png"; */

float[] a;
float [] b;
float [] c;
float [] d;

//realized this doesn't work! How could I get this effect? 
float j = random(#AAA8EA, #A8EAE9);
float k = random (#14DED8, #8AA7F5);
float l = random (#1DA9CE, #B4E7F5);

  void setup() {
    size(600,600);
    stroke(50,50,250);
    fill(#55F2FF);

    a = new float[50];
    b = new float [600];
    c = new float [300];
    d = new float [600];
  }
 
  void draw() {
        background(255);

  PImage img;
  img = loadImage("washing.png");
  image(img, 300, 300);

    int i = 40;
    while ( i <= 49) {
     ellipse(i*10,a[i]*15,50,50);
      a[i] = a[i/8] + random(-5, 20);
      i = i + 1;
    }
    
    int start_time = 3000;
  if ( millis() > start_time) {
    fill(#D8FCFF);
       int x = 0;
    while ( x <= 300) {
     ellipse(x,b[x]*25,5,5);
      b[x] = b[x] + random(-5, 10);
      x = x + 1;
    }}
    
      int start_time2 = 6000;
  if ( millis() > start_time2) {
    fill(#D8FCFF);
       int f = 0;
    while ( f <= 300) {
     ellipse(f,d[f]*25,5,5);
      d[f] = d[f] + random(-5, 10);
      f = f + 1;
    }}
    
    int y = 1;
    if (mousePressed == true) {
    while (y <= 100) {
      ellipse(c[y]*5, y*50, 100,100);
      c[y] = c[y] + random(-5, 5);
      y = y + 1;
    }}
  }


