
int x=150;
int y=250;
int speed=-5;

void setup () {
  size (300, 300);
}

void draw () {
  y+=speed;
  if (y<350) {


    float a=random(255);
    float b=random(100);
    float c=random(75);
    float d=random(300);
    float bordA=random(120);
    float bordB=random(180,300);
    background(b, c, b);
    jetson (x, y);
    stroke(a, b, c, a);
    strokeWeight(5);
    line(120, 0, 120, 300);
    line(180, 0, 180, 300);
    frameRate(30);
    ellipse(bordA,d,10,10);
    ellipse(bordB,d,10,10);
  }
  if (y<-50) {
    y=speed-1;
    y=350;
    
    float a=random(255);
    float b=random(200);
    float c=random(230);
    background(a, b, c);
  }
}

/*  strokeWeight(1);
 jetson (275,y-1);
 jetson (175,y-5);
 jetson (175,y-10);
 frameRate(30);*/

void jetson (int x, int y) {
  noStroke();
  strokeWeight(4);
  beginShape();
  vertex(x-25, y+25);
  vertex(x, y);
  vertex(x+25, y+25);
  endShape();
}



