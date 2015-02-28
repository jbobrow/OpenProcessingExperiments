
float x;

void setup()
{
  size(600, 600);
  background(255);
  smooth();
  noStroke();
}


void draw()
{


  x= map(mouseX, 0, width, 20, 200);
  background(255);

if (mousePressed ==true)
{
  background(59,255,90);
}
else
{
  background(255);
}
  //base
  fill(1);
  ellipse(width/2, height/2, 400, 500);

  //right eyebrow
  fill(255);
  ellipse(170, 230+x/-2, 15, 15);
  ellipse(200, 230+x/-2, 15, 15);
  ellipse(230, 230+x/-2, 15, 15);

  //right eye
  ellipse(200, 260, 20, 20);
  strokeWeight(2);
  stroke(1);
  line(180, 260, 230, 260);

  if ((mouseX<=width/2) && (mouseY>=height/2))
  {
    line(200, 230, 200, 280);
  }

  //left eyebrow
  noStroke();
  fill(255);
  ellipse(430, 230+x/-2, 15, 15);
  ellipse(400, 230+x/-2, 15, 15);
  ellipse(370, 230+x/-2, 15, 15);

  //left eye
  noStroke();
  ellipse(400, 260, 20, 20);
  strokeWeight(2);
  stroke(1);
  line(370, 260, 430, 260);

  if ((mouseX<=width/2) && (mouseY>=height/2))
  {
    line(400, 240, 400, 280);
  }


  //nose
  quad(290, 280, 310, 280, 310, 350, 290, 350);
  beginShape(LINES);
  stroke(255);
  strokeWeight(3);
  vertex(270, 280);
  vertex(270, 350);
  vertex(330, 280);
  vertex(330, 350);
  endShape();

  //top ellipses
  ellipse(270, 300, 10, 10);
  ellipse(330, 300, 10, 10);
  //bottom ellipses
  ellipse(270, 350+x/8, 10, 10);
  ellipse(330, 350+x/8, 10, 10);

  //cheeks
  noStroke();
  quad(170, 300, 230, 300, 230, 320, 170, 320);
  if ((mouseX<=width/2) && (mouseY>=x))
  {
    fill(255, 67, 92);
    quad(170, 300, 230, 300, 230, 320, 170, 320);
  }
  quad(430, 300, 370, 300, 370, 320, 430, 320);
  
  if ((mouseX<=width/2) && (mouseY>=x))
  {
    fill(255);
    quad(200, 400, 400, 400, 400, 405, 200, 405);
}

  //mouth
  noStroke();
  quad(200, 400, 400, 400, 400, 400+x/1.5, 200, 400+x/1.5);
  //  line(200, 400, 400, 400);
  
}



