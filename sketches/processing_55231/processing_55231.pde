
int n=18; //wheels
int yn=332; //neck lines Y


void setup() {
  size(400, 600);

  //background(255);
  smooth();
}


void draw() {

  background(255);

  //--------------STATIC--------------------------

  //body
  fill(0);
  rect(135, 375, 130, 160);
  strokeWeight(7);
  stroke(255);
  line(257, 370, 130, 535);
  line(270, 370, 142, 539);
  noFill();
  stroke(0);

  //wheels
  fill(0);
  ellipse(140, 565, n, n);
  ellipse(170, 565, n, n);
  ellipse(260, 565, n, n);
  ellipse(230, 565, n, n);
  //noFill();


  //---------------MOVING--------------------------

  //neck
  int neck = int(map(mouseY, 0, height, 0, 15));
  int eye = int(map(mouseX, 0, width, 0, 15));

  strokeWeight(8);
  line(185, yn-20-neck, 215, yn-20-neck);
  line(185, yn, 215, yn);
  line(185, yn+20+neck, 215, yn+20+neck);

  //head
   strokeWeight(4);
  line(200, 85-neck, 200, 152-neck);
  triangle(200, 152-neck, 255, 290-neck, 145, 290-neck);


  //eye
  strokeWeight(0);
  fill(255);
  ellipse(200, 245-neck, 45, 30+(eye));
  fill(0);
  ellipse(200, 245-neck, 15+eye, 15+eye);
  noFill();


  //hands
  fill(0);
  ellipse (110, 390, 30, 30);  //left
  ellipse (290, 390, 30, 30); //right
  noFill();
  strokeWeight(7);
  line(290, 425, 290, 500);
  //rotate(PI/12);
  //translate(110,390);
  line(110, 425, 110, 500);
}


