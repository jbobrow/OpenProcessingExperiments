
//environment
void setup() {
  size(500, 500);
  background(255);
  //head and body
  fill(#0033CC);
  stroke(127);//color
  strokeWeight(10);//width of stroke in pixels
  line(50, 250, 450, 250);
  rect(150, 50, 200, 100);
  rect(150, 180, 200, 220);
  line(250, 150, 250, 180);
  //eyes
  strokeWeight(5);//width of stroke in pixels
  fill(255, 255, 0);
  ellipse(200, 100, 50, 50);
  ellipse(300, 100, 50, 50);
  //legs
  fill(255, 127, 0);
  triangle(190, 400, 150, 440, 230, 440);
  triangle(310, 400, 270, 440, 350, 440);
  //logo
  noStroke();
  beginShape();
  vertex(250, 230);
  vertex(300, 350);
  vertex(250, 300);
  vertex(200, 350);
  endShape();
}
void draw() {
  fill(0);
  text("Click somewhere to pick color",10,20);
  if (mousePressed) {
    int myColor = get(mouseX, mouseY);
    fill(myColor);
    rect(10, 30, 30, 30);
  }
}



