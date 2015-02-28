
void setup() {
  //canvas size
  size(400, 400);
}

void draw() {

  background(171, 242, 0);
  noStroke();
  //cat's ear
  fill(176, 176, 176);
  triangle(60, 25, 60, 175, 250, 100);
  triangle(340, 25, 340, 175, 150, 100);
  fill(255, 193, 158);
  triangle(75, 45, 75, 155, 230, 100);
  triangle(325, 45, 325, 155, 170, 100);
  //cat's face
  fill(176, 176, 176);
  ellipse(200, 200, 295, 295);
  //cat's eyes
  fill(178,235,244);
  ellipse(150, 150, 10, 10);
  fill(167,72,255);
  ellipse(250, 150, 10, 10);
  //cat's nose
  fill(103,0,0);
  quad(190, 180, 195, 190, 205, 190, 210, 180);
  //cat's philtrum
  stroke(93,93,93);
  line(200, 190, 200, 260);
  //cat's freckles
  point(120, 200);
  point(130, 190);
  point(140, 200);
  point(280, 200);
  point(270, 190);
  point(260, 200);
  //cat's mustache
  line(150, 225, 30, mouseX);
  line(145, 240, 20, 260);
  line(250, 225, 370, mouseX);
  line(255, 240, 380, 260);
  //cat's libon
  noStroke();
  fill(255,0,0);
  quad(100,370,100,330,300,370,300,330);
    //cat's mouth
  fill(187,41,41);
  rect(190, 260, 20, mouseY, 0, 0, 40, 40);
}
