
// janice pang
// october 10, 2013
// ex. 2-1

// variables
int w = 300;
int h = 300;
int weight = 1;
int increase = weight + 1;

// line variables
int xVert = 150;
int yHor = 150;
int diagonal = 100;

// dot variables
int circle = 5;

// background variables
int b = 57;
boolean u = true;

// line variables
int line1 = 150; //how far line travels?
int line2 = 150;
boolean grow = true;


// document settings
void setup () {
  size(w, h);
  //background(20, 20, 70);

  frameRate(20);
}

// draw lines
void draw() {
  background(6, 51, b);
  strokeWeight(weight);
  fill(255);
  stroke(#D7A353);

  //---------------------update stroke
  //---------------------diagonal small left
  stroke(#D7A353);
  line(diagonal, diagonal, diagonal*2, diagonal*2);
  noStroke();
  ellipse(diagonal, diagonal, circle, circle);
  ellipse(diagonal*2, diagonal*2, circle, circle);
  //---------------------diagonal small right
  stroke(#D7A353);
  line(diagonal*2, diagonal, diagonal, diagonal*2);
  noStroke();
  ellipse(diagonal*2, diagonal, circle, circle);
  ellipse(diagonal, diagonal*2, circle, circle);
  //---------------------update stroke
  //---------------------diagonal big left
  stroke(#D7A353);
  line(diagonal, 40, 200, 260);
  noStroke();
  ellipse(diagonal, 40, circle, circle);
  ellipse(200, 260, circle, circle);
  //---------------------diagonal big right
  stroke(#D7A353);
  line(200, 40, diagonal, 260);
  noStroke();
  ellipse(200, 40, circle, circle);
  ellipse(diagonal, 260, circle, circle);
  //---------------------update stroke
  //---------------------diagonal big mid left
  stroke(#D7A353);
  line(40, diagonal, 260, 200);
  noStroke();
  ellipse(40, diagonal, circle, circle);
  ellipse(260, 200, circle, circle);
  //---------------------diagonal big mid right
  stroke(#D7A353);
  line(40, 200, 260, diagonal);
  noStroke();
  ellipse(40, 200, circle, circle);
  ellipse(260, diagonal, circle, circle);

  //moving line
  //---------------------vertical
    stroke(#D7A353);
  line(w/2, h/2, w/2, line1);
  line(w/2, h/2, w/2, line2);
  noStroke();
  ellipse(w/2, line1, circle, circle);
  ellipse(w/2, line2, circle, circle);
  //---------------------horizontal
  stroke(#D7A353);
  line(w/2, h/2, line1, h/2);
  line(w/2, h/2, line2, h/2);
  noStroke();
  ellipse(line1, h/2, circle, circle);
  ellipse(line2, h/2, circle, circle);


  // line boolean
  if (line1 >= h/2 && line2 <= h) {
    grow = true;
  }
  else if (line1 <=0 ){
    grow = false;
  }


  if (grow) {
    line1 -= 3;
    line2 += 3;
  }
  else if (!grow) {
    line1 += 3;
    line2 -= 3;
  }



  // background boolean
  if (b > 255) {
    u = false;
  }
  else if (b < 57) {
    u = true;
  }

  if (u) {
    b += 3;
  }
  else if (!u) {
    b -= 3;
  }
}
