


PFont dfont;
float x;
float y;
float y2;
int r = 50;
float ran;
float ran2;

void setup () {
  size (500, 500);
  smooth();
  dfont = loadFont("Dax-Black-80.vlw");
  textFont(dfont);
  x = width/2;
  y = height/2;
  y2 = height/2;
  //  frameRate(1);
  //  ellipseMode(RADIUS);
}

void draw() {
  ran = random(0, 10);
  ran2 = random(20, 30);

  background(255);

  textSize(40);
  fill(150);
  text ("Poof!", x-40, y2);

  //  ellipse(x, y-15, 34, 20);

  float d = dist (mouseX, mouseY, x, y);
  println(ran2);

  if (d<r) {

    for (int i=1; i<=height; i=i+2) {
      y2=y2+i;
  /*  }
    noStroke();
    fill(255);
    rectMode(CENTER);
    rect (width, height, 500, 500);

    for ( int i=1; i<=100; i=i+1) {

      for (int e=2; e<=100; e=i+2) {
        fill(150); 
        ellipse(width/2+e, height/2+e, 40, 40);
      }*/
    }
  }
  /*
  else if (d > r){
   for (int i=1; i<=width/2; i=i-1) {
   y2 = y2-i;
   }
   }*/
}


