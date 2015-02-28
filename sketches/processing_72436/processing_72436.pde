
int x =0;
int y=300;
PImage img;

void setup() {
   size(600, 600);
   background(255);
   img = loadImage("cigarette.png");
}


void draw() {
  tri();
  image(img, 200, 300);
  smoke();
  circle();
}

void smoke() {
  noStroke();
  smooth();
  fill(100, 100, 100, 5);
  for (int i=0;i<width*100;i++) {
    if (x==width+1) {
      x=400;
      y=height/2;
    }
    ellipse(x++, y+=(random(20)-11), random(10), random(10));
  }
}
void tri() {
  smooth();
  noLoop();
  for (int u=-30;u<height;u+=10) {
  for (int t=-30;t<width;t+=10) {
    noStroke();
    fill(random(220), 0, 0, random(10, 40));
    triangle(t+10, u+20, t+25, u+5, t+40, u+20);
    triangle(t+10, u+10, t+25, u+25, t+40, u+10);
  }}}

void circle() {
  stroke(#EF1514);
  strokeWeight(15);
  ellipse(310,310,310,310);
  line(200,200,420,410);
  fill(#EF1514);
  textSize(60);
  text("NO SMOKING", 130,550,12);
}






