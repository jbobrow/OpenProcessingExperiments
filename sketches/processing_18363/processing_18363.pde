
void setup () {
  size (250, 250);
  background (30);
  smooth ();
  frameRate (18);
}

float a;//alpha
float y;//y position
float rad;//radius

float radCir = 100;

void draw () {
  // setting background loop
  fill (30, 100);
  rect (0, 0, width, height);
  noStroke ();
  
  a += 5;
  y += 1;
  rad += 0.5;
  radCir += 0.5;
  
  //conditions
  if (y > 2*height) {
    y = 0;
  };
  if (a > 255) {
    a = 0;
  };
  if (rad > 8) {
    rad = 1;
  };
  
  //creating random circles goes down
  fill (255);

  ellipse (width/2, random(y), rad, rad);
  ellipse (width/2-10, random(y), rad, rad);
  ellipse (width/2-20, random(y), rad, rad);
  ellipse (width/2-30, random(y), rad, rad);
  ellipse (width/2-40, random(y), rad, rad);
  ellipse (width/2-50, random(y), rad, rad);
  ellipse (width/2-60, random(y), rad, rad);
  ellipse (width/2-70, random(y), rad, rad);
  
  ellipse (width/2+10, random(y), rad, rad);
  ellipse (width/2+20, random(y), rad, rad);
  ellipse (width/2+30, random(y), rad, rad);
  ellipse (width/2+40, random(y), rad, rad);
  ellipse (width/2+50, random(y), rad, rad);
  ellipse (width/2+60, random(y), rad, rad);
  ellipse (width/2+70, random(y), rad, rad);
  
  ellipse (width/2-5, height-random(y), rad, rad);
  ellipse (width/2-15, height-random(y), rad, rad);
  ellipse (width/2-25, height-random(y), rad, rad);
  ellipse (width/2-35, height-random(y), rad, rad);
  ellipse (width/2-45, height-random(y), rad, rad);
  ellipse (width/2-55, height-random(y), rad, rad);
  ellipse (width/2-65, height-random(y), rad, rad);
  ellipse (width/2-75, height-random(y), rad, rad);
  
  ellipse (width/2+5, height-random(y), rad, rad);
  ellipse (width/2+15, height-random(y), rad, rad);
  ellipse (width/2+25, height-random(y), rad, rad);
  ellipse (width/2+35, height-random(y), rad, rad);
  ellipse (width/2+45, height-random(y), rad, rad);
  ellipse (width/2+55, height-random(y), rad, rad);
  ellipse (width/2+65, height-random(y), rad, rad);
  ellipse (width/2+75, height-random(y), rad, rad);
  
  fill (30);
  if (radCir > 105) {
    radCir = 100;
  };
  ellipse (width/2, height/2, radCir, radCir);
}



