
void setup() {
  size(900, 620);
  smooth();
  float balls = 100;
  float gap = calculateGap(balls);
  println(gap);
}
  float calculateGap(float z) {
  float newCount = z * 1;
  return newCount;

}

void draw() {
  background(0);
  randomSeed(0);
  for (int x = -150; x < width + 70; x += 170) {
    int gray = int(random(0, 102));
    float scalar = random(0.25, 1.0);
    robot(x, 110);
    
  line(x, 20, width, 20);
  line(x, 220, width, 220);
  
  line(x, 600, width, 600);

  }
}

void robot(int x, int y, int g, float s) {
  pushMatrix();
  translate(x, y);
  scale(s);  // Set the size
  stroke(g); // Set the gray value
  strokeWeight(2);
  
    //Ears
  fill(106, 168, 82); // Set stroke to green
  beginShape();
  triangle(242, 188, 232, 215, 242, 215); //left ear
  triangle(332, 188, 323, 215, 332, 215); // right ear
  endShape();
 
  // Outer Eyes
  fill (224, 223, 133);
  beginShape();
  rect(215, 215, 72, 72);
  rect(287, 215, 72, 72);
  endShape();
 
  // Middle Eyes
  fill (245, 73, 87);
  beginShape();
  rect(226, 226, 54, 54);
  rect(297, 226, 54, 54);
  endShape();
 
  // Inner Eyes
  fill (106, 168, 82);
  beginShape();
  rect(242, 242, 18, 18);
  rect(315, 242, 18, 18);
  endShape();
 
  // Outter Mouth
  fill (106, 168, 82);
  beginShape();
  rect(234, 288, 108, 90);
  endShape();
 
  //Inner Mouth
  fill (255-g);
  beginShape();
  rect(242, 296, 90, 72);
  endShape();
 
  // Teeth
  fill (245, 73, 87);
  beginShape();
  triangle(261, 342, 252, 369, 270, 369);
  triangle(288, 342, 279, 369, 297, 369);
  triangle(315, 342, 306, 369, 324, 369);
  endShape();
 
  // Body
  fill (224, 223, 133);
  beginShape();
  rect(242, 378, 90, 99);
  fill (0);
  rect(252, 378, 72, 90);
  endShape();
 
  // Body Symbols
  fill (106, 168, 82);
  beginShape();
  triangle(287, 388, 279, 396,296, 396);
  endShape();
  fill (224, 223, 133);
  beginShape();
  rect(278, 404, 18, 36);
  endShape();
  fill (245, 73, 87);
  beginShape();
  triangle(287, 449, 278, 457, 296, 457);
  endShape();
 
  // Left Hand
  stroke(245, 223, 133);
  strokeWeight(5);
  line(239, 404, 188, 404);
  line(239, 440, 188, 440);
  line(189, 405, 162, 423);
  line(162, 423, 188, 440);
  stroke(245, 73, 87);
  strokeWeight(1);
  line(200, 413, 243, 413);
  line(200, 432, 243, 432);
  line(189, 413, 180,423);
  line(180, 423, 188,432);
 
  // Right Hand
  stroke(245, 223, 133);
  strokeWeight(5);
  line(332, 404, 387, 404);
  line(332, 440, 387, 440);  
  line(387, 404, 407, 423);
  line(407, 423, 387, 440);
  stroke(245, 73, 87);
  strokeWeight(1);
  line(332, 413, 371, 413);
  line(332, 432, 371, 432);
  line(378, 413, 387, 422);
  line(387, 422, 378, 432);

  popMatrix();
}


