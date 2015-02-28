
float r;
float s;
float t;
float c;
float d;
float e;
float j;
float k;
float l;
float u= random(0, 255);
float v= random(0, 255);
float w= random(0, 255);


void setup() {
  size(800, 200);
  smooth();
}

void draw() {

  background(u, v, w);
  //drawCube(xpos, ypos, green);
  //base "black"

  if ( mousePressed == true) {
    background(u, v, w);
  }
  else {
    background(230, 147, 141);
  }

  drawCube(20, 60);
  drawCube(240, 60);
  drawCube(470, 60);
  drawCube(690, 60);

  //C1(xpos, ypos, rval, gval) yellow
  //1st cube ROWS


  C1(20, 60, u, v, e);

  //C2 red
  C1(20, 88, 255, 0, 0); 

  //C3 blue
  C1( 20, 117, 0, 0, 255);



  ///////////////////////////////////

  //2nd cube 1st row- orange
  C2(240, 60, u, v, w);

  //2nd row- red
  C2(240, 88, 255, 0, 0);
  //3rd row- gren 
  C2(240, 117, 0, 255, 0);

  ///////////////////////////////////////

  //3rd cube 1st COLUMN- yellow
  C3(470, 60, 240, 255, 0);
  //2nd column- white
  C3(498, 60, 255, 255, 255);
  //3rd column- green
  C3(526, 60, 0, 255, 0);

  //4th cube COLUMN
  //1st- blue
  C3(690, 60, 0, 0, 255);
  //2nd- oragne
  C3(718, 60, 250, 129, 0);
  //3rd-white
  C3(746, 60, 255, 255, 255);
}



void drawCube(float x, float y) {
  fill(0);
  rect(x, y, 90, 90);
  noStroke();
}

void C1(float x, float y, float r, float s, float t) {
  fill(r, s, t);
  rect(x+3, y+3, 25, 25);
  rect((x+3)*2+ 5, y+3, 25, 25);
  rect((x+3)*3+ 10, y+3, 25, 25);
  noStroke();

  if ((mouseX>= 20) && (mouseX<=110) && (mouseY>= 60) && (mouseY<= 150) && (mousePressed == true)) {
    fill(s, t, r);
    rect(x+3, y+3, 25, 25);
    rect((x+3)*2+ 5, y+3, 25, 25);
    rect((x+3)*3+ 10, y+3, 25, 25);
  }
}
void C2(float a, float b, float c, float d, float e) {
  fill(d, e, c);
  rect (a+3, b+3, 25, 25);
  rect ((a+3)+28, b+3, 25, 25);
  rect((a+3)+56, b+3, 25, 25);

  if ((mouseX>= 240) && (mouseX<= 330) && (mouseY >= 60) && (mouseY <= 150) && (mousePressed == true)) {
    fill(e, c, d);
    rect (a+3, b+3, 25, 25);
    rect ((a+3)+28, b+3, 25, 25);
    rect((a+3)+56, b+3, 25, 25);
  }
}

// column from cube 3-4

void C3(float h, float i, float j, float k, float l) {
  fill(j, k, l);
  rect(h+3, i+3, 25, 25);
  rect(h+3, (i+3)+28, 25, 25);
  rect(h+3, (i+3)+56, 25, 25);

  if ((mouseX>= 470) && (mouseX<= 560) && (mouseY>= 60) && (mouseY <= 150) && (mousePressed == true) 
    || (mouseX>=690) && (mouseX<=780) && (mouseY>= 60) && (mouseY<= 150) && (mousePressed == true)) {
    fill(k, l, j);
    rect(h+3, i+3, 25, 25);
    rect(h+3, (i+3)+28, 25, 25);
    rect(h+3, (i+3)+56, 25, 25);
  }
}
void mousePressed() {
  redraw();
}



