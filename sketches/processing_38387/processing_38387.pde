
//Project 1_Drawing Machine
//Created by Adrianne Blossom
//September 20, 2011

//This drawing machine creates a composition in the spirit of Sol LeWitt.

void setup() {
  size(500, 500);
  smooth();
  background(240,240,240);
}


float boundary=50;

void draw() {
}

void mousePressed(){
  background(240, 240, 240);

  noStroke(); //Base squre in which everything is drawn  upon.
  fill(188, 168, 123); 
  rect(boundary, boundary, 400, 400);

  fill(123, 155, 188); //The following rects fill in certain spaces bounded by the drawn lines.
  rect(width/2, boundary, 100, 300);
  rect(width-boundary, height-100, boundary, boundary);
  rect(boundary, width-boundary, 200, boundary);


  for (int vBrown=250; vBrown <= width; vBrown+=100) { //Brown vertical line loop
    strokeWeight(3);
    stroke(67, 36, 16);
    line(vBrown, 0, vBrown, height);
  }

  for (int hBrown=350; hBrown<=height; hBrown+=50) { //Brown horizontal line loop
    line(0, hBrown, width, hBrown);
  } 

  for (int vCreme=50; vCreme < width/2; vCreme+=25) { //Light brown vertical line loop
    strokeWeight(2);
    stroke(106, 69, 44);
    line(vCreme, 400, vCreme, 450);
    line(vCreme+200, 350, vCreme+200, 400);
    line(vCreme+400, 450, vCreme+400, 500);
  }
  ellipse(62.5,random(75,330),25,25); //The circles add randomness and contrast to the regularity of the compositions lines and rectangles.
  ellipse(87.5,random(75,330),25,25);
  ellipse(125,random(75,300),50,50);
  ellipse(200,random(100,300),100,100);
}


