
void setup() {
  size(640, 640);
  noStroke();
}

void draw() {
  background(#8FDDFF);
  noStroke();
  fill(#8F4CC6);
  for (int i = 0; i < 640; i++) {
  for (int j = 0; j < 640; j++) {
    ellipse(80*i, 80*j, 10, 10);
  }
}

  /* mini triangles */
  fill(#009933);
  strokeWeight(1);
  stroke(35, 31, 32);
  triangle(394, 107, 394, 131, 369, 116);

  fill(#009933);
  strokeWeight(1);
  stroke(35, 31, 32);
  triangle(476, 188, 426, 172, 440, 220);

  fill(#009933);
  strokeWeight(1);
  stroke(35, 31, 32);
  triangle(478, 299, 432, 234, 418, 315);

  fill(#009933);
  strokeWeight(1);
  stroke(35, 31, 32);
  triangle(394, 378, 390, 315, 200, 315);

  fill(#009933);
  strokeWeight(1);
  stroke(35, 31, 32);
  triangle(265, 370, 315, 346, 261, 337);

  fill(#009933);
  strokeWeight(1);
  stroke(35, 31, 32);
  triangle(177, 290, 196, 269, 210, 302);

  fill(#009933);
  strokeWeight(1);
  stroke(35, 31, 32);
  triangle(196, 178, 221, 173, 211, 210);

  fill(#009933);
  strokeWeight(1);
  stroke(35, 31, 32);
  triangle(277, 102, 306, 121, 269, 129);
  /* end mini triangles */

  /* rectangle */
  fill(#009933);
  strokeWeight(1);
  stroke(35, 31, 32);
  rect(305, 264, 52, 375);
  /* end rectangle */

  /* petals */
  fill(#FFCCF1);
  strokeWeight(1);
  stroke(35, 31, 32);
  ellipse(335, 140, 107, 107);


  fill(#FFCCF1);
  strokeWeight(1);
  stroke(35, 31, 32);
  ellipse(410, 172, 107, 107);

  fill(#FFCCF1);
  strokeWeight(1);
  stroke(35, 31, 32);
  ellipse(437, 242, 107, 107);

  fill(#FFCCF1);
  strokeWeight(1);
  stroke(35, 31, 32);
  ellipse(410, 310, 107, 107);

  fill(#FFCCF1);
  strokeWeight(1);
  stroke(35, 31, 32);
  ellipse(332, 350, 107, 107);

  fill(#FFCCF1);
  strokeWeight(1);
  stroke(35, 31, 32);
  ellipse(246, 305, 107, 107);

  fill(#FFCCF1);
  strokeWeight(1);
  stroke(35, 31, 32);
  ellipse(227, 241, 107, 107);

  fill(#FFCCF1);
  strokeWeight(1);
  ellipse(263, 168, 107, 107);
  /* end petals */

  /* yellow center */
  fill(#FFFB66);
  strokeWeight(1);
  stroke(35, 31, 32);
  ellipse(332, 250, 165, 165);
  /* end yellow center */

  /* sides */
  fill(#009933);
  strokeWeight(1);
  stroke(35, 31, 32);
  triangle(358, 425, 358, 510, 420, 400);

  fill(#009933);
  strokeWeight(1);
  stroke(35, 31, 32);
  triangle(304, 510, 304, 590, 237, 480);
  /* end sides */

  /*sun */
  fill(#FFFB66);
  strokeWeight(1);
  stroke(35, 31, 32);
  arc(0, 0, 200, 220, 0, HALF_PI);
  /* end sun */

  /* grass */
  fill(#009933);
  strokeWeight(1);
  stroke(35, 31, 32);
  triangle(0, 640, 40, 640, 20, 600);
  triangle(40, 640, 80, 640, 60, 600);
  triangle(80, 640, 120, 640, 100, 600);
  triangle(120, 640, 160, 640, 140, 600);
  triangle(160, 640, 200, 640, 180, 600);
  triangle(200, 640, 240, 640, 220, 600);
  triangle(240, 640, 280, 640, 260, 600);
  triangle(280, 640, 320, 640, 300, 600);
  triangle(320, 640, 360, 640, 340, 600);
  triangle(360, 640, 400, 640, 380, 600);
  triangle(400, 640, 440, 640, 420, 600);
  triangle(440, 640, 480, 640, 460, 600);
  triangle(480, 640, 520, 640, 500, 600);
  triangle(520, 640, 560, 640, 540, 600);
  triangle(560, 640, 600, 640, 580, 600);
  triangle(600, 640, 640, 640, 620, 600);
  /* end grass */

}




