
// Transcription of program columnBC
// originally prepared by Paul Rother for John Whitney for the book "Digital Harmony"
// ported to the Processing language by Jim Bumgardner
// ----------
// Special effects added by Peter_K

float stepstart = 0,
      stepend = 1/60.0,
      xleft = 38, 
      ybottom = 18,
      
      radius = 85,
      xcenter = 140,
      ycenter = 96,
      speed = .2,
      deltaSpeed = 0.003;

int  npoints = 560;

boolean drawLines  = true,
        blurImage  = true,
        looping    = true
        ;

color[][] colorPresets = {
  {color(250,0,0), color(0,255,0)},
  {687805, 13855447},
  {color(55,0,0), color(255,0,0)},
  {color(0,255,0), color(0,0,100)},
  {10230162, 12175985},
  {8580517, 4595504},
  {1066950, 5626646},
  {15091019, 10870197},
  {0, 16777215}
};

color   c1, c2;

void setup()
{
  size(400,400);//,P2D);
  radius = height*.9/2;
  xcenter = width/2;
  ycenter = height/2;
  frameRate(45);
  fill(255);
  background(0);
  strokeWeight(5);
  c1 = color(250,0,0);
  c2 = color(0,255,0);
}

void draw()
{
  if (blurImage) {
    blur();
  } else {
    background(0);
  }
  
  float ftime = millis()*.001*speed;
  float step = stepstart + (ftime * (stepend - stepstart));

  float x, y, px=0, py=0;
  for (int i = 0; i < npoints; ++i)
  {
    float a = 2*PI * step * i;
    float radiusi = radius;
    float perc = (i/(float)npoints); 

    color c = color(red(c2)*perc, green(c2)*perc, blue(c2)*perc);
    c = blendColor(c1,c,ADD);
    stroke(c);

    x = xcenter + cos(a) * perc * radiusi;
    y = ycenter + sin(a) * perc * radiusi;
    if ((i>0) && (drawLines)) {
      line(px,py,x,y);
    } else {
      point(x,y);
    }
    px = x;
    py = y;
  }
  //println(frameRate);
}

void blur() {
  PImage img;
  img=get();
  img.resize(width/2,height/2);
  img.resize(width,height);
  image(img,-1,-1);
}

void mousePressed() {
  /*saveFrame();*/
  if (mouseButton == LEFT) {
    drawLines = !drawLines;
  }
  if (mouseButton == RIGHT) {
    blurImage = !blurImage;
  }
}

void keyPressed() {
  if ((key>='1') && (key<='9')) {
    int num_pressed = int(key)-48;
    if (num_pressed<=colorPresets.length) {
      c1 = colorPresets[num_pressed-1][0];
      c2 = colorPresets[num_pressed-1][1];
    }
  } else 
  
  if (key==' ') {
    c1 = int(random(16777216));
    c2 = int(random(16777216));
    //println("  {" + c1 + ", " + c2 + "},");
  } else 
  
  if (key=='+') {
    speed += deltaSpeed;
  } else 
  
  if (key=='-') {
    speed -= deltaSpeed;  
  } else 
  
  if (keyCode == BACKSPACE) { 
    looping = !looping;
    if (looping) {
      loop();
    } else {
      noLoop();
    }
  } 
}

