
float x, y, seed=420, f, stepSize=8; // Each seed value gives a different fractal.
double df=0, ddf=TWO_PI/seed, dddf=0.000000005; // dddf controls how much the fractal changes with each frame.
int i=0;
int startTime=3600*hour()+60*minute()+second(); // How many seconds since midnight?
void setup() { // 'setup' is called just once, when the program is run.
  size(400, 400); // Tell Processing how big a window it should use.
  background(0);
}
void draw() { // 'draw' is called every time the program draws a frame.
  // We need to reset most of the variables every frame.
  x=width/2;
  y=height/2;
  f=0;
  df=0;
  ddf=TWO_PI*(startTime+millis()/1000.0)/86400.0; // Seconds since midnight, to the nearest millisecond.
  
  // 
  strokeWeight (3);
  stroke (255, 0, 128, 8);
  line (x, y, x+108*sin(second()*TWO_PI/60.0), y-108*cos(second()*TWO_PI/60.0));
  stroke (128,255, 0, 8);
  line (x, y, x+120*sin(minute()*TWO_PI/60.0+second()*TWO_PI/3600.0), y-120*cos(minute()*TWO_PI/60.0+second()*TWO_PI/3600.0));
  stroke (0, 128, 255, 8);
  line (x, y, x+60*sin(hour()*TWO_PI/12.0+minute()*TWO_PI/3600.0), y-60*cos(hour()*TWO_PI/12.0+minute()*TWO_PI/3600.0));
  strokeWeight(2);
  /*
  ellipseMode (CENTER);
  fill (255, 0, 0);
  ellipse (x+108*sin(second()*TWO_PI/60.0), y-108*cos(second()*TWO_PI/60.0), 8, 8);
  fill (0,255, 0);
  ellipse (x+120*sin(minute()*TWO_PI/60.0+second()*TWO_PI/3600.0), y-120*cos(minute()*TWO_PI/60.0+second()*TWO_PI/3600.0), 12, 12);
  fill (0, 0, 255);
  ellipse (x+60*sin(hour()*TWO_PI/12.0+minute()*TWO_PI/3600.0), y-60*cos(hour()*TWO_PI/12.0+minute()*TWO_PI/3600.0), 16, 16);
  println(hour()+":"+minute()+":"+second());
  println(sin(hour()*TWO_PI/12.0));
  println(cos(hour()*TWO_PI/12.0));
  */
  //background(255); // This fills in the frame with a white background.
  fill(0,6);
  stroke(255);
  rect(0,0,width,height);
  for (i=0; i<360; i+=1) { // Repeat the next block 9000 times.
    stroke (i, 180-(sq(i-200)/180), 360-i);
    f+=df;
    df+=ddf;
    x+=stepSize*cos(f);
    y+=stepSize*sin(f);
    point(x, y);
  }
  //ddf+=dddf; // So ddf changes every frame, causing animation to happen.
}
