
/*
 Konkuk University
 SOS iDesign
 
 Name: Shim Sang Joon
 ID: 201420086
 
 
 */
float mx;
float my;
float c;

void setup() {
  smooth();
  colorMode(RGB, 255);
  size(600, 600);
}

void draw() {

  rectMode(LEFT);
  noStroke();
  fill(255, 0, 255, 30);
  float rX = random(width);
  float rY = random(height);
  float a = random(500);

  c = random(255);

  fill(c, 0, c, 50);
  stroke(0);
  background(255, 255, 0);

  //eyes
  fill(#00FC01);
  ellipse(294, 207, 354, 354);
  fill(255);
  ellipse(290, 124, 163, 163);

  float mx = constrain (mouseX, 267, 313);
  float my = constrain (mouseY, 112, 143);


  fill(#4DFFD1);
  ellipse(mx, my, 74, 74);
  fill(0);
  ellipse(mx, my, 34, 34);
  fill(255);
  ellipse(mx+20, my-20, 15, 15);

  //tooth

  noFill();
  fill(#19671D);
  bezier(227, 283, 227, 232, 355, 227, 355, 283);

  fill(#1AD624);
  bezier(227, 283, 228, 321, 355, 321, 355, 283);



  fill(255);
  bezier(232, 295, 240, 283, 259, 290, 253, 307);
  bezier(254, 307, 260, 291, 294, 291, 295, 313);
  bezier(293, 313, 296, 284, 328, 285, 331, 305);
  bezier(337, 304, 330, 286, 350, 283, 353, 292);







  //legs and arms
  fill(#00FC01);
  quad(191, 351, 192, 428, 213, 418, 225, 371);
  quad(192, 428, 206, 512, 231, 509, 213, 418);
  quad(206, 512, 129, 565, 249, 548, 232, 510);
  quad(364, 371, 370, 421, 395, 422, 397, 351);
  quad(370, 421, 357, 517, 386, 511, 395, 422);
  quad(357, 517, 351, 552, 480, 558, 386, 511);

  quad(117, 186, 95, 330, 117, 326, 131, 277);
  quad(95, 330, 107, 422, 128, 419, 117, 326);
  quad(107, 423, 101, 479, 172, 517, 128, 419);
  quad(129, 419, 147, 458, 177, 471, 140, 419);

  quad(471, 189, 498, 320, 476, 327, 462, 262);
  quad(476, 328, 476, 425, 499, 426, 499, 320);
  quad(476, 427, 477, 525, 518, 478, 499, 426);
  quad(476, 427, 463, 473, 469, 500, 478, 481);



  //horn and claws

  fill(#7B8951);

  triangle(193, 33, 194, 70, 218, 55);
  triangle(386, 30, 363, 53, 388, 67);
  triangle(152, 549, 129, 565, 150, 562);
  triangle(454, 544, 453, 557, 479, 558);
  triangle(166, 457, 165, 466, 176, 471);
  triangle(164, 500, 155, 508, 171, 517);
  triangle(466, 483, 468, 498, 476, 486);
  triangle(477, 511, 476, 525, 487, 514);



  if (mousePressed) {
    rectMode(CENTER);
    fill(233, 72, 255);
    rect (mouseX, mouseY, 120, 200);
    rect (mouseX, mouseY, 80, 160);
    fill(72, 255, 253);
    rect (mouseX, mouseY-30, 40, 80);
    fill(0);
    ellipse(mouseX+30, mouseY, 10, 10);
  }
}

