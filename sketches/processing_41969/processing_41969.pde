



void setup() {
  size(500,365);
}


void draw () {
  background(#29A7AA);
  
PImage img;
img = loadImage("frank_sinatra_bio_1.jpg");
int a = img.width/4;
int b = img.height/4;
image (img,random(100),random(400),a/1,b/1);

PImage mon;
mon = loadImage("Marilyn Monroe - Chanel No 5.jpg");
int c = mon.width/1;
int d = mon.height/1;
image (mon,width/2,0,c/1,d/1);

  noStroke();
  fill(#400B12); 
  
  //rectMode(CENTER);
  if (mousePressed) {
    cursor(ARROW);
    smooth();
    beginShape();
    vertex(250,150);
    bezier(250,200,400,100,200,400,250,400);
    endShape();
    beginShape();
    vertex(250,150);
    bezier(250,200,100,100,200,400,250,400);
    endShape();
  } else {
    cursor(HAND);
  }
  
}

