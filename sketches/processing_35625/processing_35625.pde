
void setup() {
  size(300, 300);
}

void draw() {
  background(0, 0, mouseX);

  //Moon
  noStroke();
  fill(255);
  ellipse(width/5, mouseX, 40, 40);
  fill(0, 0, mouseX);
  ellipse(width/5+9, mouseX, 25, 25);

  //Sun
  fill(#F7F120-mouseX);
  ellipse(width*2/3, height-mouseX, 50, 50);

  //Water
  fill(30, mouseX, 255);
  rect(0, height*5/7, width, height);

  //Yellow Truck + Green Car
  fill(#FCE82E);
  rect(300-mouseX*.9-5, 170, 20, 17);
  fill(#BCBCBC);
  rect(300-mouseX*.9-13, 174, 7, 7);
  fill(#0DA703);
  rect(300-mouseX*.5-85, 174, 13, 7);

  //White Truck
  fill(255);
  rect(mouseX, 170, 15, 15);
  fill(0);
  rect(mouseX+16, 174, 7, 7);

  //BridgePart1
  stroke(4);
  line(0, 180, 84, 123);

  //BridgePart2
  stroke(4);
  line(300, 180, 216, 123);

  //BridgePart3
  stroke(4);
  line(84, 123, 216, 123);

  //BridgePart4
  noStroke();
  fill(#FF0808);
  rect(0, 180, 300, 8);

  //BridgePart5
  fill(#FF0808);
  rect(80, 120, 8, 130);

  //BridgePart6
  fill(#FF0808);
  rect(212, 120, 8, 130);

  //Sailboat
  fill(250, 2-mouseX, 100, 100);
  rect(mouseX*.5, 280, 20, 7);
  fill(255);
  triangle(mouseX*.5-2, 280, mouseX*.5+12, 230, mouseX*.5+20, 280);
}


