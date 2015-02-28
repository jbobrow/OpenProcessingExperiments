
PImage img;
int picker = 0;
int[] r1 = {224, 214, 201,250,250,250,250,255,255,255};
int[] g1 = {49,77,25,239,171,45,0,197,170,226};
int[] b1 = {7,7,17,63,40,21,0,12,69,0};
   
boolean click =false;
int a = 1000;
PVector[] pos;
PVector[] vel;
 
int[] ttl;
 
float pmx = 0;
float pmy = 0;
 
float r = 0;
float g = 0;
float b = 0;
float ca = 0;
void setup() {
  size(300, 600);
  img = loadImage("DSC00042_01.jpg");
  frameRate(30);
 
 
  pos = new PVector[a];
  vel = new PVector[a];
  ttl = new int[a];
  for ( int i = 0; i < a; i++) {
    pos[i] = new PVector(0, 0);
    if (i < a/1000) {
      vel[i] = new PVector(random(-2, 2), random(-5, -5));
      ttl[i] = int(random(10, 50));
    }
    else {
      vel[i] = new PVector(random(0, 400), random(0, 400));
      ttl[i] = int(random(0, 50));
    }
  }
}
 
void draw() {
  image (img, 0,0);
  fill(200, 50);
  noStroke();
  rect(0, 0, width, height);
  stroke(r, g, b, ca);
  smooth();
  if(click == true)
  {
    for ( int i = 0; i < a; i++) {
      point( pos[i].x + mouseX, pos[i].y + mouseY );
    }
    pmx = mouseX;
    pmy = mouseY;
    a = 400;
  } else {
    if(a > 1) {
      a = int(a*0.99);
    }
    for ( int i = 0; i < a; i++) {
      point( pos[i].x + pmx, pos[i].y + pmy );
    }
    pmy = pmy * 1.05;
  }
 
  for ( int i = 0; i < a; i++) {
    pos[i].add( vel[i] );
    ttl[i]--;
    if (ttl[i] < 0) {
      vel[i] = new PVector(random(-5, 5), random(-5, 5));
      pos[i] = new PVector(random(-5, 10), random(-5, 10));
      ttl[i] = int(random(0, 50));
    }
  }
}
 
 
void mousePressed() {
 
  picker = int(random(0, 10));
  println(picker);
  r = r1[picker];
  g = g1[picker];
  b = b1[picker];
  ca = random(100, 100);
  
  strokeWeight(random(4,6));
 
  click= true;
 
}
 
void mouseReleased() {
  {
    click= false;
  }
}


