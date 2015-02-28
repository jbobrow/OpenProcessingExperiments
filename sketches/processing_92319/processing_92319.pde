
void setup() {
  size(800, 800);
  smooth();
  strokeWeight(3);
}//캔버스 사이즈 ㅎㅎ 
void draw() {
  background(128);
  fill(100, 200, 100);
  ellipse(400, 400, 400, 400);
  line(400, 350, 400, 400);
  //line(300, 500, 500, 500);
  
  fill(50);
  stroke(50);
  ellipse(320, 360, 50, mouseX / 5);
  ellipse(480, 360, 50, mouseY / 5);
  line(300, 300, 330, 290);
  line(460, 290, 490, 300);
  fill(250, 100, 100);
  rect(300, 470, 200, 55, 7);
}
