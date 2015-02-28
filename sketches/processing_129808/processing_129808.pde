

void setup() {
  size(600, 600);
}

void draw() {
  printMouse();

  //sky
  fill(#84A0F5);
  rect(0, 0, width, 300);
  //ground
  fill(#24990C);
  rect(0, 300, width, height);
  //frame of house
  fill(#F7EDA8);
  //front face
  rect(100, 200, 200, 200);
  //right side face
  quad(300, 200, 300, 400, 350, 350, 350, 250);
  //left add on
  rect(65, 320, 35, 70);
  //roof side
  fill(#858585);
  quad(250, 135, 300, 200, 350, 250, 313, 200);
  //roof front
  quad(95, 205, 305, 205, 250, 135, 150, 135);

  //side roof left
  triangle(100, 290, 100, 320, 60, 320);
  //front step
  fill(#A8A8A8);
  rect(120, 393, 40, 10);
  //side of front step
  quad(160, 403, 165, 400, 165, 391, 160, 393);
  //top of front step
  quad(120, 393, 160, 393, 165, 391, 124, 391);
  //door
  fill(#A1774A);
  rect(124+2, 391-75, 40-4, 75);
  //door knob
  fill(#A8A8A8);
  ellipse(156, 370, 5, 5);
  //windowLeftFirstFloor- fill will change with time
  fill(#ADD6FF);
  rect(180, 320, 35, 55);
  line(180, 320+(55/2), 180+35, 320+(55/2));
  //windowRightFirstFloor
  rect(240, 320, 35, 55);
  line(240, 320+(55/2), 240+35, 320+(55/2));
  //windowRightSecondFloor
  rect(240, 230, 35, 55);
  line(240, 230+(55/2), 240+35, 230+(55/2));
  //windowMiddleSecondFloor
  rect(180, 230, 35, 55);
  line(180, 230+(55/2), 180+35, 230+(55/2));
  //windowLeftSecondFloor
  rect(120, 230, 35, 55);
  line(120, 230+(55/2), 120+35, 230+(55/2));
  //windowAddOn
  rect(70, 330, 15, 50);
  rect(90, 330, 10, 50);
  //driveway
  fill(#525252);
  quad(200, height, 600, height, 450, 400, 350, 400);
}

void printMouse() {
  //just to help me draw
  frameRate(10);
  println (mouseX +"," + mouseY);
}



