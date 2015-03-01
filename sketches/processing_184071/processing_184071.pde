
void setup() {
  size(800, 600);
  smooth();
  background(240, 75, 127);
  //head
  beginShape();
  vertex(390, 77);
  vertex(462, 123);
  vertex(395, 289);
  vertex(274, 241);
  vertex(300, 86);
  endShape(CLOSE);

  //anntenae
  line(389, 77, 404, 55);
  line(404, 55, 390, 30);
  line(390, 30, 441, 57);
  line(441, 57, 434, 29);
  line(434, 29, 440, 26);
  strokeWeight(3);

  //head
  fill(255);
  ellipse(403, 156, 50, 50); // big eye 
  fill(240, 10, 10);
  ellipse(403, 154, 3, 3);
  fill(255);
  ellipse(328, 136, 10, 10); // Small eye
  strokeWeight(6);
  strokeCap(ROUND);

  //mouth
  line(314, 202, 307, 231);
  line(342, 206, 331, 239);
  line(374, 221, 360, 252);
  line(356, 221, 350, 236);
 
  //neck
  strokeWeight(2);
  line(339, 268, 310, 392);
  line(314, 258, 316, 290);

  //body
  strokeWeight(1);
  //fill(255,255,255, 200);
  ellipse(315, 364, 150, 150);
  //ellipse(282, 389, 200, 200);
  ellipse(315, 431, 150, 150);
  ellipse(315, 485, 150, 150);
}
void draw() {
  noStroke();
  fill(random(255), random(255), random(255), random(255));
  ellipse(447, 22, 15, 15);
}

