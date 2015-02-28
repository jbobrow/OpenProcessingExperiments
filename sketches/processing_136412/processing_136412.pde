
/* @pjs preload="one.jpg", "two.jpg", "four.jpg", "five.jpg", "six.jpg";*/


PImage i001, i002, i003, i004, i005;
int myState = 0, myCounter = 1;

void setup()
{
  size(600, 357);


  //images
  i001 = loadImage("one.jpg");
  i002 = loadImage("two.jpg");
  i003 = loadImage("four.jpg");
  i004 = loadImage("five.jpg");
  i005 = loadImage("six.jpg");
}

void draw()
{
  background(255);
  noStroke();
  smooth();



  switch(myState) {

  case 0:
    image(i001, 0, 0, width, height);
    break;

  case 1:
    image(i002, 0, 0, width, height);
    break;

  case 2:
    image(i003, 0, 0, width, height);
    break;

  case 3:
    image(i004, 0, 0, width, height);
    break;

  case 4:
    image(i005, 0, 0, width, height);
    break;
  }
}

void mousePressed() {
  myState = myState +1;
  if (myState>4) {
    myState = 0;
  }
}



