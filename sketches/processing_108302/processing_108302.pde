
void setup() 
{
  size (400, 400);
  background (255);
  smooth();
}

void draw() 
{

  fill (250, 250, 0);      //sun
  ellipse (400, 0, 180, 180);

  fill(255, 204, 150);              //head
  ellipse(200, 100, 100, 100);

  fill(255);             //eyes
  ellipse(175, 90, 30, 40);
  ellipse(225, 90, 30, 40);

  fill(0);
  ellipse (175, 90, 10, 10);
  ellipse (225, 90, 10, 10);

  strokeWeight(3);       //mouth
  line(180, 125, 220, 125);
  fill(250, 0, 0);
  rectMode(CORNER);
  rect(200, 125, 10, 15);

  line(200, 150, 200, 300); //body

  line(200, 180, 170, 190); //left arm
  line(170, 190, 120, 150);

  line(200, 180, 230, 190); //right arm
  line(230, 190, 280, 150);

  line(160, 300, 240, 300); //legs
  line(240, 300, 260, 320); //right
  line(160, 300, 140, 320); //left

  rectMode(CORNER); //grass
  fill(0, 250, 0);
  rect(0, 320, 400, 80);
}

void mousePressed()   //rain
{
  stroke(0); 
  fill(0, 0, 255); 
  ellipseMode(CENTER); 
  ellipse(mouseX, mouseY, 10, 12);
}

void keyPressed()  //clouds
{
  stroke(0);
  fill(125);
  ellipse(80, 30, 100, 50);
  ellipse(150, 30, 100, 50);
  ellipse(260, 30, 100, 50);
  ellipse(300, 30, 100, 50);
}



