
int n=18; //wheels
int yn=332; //neck lines Y



void setup() {
  size(400, 600);

  //background(255);
  smooth();
}


void draw() {
  
int x0 = width/2;

  background(255);

  //--------------STATIC--------------------------

  //body
  fill(0);
  rect(x0-65, 375, 130, 160);
  strokeWeight(7);
  stroke(255);
  line(x0+57, 370, x0-70, 535);
  line(x0+70, 370, x0-58, 539);
  noFill();
  stroke(0);

  //wheels
  fill(0);
  ellipse(x0-60, 565, n, n);
  ellipse(x0-30, 565, n, n);
  ellipse(x0+60, 565, n, n);
  ellipse(x0+30, 565, n, n);
  //noFill();


  //---------------MOVING--------------------------

  //neck
  int neck = int(map(mouseY, 0, height, 0, 15));
  int eye = int(map(mouseX, 0, width, 0, 15));

  strokeWeight(8);
  line(x0-15, yn-20-neck, x0+15, yn-20-neck);
  line(x0-15, yn,  x0+15, yn);
  line(x0-15, yn+20+neck, x0+15, yn+20+neck);

  //head
   strokeWeight(4);
  line(x0, 85-neck, x0, 152-neck);
  triangle(x0, 152-neck, x0+55, 290-neck, x0-55, 290-neck);


  //eye
  strokeWeight(0);
  fill(255);
  ellipse(x0, 245-neck, 45, 30+(eye));
  fill(0);
  ellipse(x0, 245-neck, 15+eye, 15+eye);
  noFill();


  //hands
  fill(0);
  ellipse (x0-90, 390, 30, 30);  //left
  ellipse (x0+90, 390, 30, 30); //right
  noFill();
  strokeWeight(7);
  line(x0+90, 425, x0+90, 500);
  //rotate(PI/12);
  //translate(110,390);
  line(x0-90, 425, x0-90, 500);
}
