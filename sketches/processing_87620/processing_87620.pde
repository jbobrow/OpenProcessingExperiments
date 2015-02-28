
void setup() {
  size(500, 500);
  background(195, 193, 113);
  smooth();
}

void draw() {
  //hair
  noStroke();
  fill(0);
  ellipse(256.33, 149.89, 372, 273.176);
  rect(70.334, 149.893, 372, 334.107);

  //mask
  noStroke();
  fill(255);
  rect(104.759, 98.269, 300, 149.604);
  beginShape();
  vertex(104.47, 247);
  vertex(405.1, 247);
  vertex(269.36, 489.94);
  vertex(255.77, 491.42);
  vertex(242.55, 489.94);
  endShape();

  // cheeks
  noStroke();
  fill(204, 104, 135);
  float cheek_width= map(mouseX, 0, width, 70, 54);
  float cheek_height= map (mouseX, 0, width, 32, 15);
  ellipse (360, 231, cheek_width, cheek_height);
  ellipse(150, 231, cheek_width, cheek_height);

  //nostril
  noStroke();
  fill(179, 114, 176);
  float nostril_width= map(mouseX, 0, width, 25, 25);
  float nostril_height= map(mouseX, 0, width, 4, 20);
  ellipse(240, 271, nostril_width, nostril_height);
  ellipse(270, 271, nostril_width, nostril_height);

  //mustache_2
  noStroke();
  fill(0);
  float s1_x=map(mouseX, 0, width, 177, 116);
  float s1_y=map(mouseX, 0, width, 286, 140);
  float s2_x=map(mouseX, 0, width, 173, 115);
  float s2_y=map(mouseX, 0, width, 290, 144);
  float s3_x=map(mouseX, 0, width, 231, 223);
  float s3_y=map(mouseX, 0, width, 325, 310);
  float s4_x=map(mouseX, 0, width, 250, 254);
  float s4_y=map(mouseX, 0, width, 296, 293);
  float s5_x=map(mouseX, 0, width, 243, 250);
  float s5_y=map(mouseX, 0, width, 292, 287);
  float s6_x=map(mouseX, 0, width, 227, 227);
  float s6_y=map(mouseX, 0, width, 315, 300);
  noStroke();
  fill(0);
  beginShape();
  vertex(s5_x, s5_y);
  vertex(s4_x, s4_y);
  vertex(s3_x, s3_y);
  vertex(s2_x, s2_y);
  vertex(s1_x, s1_y);
  vertex(s6_x, s6_y);
  endShape();

  //mustache_1
  noStroke();
  fill(0);
  float v1_x=map(mouseX, 0, width, 333, 395);
  float v1_y=map(mouseX, 0, width, 267, 140);
  float v2_x=map(mouseX, 0, width, 336, 396);
  float v2_y=map(mouseX, 0, width, 271, 144);
  float v3_x=map(mouseX, 0, width, 286, 299);
  float v3_y=map(mouseX, 0, width, 322, 310);
  float v4_x=map(mouseX, 0, width, 288, 296);
  float v4_y=map(mouseX, 0, width, 310, 300);
  float v5_x=map(mouseX, 0, width, 265, 269);
  float v5_y=map(mouseX, 0, width, 292, 289);
  float v6_x=map(mouseX, 0, width, 260, 266);
  float v6_y=map(mouseX, 0, width, 297, 297);

  noStroke();
  fill(0);
  beginShape();
  vertex(v6_x, v6_y);
  vertex(v5_x, v5_y);
  vertex(v4_x, v4_y);
  vertex(v1_x, v1_y);
  vertex(v2_x, v2_y);
  vertex(v3_x, v3_y);
  endShape();
  
  //eyes
  noStroke();
  fill(0);
  float eyex=map(mouseX, 0, width, 70, 10);
  float eyey=map(mouseX, 0, width, 13, 40);
  ellipse(320, 199, eyex, eyey);
  ellipse(190, 199, eyex, eyey);
  
  //mouth
  float mouthx= map(mouseX, 0, width, 22, 22);
  float mouthy= map(mouseX, 0, width, 5, 70);
  fill(0);
  noStroke();
  rect(247, 330, mouthx, mouthy);
  
  //goatee
  float gx= map(mouseX, 0, width, 244, 244);
  float gy= map(mouseX, 0, width, 353, 411);
  float g1x=map(mouseX, 0, width, 276, 276);
  float g1y=map(mouseX, 0, width, 353, 411);
  
  fill(0);
  noStroke();
  beginShape();
  vertex(gx, gy);
  vertex(g1x, g1y);
  vertex(258, 461);
  endShape();
  
  //eyebrows
  float e2x= map(mouseX, 0, width, 97, 50);
  float e2y= map(mouseX, 0, width, 125, 170);
  float e1x= map(mouseX, 0, width, 97, 50);
  float e1y= map(mouseX, 0, width, 125, 170);
  
  noFill();
  stroke(0);
  strokeWeight(10);
  strokeCap(ROUND);
  arc(325, 170, e2x, e2y, PI+.08, TWO_PI);
  arc(190, 170, e1x, e1y, PI+.08, TWO_PI);
  

}


/*

b4

 
 */


