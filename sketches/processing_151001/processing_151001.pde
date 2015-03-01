
/*
 Konkuk University
 SOS iDesign
 
 Name: kim sunmin
 ID: 201420066
 
 */

void setup() {
  //setupAudio();
  size (600, 600);
  background(255, 232, 149);
  // noLoop();
  smooth();
}
int value = 0;

void draw() {
  //getVolume();
 // float X = map(volume, 0, 100, 20, 200);
 / /float Y = map(volume, 0, 100, 20, 200);
  stroke(0);
  fill(141, 181, 159);
  bezier(211, 86, 326, 85, 428, 119, 529, 215);
  stroke(0);
  strokeWeight(5);
  fill(141, 181, 159);
  quad(211, 86, 35, 381, 501, 513, 529, 215);
  fill(X, 100, Y, 100);
  quad(369, 94, 381, 32, 435, 57, 396, 104);


  stroke(0);
  line(204, 103, 527, 229);
  fill(255);
  ellipse(312, 219, 98, 180);
  ellipse(221, 219, 98, 180);

  fill(255);
  float my = map(mouseY, 0, height, 180, 260);
  ellipse(316, my, 22, 42);
  ellipse(244, my, 22, 42);


  stroke(0);
  fill(141, 181, 159);
  quad(221, 323, 207, 137, 154, 109, 156, 201);
  quad(157, 188, 115, 288, 107, 317, 114, 363);
  quad(114, 363, 129, 377, 153, 387, 194, 376);

  noStroke();
  quad(159, 181, 157, 251, 213, 289, 210, 205);
  quad(160, 204, 114, 320, 113, 359, 132, 374);
  quad(159, 201, 115, 292, 220, 341, 217, 287);
  quad(130, 350, 131, 375, 157, 384, 205, 368);

  stroke(0);
  fill(55, 27, 27);
  line(228, 360, 416, 311);
  bezier(228, 360, 273, 441, 388, 406, 416, 311);






  if (mousePressed);
  {
  }
}

