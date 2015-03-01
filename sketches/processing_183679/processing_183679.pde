
  
int r, g, b, timer, tim, alph;
float xoff = 0.0;
float yoff = 0.0;
float roff = 0.0;
float goff = 0.0;
float boff = 0.0;
float soff= 0.0;
float xstep, ystep, rstep, gstep, bstep, sstep, s;
float downlim = 0.001;
float uplim = 0.005;
boolean start=true;

void setup() {
  size(1280, 720);
  frameRate(24);
  background(255, 255, 255, 200);
  xstep=random(downlim, uplim);
  ystep=random(downlim, uplim);
  rstep=random(downlim, uplim);
  gstep=random(downlim, uplim);
  bstep=random(downlim, uplim);
  sstep=random(downlim, uplim);
  alph=(int)(random(100) + 54);
  tim = (int)(random(500));
  timer=millis();

}
void draw() {

  if (mousePressed == true || start == true) {
  start = false;
  mousePressed = false;
  
  
  background(255);
  
  
  for (int n=0; n<(random(10990))+500; n++) {
  xoff = xoff + xstep;
  yoff = yoff + ystep;
  roff = roff + rstep;
  goff = goff + gstep;
  boff = boff + bstep;
  soff = soff + sstep;
  
  
  float x = noise(xoff) * width;
  float y = noise(yoff) * height;
  int r= (int)(noise(roff)*255);
  int g= (int)(noise(goff) * 255);
  int b= (int)(noise(boff) * 255);
  float s= (int)(noise(soff)* 10);
  alph=(int)(random(100) + 54);
   
  noStroke(); 
  fill(r, g, b, alph);
  //ellipse(x, y, s, s);
  stroke(r, g, b, alph);
  line(0, 0, x, y);
  line(width, 0, x, y);
  line(0, height, x, y);
  line(width, height, x, y);
  line(width/2, 0, x, y);
  line(width/2, height, x, y);
  line(0, height/2, x, y);
  line(width, height/2, x, y);
  line(random(width), random(height), x, y);
  line(random(width), random(height), x, y);
  line(random(width), random(height), x, y);
  line(random(width), random(height), x, y);
  line(random(width), random(height), x, y);
  fill(0);
  textSize(20);
  textAlign(CENTER);
  text("Perlin Noise Study 1", width-width*0.1, height-height*0.05);
  //print(millis());
  
  if (millis() >= timer+tim) {
  xstep=random(downlim, uplim);
  ystep=random(downlim, uplim);
  rstep=random(downlim, uplim);
  gstep=random(downlim, uplim);
  bstep=random(downlim, uplim);
  sstep=random(downlim, uplim);
  timer=millis();
  tim = (int)(random(100));
  alph=(int)(random(100) + 54);
  
  }
  }
  }
}




