
int frameWeidth = 600;
int frameHeight = 600;
int black = 0;
int white = 255;
int radius = 40;
void setup() {
  size(frameWeidth, frameHeight);
  background(white);
}

void draw() {
  background(white);
  //head
  fill(white);
  strokeWeight(4);
  ellipseMode(RADIUS);
  ellipse(300, 150, 100, 100);
  point(300, 175);
  arc(300, 190, 50, 50, 0.3, PI-0.3);



  // eye ball
  if (mousePressed) {

    if ( mouseButton == LEFT) {
      fill(white);
      arc(250, 150, 40, 20, 0.3, PI-0.3);
      eye(350,150);
    }
    else {
      fill(white);
      arc(350, 150, 40, 20, 0.3, PI-0.3);
      //draw left eye
      eye(250,150);
    }
  }
  else {
    //draw both eye
    eye(350,150);
    eye(250,150);
  }
  //body

  fill(black);
  strokeWeight(4);
  line(200, 300, 400, 300);
  line(300, 250, 300, 450);
  line(200, 550, 300, 450);
  line(300, 450, 400, 550);
  text("try click left or right button",50,400);
}

void eye(int x, int y) {
  fill(white);
  //eyes round
  ellipseMode(RADIUS);
  ellipse(x, y, radius, radius);
  float  EyeY;
  if (mouseY <= 150) {
    EyeY = map(mouseY, 0, y,y-radius/2,y );
  } 
  else {
    EyeY = map(mouseY, y, frameHeight, y, y+radius/2);
  }
  float EyeX = map(mouseX, 0, frameWeidth, x-radius/2,x+radius/2);

  fill(black);
  ellipse(EyeX, EyeY, radius/2, radius/2);
}



