
// Michael Lautermilch, 9/5/13
// Assignment 1, create a national flag
// this is the national flag for Brasil
color green, yellow, blue, white;
class Star
{
  Star(int x, int y, int z)   // the center of the star is (x, y) and the height of the star from center to peak is z
  {
    fill(255);
    stroke(255);
    strokeWeight(0);
    strokeJoin(ROUND);
    // draw the points of a star
    triangle(x, y - z,  x + .28 * z, y - .4 * z,  x - .28 * z, y - .4 * z);
    triangle(x + .28 * z, y - .4 * z,  x + .94 * z, y - .3 * z,  x + .46 * z, y + .14 * z);
    triangle(x + .46 * z, y + .14 * z,  x + .58 * z, y + .8 * z,  x, y + .5 * z);
    triangle(x, y + .5 * z,  x - .58 * z, y + .8 * z,  x - .46 * z, y + .14 * z);
    triangle(x - .46 * z, y + .14 * z,  x - .94 * z, y - .3 * z,  x - .28 * z, y - .4 * z);
    // fill in the center
    quad(x - .28 * z, y - .4 * z,  x - .46 * z, y + .14 * z,  x, y + .5 * z,  x + .46 * z, y + .14 * z);
    triangle(x - .28 * z, y - .4 * z,  x + .46 * z, y + .14 * z,  x + .28 * z, y - .4 * z);
  }
}
void setup()
{
  size(1440, 900);
  // rgb values are all precise, taken from http://www.altiusdirectory.com/Travel/brazil-flag.php
  green = color(0, 146, 62);
  yellow = color(248, 193, 0);
  blue = color(40, 22, 111);
  white = color(255);
  background(255);
  smooth();
}
void draw()
{
  noStroke();
  fill(green);
  rect(0, 0, width, height);
  
  fill(yellow);
  quad(width / 2, height * 3 / 28, width * 37 / 40, height / 2, width / 2, height * 25 / 28, width * 3 / 40, height / 2);
  
  fill(blue);
  ellipse(width / 2, height / 2, width * 14 / 40, width * 14 / 40);
  
  stroke(white);
  strokeWeight(5);
  noFill();
  arc(width / 2, height / 2, width * 14 / 40 - 2, width * 14 / 40 - 2, radians(192.5), radians(201));
  arc(width / 2, height / 2, width * 14 / 40 - 2, width * 14 / 40 - 2, radians(7), radians(15));
  
  strokeWeight(1);
  Star one = new Star(width * 34 / 60, height * 17 / 42, 14);
  Star two = new Star(width * 29 / 80, height * 19 / 42, 13);
  Star three = new Star(width * 43 / 80, height * 20 / 42, 9);
  Star four = new Star(width * 26 / 60, height * 51 / 100, 11);
  Star five = new Star(width * 28 / 80, height * 42 / 70, 11);
  Star six = new Star(width * 31 / 85, height * 41 / 70, 12);
  Star seven = new Star(width * 32 / 85, height * 4 / 7, 7);
  Star eight = new Star(width * 38 / 98, height * 62 / 98, 9);
  Star nine = new Star(width * 197 / 500, height * 304 / 500, 11);
  Star ten = new Star(width * 205 / 500, height * 337 / 500, 14);
  Star eleven = new Star(width * 478 / 1000, height * 555 / 1000, 10);
  Star twelve = new Star(width * 499 / 1000, height * 526 / 1000, 11);
  Star thirteen = new Star(width * 491 / 1000, height * 578 / 1000, 7);
  Star fourteen = new Star(width * 515 / 1000, height * 554 / 1000, 10);
  Star fifteen = new Star(width / 2, height * 64 / 100, 13);
  Star sixteen = new Star(width * 25 / 40, height * 25 / 42, 13);
  Star seventeen = new Star(width * 26 / 40, height * 25 / 42, 10);
  Star eighteen = new Star(width * 636 / 1000, height * 621 / 1000, 11);
  Star nineteen = new Star(width * 526 / 1000, height * 656 / 1000, 9);
  Star twenty = new Star(width * 559 / 1000, height * 650 / 1000, 9);
  Star twentyone = new Star(width * 584 / 1000, height * 652 / 1000, 10);
  Star twentytwo = new Star(width * 604 / 1000, height * 653 / 1000, 10);
  Star twentythree = new Star(width * 620 / 1000, height * 634 / 1000, 12);
  Star twentyfour = new Star(width * 545 / 1000, height * 690 / 1000, 11);
  Star twentyfive = new Star(width * 584 / 1000, height * 683 / 1000, 11);
  Star twentysix = new Star(width * 583 / 1000, height * 718 / 1000, 10);
  Star twentyseven = new Star(width / 2, height * 724 / 1000, 7);

  strokeWeight(8);
  stroke(255);
  noFill();
  curve(width * 229 / 1000, height * 737 / 1000,  width * 332 / 1000, height * 437 / 1000,  width * 668 / 1000, height * 566 / 1000,  width * 768 / 1000, height * 1266 / 1000);
  int q = 30, r = 12;
  curve(width * 229 / 1000 + r, height * 737 / 1000 - q,  width * 330 / 1000 + r, height * 437 / 1000 - q,  width * 664 / 1000 + r, height * 566 / 1000 - q,  width * 768 / 1000 + r, height * 1266 / 1000 - q);
  strokeWeight(14);
  curve(width * 229 / 1000 + 6, height * 737 / 1000 - 10,  width * 330 / 1000 + 7, height * 437 / 1000 - 10,  width * 665 / 1000 + 4, height * 566 / 1000 - 10,  width * 768 / 1000 + 6, height * 1266 / 1000 - 10);
  curve(width * 229 / 1000 + 6, height * 737 / 1000 - 20,  width * 330 / 1000 + 10, height * 437 / 1000 - 20,  width * 665 / 1000 + 6, height * 566 / 1000 - 22,  width * 768 / 1000 + 6, height * 1266 / 1000 - 20);
  
  textAlign(CENTER);
  fill(green);
  textSize(34);
  rotate(radians(-6));
  text("O", width * 320 / 1000, height * 488 / 1000);
  rotate(radians(2));
  text("R", width * 353 / 1000, height * 467 / 1000);
  rotate(radians(3));
  text("D", width * 390 / 1000, height * 436 / 1000);
  rotate(radians(2));
  text("E", width * 420 / 1000, height * 413 / 1000);
  rotate(radians(3));
  text("M", width * 455 / 1000, height * 377 / 1000);
  rotate(radians(2));
  textSize(30);
  text("E", width * 493 / 1000, height * 349 / 1000);
  textSize(35);
  rotate(radians(3));
  text("P", width * 529 / 1000, height * 307 / 1000);
  rotate(radians(2));
  text("R", width * 556 / 1000, height * 277 / 1000);
  rotate(radians(1));
  text("O", width * 582 / 1000, height * 263 / 1000);
  rotate(radians(3));
  text("G", width * 614 / 1000, height * 214 / 1000);
  rotate(radians(2));
  text("R", width * 641 / 1000, height * 182 / 1000);
  rotate(radians(3));
  text("E", width * 667 / 1000, height * 129 / 1000);
  rotate(radians(3));
  text("S", width * 690 / 1000, height * 75 / 1000);
  rotate(radians(3));
  text("S", width * 710 / 1000, height * 19 / 1000);
  rotate(radians(3));
  text("O", width * 730 / 1000, height * (-35) / 1000);
}


