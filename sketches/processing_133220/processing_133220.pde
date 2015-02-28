
void setup() {
  size(500, 500);
  frameRate(8);
}

void draw() {

  noStroke();

  int xPosition;
  int yPosition;
  int rect1;
  int rect2;

  int rect1x;
  int rect2x;
  int h = 400;

  float width=random(0, 500);
  float height=random(0, 350);

  //   fill(0,3,0,30);
  ellipse(width*2, height, h+40, h);
  //   fill(7,0,2,2);
  ellipse(width/2, height/2, h+4, h+10);
  ellipse(width/2, height/2, h+100, h+300);
  h = h + 300;

  //   fill(255,255,255,10);
  ellipse(width, height, h*3, h*width);



  xPosition = round( random(0, 200) );
  yPosition = round( random(0, 500) );
  rect1 = round( random(400) );
  rect2 = round( random(300) );

  rect1x = round( random(100) );
  rect2x = round( random(300) );



  fill(255, 255, 255, 63);
  rect(xPosition+20, yPosition, rect1x, 0);

  fill(255, 255, 255, 70);
  rect(xPosition, rect1+45+30, 200, rect2);

  fill(255, 255, 255, 0);
  rect(xPosition, rect1-xPosition, 30, 50);

  fill(0, 0, 0, 10);
  rect(xPosition, rect1+rect2+6*yPosition, rect1, 30);
}



