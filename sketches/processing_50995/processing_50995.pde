
void setup () {
  size (690, 710);
  background (245); 
  smooth();

  fill(255, 255, 0);
  noStroke();
  rect(560, 540, 500, 400);

  fill(0);
  strokeWeight (5);
  rect (30, 0, 10, 720);
  rect (100, 0, 10, 720);
  rect (450, 0, 10, 720);
  rect (560, 0, 10, 720);
  rect (660, 0, 10, 720);


  rect (30, 20, 690, 10);

  noStroke();
  fill (240, 240, 0);
  rect (40, 0, 60, 20);

  fill (0);
  rect (40, 60, 60, 40);


  fill (255, 0, 0);
  rect (40, 150, 60, 40);

  strokeWeight(5);
  fill(0);
  rect (0, 240, 700, 10);
  rect (0, 350, 700, 10);
  rect (0, 460, 700, 10);
  rect (0, 540, 700, 10);

  noStroke();
  fill (0, 0, 255);
  rect (0, 250, 30, 100);

  fill (0);
  rect (30, 280, 80, 30);

  rect(180, 0, 40, 30);

  fill(255, 0, 0);
  rect(270, 0, 35, 20);

  fill(0, 0, 255);
  rect(410, 0, 40, 20);

  fill (245);
  rect (460, 0, 100, 200);

  stroke(5);
  strokeWeight(20);
  fill(255, 255, 0);
  rect (573, -10, 85, 140);

  strokeWeight(5);
  fill(0);
  rect (573, 65, 85, 10);

  noStroke();
  fill (255, 255, 0 );
  rect (670, 250, 30, 100);

  stroke(1);
  strokeWeight(5);
  fill(0);
  rect (460, 100, 100, 10);

  fill(20);
  rect (460, 170, 200, 10);


  //shapes
  //square
  strokeWeight(15);
  fill(255, 100, 255);
  rect (113, 250, 160, 210);


  //triangle
  fill(0, 255, 0);
  float theta = -PI/2;
  int sides = 3;
  float radius = 129.0;
  float xPos = 335;
  float yPos = 172;
  int counter = 0;

  beginShape();
  while (counter <sides) {
    float x = xPos + cos (theta)*radius; 
    float y = yPos + sin (theta)*radius;
    vertex(x, y); 
    counter = counter + 1;
    theta =  theta + radians (120);
  }
  endShape(CLOSE);


  //ellipse
  fill(255, 0, 0);
  ellipse (520, 350, 205, 205);

  //crisscross
  line(250, 550, 450, 710);
  line(250, 710, 450, 550);
}


