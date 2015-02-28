
/*
Konkuk University
 SOS iDesign
 Name: KIM Sun hyun 
 ID: 201420067
 */

PImage img;

void setup() {
  size (600, 600);
  smooth();
  colorMode (RGB, 600);
  img = loadImage ("ooo.jpg");
}

void draw() {
  println(mouseX + " : " + mouseY);

  background(#F2E5BA);

  strokeWeight(10);
  line(333, 0, 427, 167);

  strokeWeight(7);
  line(371, 0, 402, 53);
  line(432, 0, 449, 30);

  line(36, 456, 40, 503);
  line(25, 428, 36, 456);
  line(15, 414, 25, 428);
  line(0, 405, 15, 414);

  fill(#FCFC00);
  quad(70, 0, 124, 60, 139, 34, 114, 0);

  fill(#FFFFFF);
  bezier(-105, 150, 0, 40, 110, 0, 150, 149);

  fill(255, 0, 0);
  rect(442, 470, 75, 82);
  strokeWeight(2);

  fill(80, 122, 20);
  ellipse(347, 410, 210, 221);

  fill(#FCFC00);
  quad(340, 151, 198, 320, 376, 366, 376, 363);

  fill(144, 186, 192);
  ellipse(100, 293, 130, 131);

  strokeWeight (5);
  line(282, 3, 600, 543);
  line(327, 3, 426, 166);
  line(342, 1, 426, 166);

  line(363, 0, 408, 64);
  line(367, 0, 408, 64);
  line(427, 1, 455, 42);
  line(436, 3, 455, 42);

  strokeWeight (10);
  line(0, 9, 341, 393);

  strokeWeight (5);
  line(16, 0, 173, 556);

  strokeWeight (4);
  line(0, 147, 338, 152);

  strokeWeight (3);
  line(0, 296, 293, 295);


  line(49, 480, 313, 474);

  strokeWeight (3);
  line(479, 499, 537, 498);

  strokeWeight (5);
  line(479, 511, 541, 509);
}

