
PImage cup;
PImage gully;
PImage back_bw;
PImage back_bw_1;
float angle;
float jitter;



void setup() {
  size(500, 500);
  smooth();
  cup = loadImage("cup.png");
  gully = loadImage("gully.png");
  back_bw = loadImage("back_bw.jpg");
  back_bw_1 = loadImage("back_bw_1.png");
  frameRate(60);
  imageMode(CENTER);
  rectMode(CENTER);
}

void draw() {
  image(back_bw, 250, 250);
  noFill();
  stroke(255);
  strokeWeight(4);
  ellipse(250, 250, 300, 300);
  image(back_bw_1, 250, 249);

  if ( mouseX < 250 ) {
    if ( mouseX > 200)
      image(back_bw_1, 240, 250, 700, 700);
  }
  
  pushMatrix();
  translate(250, 250);
  rotate(frameCount/60);
  image(gully, 100, 100, 100, 100);
  popMatrix();
  
  
  // during even-numbered seconds (0, 2, 4, 6...)
  if (second() % 2 == 0) {  
    jitter = random(-0.1, 0.1);
  }
  angle = angle + jitter;
  float c = cos(angle);
  translate(width/2, height/2);
  rotate(c);
  rect(0, 0, 180, 180);  



  if ( mouseX < 250 ) {
    if ( mouseX > 200)
      rect(0, 0, 400, 400);
  }



  //image(gully, a, b,200, 200);
  //image(gully, x, x, c, c);
}



