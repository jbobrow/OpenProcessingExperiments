
int counter;

void setup() {  //setup function called initially, only once
  size(250, 250);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
  counter++;
  noStroke();
  fill(random(255), 100, 255, 50);

  if (mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, 20, 20);
  }
  else {
    ellipse(width/2, height/2, 80*sin(counter), 80*sin(counter));
  }
}


PImage img;

void setup() {
  background (240, 228, 167);
  size (600, 600);
  smooth();
  colorMode (RGB, 600);
  img = loadImage ("201420107 Hyeri Jeong"); // put the image in the same folder as the processing file
}

void draw() {
  noStroke();
  fill (mouseX, mouseY, 80, 200);
  noStroke();
  ellipse(200, 200, 150, 150);
  fill (mouseY, mouseX);
  triangle(310, 220, 450, 0, 480, 300);
  fill(mouseX, mouseY, 255);
  rect(500, 500, 100, 100);
  stroke(0);
  strokeWeight(3);
  noFill();
  ellipse(440, 380, 300, 300);
  stroke(0);
  strokeWeight(2);
  line (100, 500, 450, 500);
  strokeWeight(8);
  point (480, 8);
  stroke(300);
  strokeWeight(10);
  line(200, 0, 400, 300);
  stroke(600);
  strokeWeight(8);
  line (150, 0, 300, 600);
  stroke (255);
  strokeWeight (2); 
  line (0, 200, 400, 200);
  stroke(0);
  strokeWeight(3);
  quad(520, 500, 580, 500, 590, 590, 480, 480);
  noFill();
  strokeWeight(3);
  bezier(0, 400, 50, 370, 80, 500, 80, 580);
  line(490, 0, 700, 300);
}

