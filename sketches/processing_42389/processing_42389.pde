
//Auther: Weiyuh Li
//Purpose: Creating loops
//Explain: Press mouse botton to change shape & color of balls,
///////////direction X to influence color, direction Y to change shape


void setup() {
  size(600, 400);

  smooth();
  frameRate(16);
}

float a=second();
float b=second()*2;
float c=second()-5;





void draw() {

  background(200, 50, 50);
  noStroke();
  fill(50, 200, 50);
  rect(0, 0, 600, 200);

  int y=mouseY;
  int x=mouseX;

  //ball 1
  if (mousePressed && y<200) {

    stroke(0);
    strokeWeight(1);
    fill(200, x, 50, 200);

    a=a+2;
    ellipse(0+a*2, 200, a/2, a+y);
  }
  else if (mousePressed && y>=200) {
    stroke(0);
    strokeWeight(1);
    fill(200, 50, x, 200);

    a=a+2;
    ellipse(0+a*2, 200, (a/2)+(y/2), a/2);
  }
  else {
    stroke(0);
    strokeWeight(1);
    fill(100, 200, 200+a, 200);

    a=a+2;
    ellipse(0+a*2, 200, a/2, a/2);
    if (a>400) {
      a=0;
    }
  }
  //ball 2
  if (mousePressed && y<200) {

    stroke(0);
    strokeWeight(1);
    fill(200-(b/2), x/2, 50, 150);

    b=b+1;
    ellipse(0+b, 200, b/5, b/3+2*y);
  }
  else if (mousePressed && y>=200) {
    stroke(0);
    strokeWeight(1);
    fill(200, 50+(b/2), x/2, 150);

    b=b+1;
    ellipse(0+b, 200, (b/5)+y, b/3);
  }
  else {
    stroke(0);
    strokeWeight(1);
    fill(50, 50, 200-b, 150);

    b=b+1;
    ellipse(0+b, 200, b/5, b/3);
    if (b>600) {
      b=0;
    }
  }
  //ball 3
  if (mousePressed && y<200) {

    stroke(0);
    strokeWeight(1);
    fill(x-c, 100, 100, 150);

    c=c+2;
    ellipse(0+c, 200, c, c/3+y);
  }
  else if (mousePressed && y>=200) {
    stroke(0);
    strokeWeight(1);
    fill(0+c, 200, (x+c)/3, 150);

    c=c+2;
    ellipse(0+c, 200, c+y, c/5);
  }
  else {
    stroke(0);
    strokeWeight(1);
    fill(200, 200, c/2, 150);

    c=c+2;
    ellipse(0+c, 200, c+3, c+3);
    if (c>2000) {
      c=0;
    }
  }
}

void keyPressed(){
saveFrame("flexible balls.jpg");
}

