
//Robb Godshaw 2012 www.robb.cc
//Rubber Stamp 1
//Sorry for the code recyling, I ran out of time.
int coordCount = 0;
boolean click;
boolean drawn;
int[][] coord;
int clickCount = 0;
boolean upp = false;
float xa = -4, ya = 204, xb = 44, yb = 196, xc = 108, xd = 164, xe = 220;
float pitch = 300;

void setup() {
  size(600, 600);
  smooth();

  coord=new int [99][2];
}

void draw() {
      background(8, 35, 87);//blue!
  rainbows();
  clickTrack();

}

void mouseReleased() {
  click = true;
}

void clickTrack() {
  if (mousePressed == true && click == true && clickCount < coord.length
    ) {

    coord[clickCount][0] = mouseX;
    coord[clickCount][1] = mouseY;

    println("ClickCount" + clickCount);//prints the usable code that we start off with
    print("X" + coord[clickCount][0]);
    println("  Y"+coord[clickCount][1]);
    clickCount++;
    click=false;
    drawn = true;
  }
}
void rainbows() {
  for (int i = 0; i < clickCount; i = i+1) {
    rainbow(coord[i][0], coord[i][1], .7); //point on 10px grid near mouseY
  }
}


void rainbow(float XX, float YY, float size) {//function for rainbow

  pushMatrix();
scale(size);
  translate(XX-100, YY-100);
  stroke(239, 0, 0);//RED
  strokeWeight(3*8);
  strokeCap(ROUND);
  wave();

  stroke(244, 137, 0);//ORANGE
  translate(0, 3*8);
  wave();

  stroke(254, 255, 0);//YELOW
  translate(0, 3*8);
  wave();

  stroke(82, 255, 0);//GREEN
  translate(0, 3*8);
  wave();

  stroke(30, 126, 255);//BLUE
  translate(0, 3*8);
  wave();

  stroke(74, 0, 255);//purple
  translate(0, 3*8);
  wave();
  noStroke();
  popMatrix();
}


void wave() {

  noFill();
  if (upp) {
    ya = ya +0.01;
  }
  else if ( upp==false )
  {
    ya = ya -0.01;
  }
  if ( ya > 204) {
    upp = false;
  }
  else if ( ya < 196) {
    upp=true;
  }

  yb= 200-(ya-200);


  beginShape();
  curveVertex(xa, ya);
  curveVertex(xa, ya);
  curveVertex(xb, yb);
  curveVertex(xc, ya);
  curveVertex(xd, yb);
  curveVertex(xe, ya);
  curveVertex(xe, ya);
  endShape();
}
