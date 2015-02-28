
// sets window size and background colour
void setup() {
  size(600, 600);
  background (255);
}


void draw() {
  //creates a pattern of lines causing a green colour gradient effect down the screen
  int y1=0;
  int c2=0; 
  //colorMode(RGB,600);
  for (int i=0;i<600;i++) {
    stroke(0, c2, 0);
    line(0, y1, 600, y1);
    y1=y1+1;
    c2=c2+1;
  }


  //creates three equilateral triangles and colours them appropriately
  strokeWeight(10);
  stroke(198, 198, 0);
  fill(244, 255, 5);
  triangle(100, 500, 200, 300, 300, 500);
  triangle(200, 300, 300, 100, 400, 300);
  triangle(300, 500, 400, 300, 500, 500);

  //creates grey rectangle bisecting the three triangles
  rectMode(CORNERS);
  strokeWeight(3);
  stroke(117, 117, 108);
  fill(192, 192, 190);
  rect(280, 110, 320, 550);
  //creates triangle at the bottom of the grey rectangle
  noStroke();
  triangle(278, 549, 300, 580, 322, 549);


  // creates two blue rectangles forming a hilt for the grey rectangle
  strokeWeight(3);
  stroke(2, 53, 191);
  fill(30, 89, 247);
  rect(282, 110, 318, 0);
  rect(230, 80, 370, 110);
  fill(2, 53, 191);
  line(282, 15, 318, 15);
  line(282, 10, 318, 10);
}
