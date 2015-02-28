
//Joel Simon


PImage img;
void setup() {

  size(600, 491); //600x 491 pixels
  img = loadImage("Frame.jpg");
  background(100); //greyscale
  smooth();
}

void draw() {
  image(img, 0, 0);
  fill(200);

  arc(300, 399, 120, 275, PI, TWO_PI);
  ellipse(300, 250, 150, 170);
  noFill();

  //Nose
  beginShape();
  curveVertex(300, 220); // the first control point
  curveVertex(300, 220); // is also the start point of curve
  curveVertex(302, 240);
  curveVertex(310, 265);
  curveVertex(300, 270);
  curveVertex(330, 270);
  endShape();
  //end nose


    fill(255,0,0);
   if(mousePressed){
  ellipse(300,290, 50, 30);
   } 

  fill(52, 34, 31);//mustache color
  arc(300, 296, 65, 40, PI, TWO_PI);

  if (second()%6 ==0) {
    fill(0);
    arc(269, 230, 30, 20, 0, PI);
    arc(334, 230, 30, 20, 0, PI);
  }
  else {
    noFill();
    arc(269, 230, 30, 20, 0, PI);
    arc(334, 230, 30, 20, 0, PI);

    //Eyes
    strokeWeight(6);
    int x = int(map(mouseX, 0, 600, -5, 5));
    int y = int(map(mouseY, 0, 491, -5, 5));

    point(270+x, 230+y);
    point(337+x, 230+y);
    strokeWeight(3);
  }
  fill(0);

  rectMode(CORNERS);
  quad(295, 165, 360, 196, 393, 138, 333, 108);// HAT

  strokeWeight(10);
  line(255, 145, 392, 210); //Hat line


  strokeWeight(3);
}

