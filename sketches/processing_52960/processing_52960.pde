
PShape moca;

void setup() {

  size(800, 800);
  shapeMode(CENTER);
  moca = loadShape("moca.svg");
}

void draw() {

  int mode = 1;
  smooth();

  if (mode==1) {


    float mx = mouseX;
    float my = mouseY;
    background(0);

    shape(moca, width/2, height/2);
    fill(0, 174, 239, 90);
    noStroke();
    triangle(170, 345, 170, 450, mx, my);
    triangle(170, 345, 215, 415, mx+40, my+200);
    triangle(260, 345, 260, 450, mx+100, my-100);
    fill(255, 3, 9, 90);
    triangle(580, 345, 530, 450, my, my);
    triangle(580, 345, 625, 450, mx-40, mx);
    shape(moca, width/2, height/2);

    if (mousePressed) {
      mode=2;
    }
  }

  if (mode==2) {

    float mx = pmouseX;
    float my = pmouseY;


    background(255);
    shape(moca, width/2, height/2);

    fill(0, 174, 239, 90);
    noStroke();
    triangle(170, 345, 170, 450, mx, my);
    triangle(170, 345, 215, 415, mx+40, my+200);
    triangle(260, 345, 260, 450, mx+100, my-100);
    if (mousePressed) {
      mode=3;
      noLoop();
    }
  }

  if (mode==3) {

    loop();

    background(0);

    fill(0, 174, 239, 90);
    noStroke();
    triangle(170, 345, 170, 450, 400, 300);
    triangle(170, 345, 215, 415, 400, 300);
    triangle(260, 345, 260, 450, 400, 300);

    fill(255, 1, 22, 90);
    noStroke();
    triangle(580, 345, 530, 450, 400, 300);
    triangle(580, 345, 625, 450, 400, 300);
    shape(moca, width/2, height/2);

    if (mousePressed) {
      mode=1;
    }




    //if (mousePressed && mode==2) {
    //mode=1;


    //else if (mode == 2){
  }
  println(mode);
}


