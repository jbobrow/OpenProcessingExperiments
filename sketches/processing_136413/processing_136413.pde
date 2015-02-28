
/* @pjs preload="1.jpg", "2.jpg", "3.jpg", "4.jpg", 5.jpg";*/


PImage i001, i002, i003, i004, i005 ;
int myState = 0, myCounter = 1;

void setup()
{
  size(700, 450);


  //images
  i001 = loadImage("1.jpg");
  i002 = loadImage("2.jpg");
  i003 = loadImage("3.jpg");
  i004 = loadImage("4.jpg");
  i005 = loadImage("5.jpg");
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

void keyPressed() {
    if(keyCode == 72){
    myState = myState +1;
      if(myState>4){
        myState = 0;
      }}}


