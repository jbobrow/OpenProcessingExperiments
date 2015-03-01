
float n;
float cx;
float cy;
float r;
Boolean b=true;
PImage ball1;
PImage ball2;
PImage ball3;
PImage bottombar;
float colorPoly;
float ball1X = 111, ball2X = 511, ball3X = 911;


void setup() {
  size(1200, 700);
  background(255);
  bottombar = loadImage("bottombar.png");
  ball1 = loadImage("ball1.png");
  ball2 = loadImage("ball2.png");
  ball3 = loadImage("ball3.png");
  image(bottombar, 0, height-25);
  //  ball1X = 111;
  //  ball2X = 511;
  //  ball3X = 911;
  image(ball1, ball1X, height-16);
  image(ball2, ball2X, height-16);
  image(ball2, ball3X, height-16);
}


//n: shape, r: size
void polygon(float n, float cx, float cy, float r, float colorPoly) {
  float angle = 360.0 / n;
  fill(random(colorPoly), random(colorPoly), random(colorPoly));
  beginShape();
  for (int i = 0; i < n; i++)
  {
    vertex(cx + r * cos(radians(angle * i)), 
    cy + r * sin(radians(angle * i)));
  }
  endShape(CLOSE);
}

void draw() { 
  if ((b==true)) {


    if ((mouseX>=111)&&(mouseX<=111+266)&&(mouseY>=height-25)&&(mouseY<=height)) {

      if (mousePressed==true) {
        n = map(mouseX, 111, 111+266, 0, 10);
        image(bottombar, 0, height-25);
        image(ball1, mouseX, height-16);
        image(ball2, ball2X, height-16);
        image(ball3, ball3X, height-16);
        ball1X = mouseX;
      }
    }
    //     else {
    //      ball1X = mouseX;
    //
    //    }


    if ((mouseX>=511)&&(mouseX<=511+266)&&(mouseY>=height-25)&&(mouseY<=height)) {

      if (mousePressed==true) {
        r = map(mouseX, 511, 511+266, 0, 10);
        image(bottombar, 0, height-25);
        image(ball1, ball1X, height-16);
        image(ball2, mouseX, height-16);
        image(ball3, ball3X, height-16);
        ball2X = mouseX;
      }
    } 
//    else {
//      ball2X = mouseX;
//    }



    if ((mouseX>=911)&&(mouseX<=911+266)&&(mouseY>=height-25)&&(mouseY<=height)) {
      if (mousePressed==true) {
        colorPoly = map(mouseX, 911, 911+266, 0, 255);
        image(bottombar, 0, height-25);
        image(ball1, ball1X, height-16);
        image(ball2, ball2X, height-16);
        image(ball3, mouseX, height-16);
        ball3X = mouseX;
      }
    } 
//    else {
//      ball3X = mouseX;
//    }
    cx = random(width);
    cy = random(height-25);
  }

  polygon(n, cx, cy, r, colorPoly);

  //  if (keyCode==8) {
  //    background(255);
  //     image(bottombar, 0, height-25);
  //     b=false;
  //   
  //  } else if (keyCode==13) {
  //    b=true;
  //     image(bottombar, 0, height-25);
  //    image(ball1, ball1X, height-16);
  //    image(ball2, ball2X, height-16);
  //    image(ball3, ball3X, height-16);
  //  }
  //}
}



