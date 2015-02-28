
void setup() {
  size (500, 500);
  fill (255);
  smooth();
}

//flashing colors
void draw() {
  for (int i =1; i<100; i++) {
    float colr = random (0, 255);
    float colg = random (0, 255);
    float colb = random (0, 255);
    float mouse = map(mouseX, 0, width, 0, 255);

    noStroke();
    smooth();
    fill (colr, colg, colb, mouse);
    rect (mouse - 500, mouseY-500, 1000, 1000);
  }

  //squares 
  for (int i=1; i<40; i++) {
    float rx = random (10, 150);
    float ry = random (20, 170);
    float rr = random (0, 255);
    float rg = random (0, 255);
    float rb = random (0, 255);


    fill (rr, rb, rg, mouseX);
    rect (50, 50, 400, 400);

    fill (rg, rr, rb, mouseX);
    rect (100, 100, 300, 300);

    fill (rr, rg, rb, mouseX);
    rect (150, 150, 200, 200);

    fill (rb, rr, rg, mouseX);
    rect (200, 200, 100, 100);
  }

  //flashing grayscale
  for (int i =1; i<4; i++) {
    float rGray = random (0, 255);
    float mouse = map(mouseX, 0, width, 0, 255);

    noStroke();
    smooth();
    fill (rGray, 255-mouse);
    rect (mouse - 500, mouseY-500, 1000, 1000);
  }  

  //black
  float mouse = map(mouseX, 0, width, 0, 255);  
  noStroke();
  fill (0, 255-mouse);  
  rect (0, 0, 500, 500);
}

                                
