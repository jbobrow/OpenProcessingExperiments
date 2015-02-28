
//shapes are not moving until mouse is over correct area
boolean topMove=false;
boolean middleMove=false;
boolean bottomMove=false;
boolean stop;

int shapeX=350;
int shapeY=200;
int shape0X=80;
int shape0Y=265;
int shape1X=265;
int shape1Y=525;
int shape2X=255;
int shape2Y=125;
int shape3X=250;
int shape3Y=500;
int shape4X=200;
int shape4Y=125;
int shape5X=400;
int shape5Y=325;
int shape6X=450;
int shape6Y=25;
int shape7X=400;
int shape7Y=25;
int shape8X=475;
int shape8Y=465;
int shape9X=480;
int shape9Y=500;
int shape10X=475;
int shape10Y=425;
int shape11X=325;
int shape11Y=580;
/*int cx;
 int cy;
 float xSpeed;
 float ySpeed;*/

void setup() {
  size(600, 700);
  background(243, 219, 157);
  frameRate(15);
  smooth();
}

void draw() {
  background(243, 219, 157);

  ///////////////////////////top section///////////////////////////
  //red circle
  noStroke();
  ellipseMode(CENTER);
  fill(122, 19, 29);
  ellipse(shapeX, shapeY, 300, 300);


  //white rect
  fill(255);
  quad(shape0X, shape0Y, shape0X + 470, shape0Y - 115, shape0X + 470, shape0Y - 95, shape0X, shape0Y + 35);


  //top blue rect
  fill(129, 150, 135);
  quad(shape2X, shape2Y, shape2X + 20, shape2Y + 10, shape2X - 35, shape2Y + 90, shape2X- 65, shape2Y + 75);


  //top small line
  stroke(51);
  line(shape4X, shape4Y, shape4X + 250, shape4Y + 100);


  ///////////////////////////middle secton///////////////////////////

  //bottom blue rect
  noStroke();
  fill(129, 150, 135);
  quad(shape1X, shape1Y, shape1X + 20, shape1Y + 10, shape1X- 65, shape1Y + 90, shape1X- 75, shape1Y + 75);


  //blue rect
  quad(shape3X, shape3Y, shape3X + 5, shape3Y - 10, shape3X + 85, shape3Y + 40, shape3X + 80, shape3Y + 50);


  //black rect
  noStroke();
  fill(51);
  quad(shape5X, shape5Y, shape5X + 50, shape5Y + 25, shape5X - 50, shape5Y + 205, shape5X - 100, shape5Y + 175);


  //large orange rect
  fill(200, 66, 0);
  quad(shape6X, shape6Y, shape6X + 100, shape6Y + 75, shape6X - 300, shape6Y + 575, shape6X - 400, shape6Y + 475);


  //right blue rect
  noStroke();
  fill(129, 150, 135);
  quad(shape8X, shape8Y, shape8X - 10, shape8Y - 12, shape8X + 25, shape8Y - 45, shape8X + 35, shape8Y - 35);
  //shape8Y;

  //diagonal line
  stroke(51);
  line(shape7X, shape7Y, shape7X - 350, shape7Y + 425);


  ///////////////////////////bottom section///////////////////////////

  //right orange rect
  fill(200, 66, 0);
  quad(shape9X, shape9Y, shape9X -10, shape9Y - 5, shape9X + 42, shape9Y - 75, shape9X + 50, shape9Y - 70);


  //small line
  stroke(51);
  line(shape10X, shape10Y, shape10X + 50, shape10Y + 50);


  //square
  noStroke();
  fill(122, 19, 29);
  quad(shape11X, shape11Y, shape11X + 45, shape11Y + 20, shape11X + 25, shape11Y + 60, shape11X - 15, shape11Y + 43);


  ////////////////////////Conditionals////////////////
  //////top//////
  //If topMove is true, shapes will move
  if (topMove) {
    shapeY= shapeY + 2;
    shape0Y++;
    shape2Y= shape2Y + 2;
    shape4Y= shape4Y + 3;
  }
  //If topMove is false, shapes will reset
  if (!topMove) {
    shapeY=200;
    shape0Y=265;
    shape2Y=125;
    shape4Y=125;
  }
  //If the mouse is in top third, topMove is true
  if (mouseX > 0 && mouseX < 600 && mouseY > 0 && mouseY < 233) {
    topMove=true;
  }
  //If the shapes go off the page, topMove is false
  if (shapeY>700 && shape0Y>700 && shape2Y>700 && shape4Y>700) {
    topMove=false;
  }

  //////middle//////
  //If middleMove is true, shapes will move
  if (middleMove) {
    shape1X= shape1X - 2;
    shape3X= shape3X + 1;
    shape5X--;
    shape6X= shape6X + 2;
    shape8X= shape8X + 1;
    shape7X= shape7X - 3;
  }
  //If middleMove is false, shapes will reset
  if (!middleMove) {
    shape1X=265;
    shape3X=250;
    shape5X=400;
    shape6X=450;
    shape7X=400;
    shape8X=475;
  }
  //If the mouse is in middle third except middle, middleMove is true
  //if (mouseX > 0 && mouseX < 200 && mouseX > 400 && mouseX < 600 && mouseY > 233 && mouseY < 466) {
  if (mouseX > 0 && mouseX < 600 && mouseY > 233 && mouseY < 466) {
    middleMove=true;
  }
  //If the shapes go off the page, middleMove is false
  if (shape1X<0 && shape3X>600 && shape5X<0 && shape6X>600 && shape8X>600 && shape7X<0) {
    middleMove=false;
  }  

  //////bottom//////
  //If bottomMove is true, shapes will move
  if (bottomMove) {
    shape9Y= shape9Y - 2;
    shape10Y--;
    shape11Y= shape11Y - 2;
  }
  //If bottomMove is false, shapes will reset
  if (!bottomMove) {
    shape9Y=500;
    shape10Y=425;
    shape11Y=580;
  }
  //If the mouse is in bottom third, bottomMove is true
  if (mouseX > 0 && mouseX < 600 && mouseY > 466 && mouseY < 700) {
    bottomMove=true;
  }
  //If the shapes go off the page, bottomMove is false
  if (shape9Y<0 && shape10Y<0 && shape11Y<0) {
    bottomMove=false;
  }
}//end draw

void mouseClicked() {
  if (topMove) {
    topMove=false;
  } 
  if (middleMove) {
    middleMove=false;
  }
  if (bottomMove) {
    bottomMove=false;
  }
}   
/*shapeY= shapeY + 2;
 shape0Y++;
 shape2Y= shape2Y + 2;
 shape1Y= shape1Y - 2;
 shape3Y= shape3Y + 1;
 shape5Y--;
 shape6Y= shape6Y + 2;
 shape8Y= shape8Y + 1;
 shape7Y= shape7Y - 3;
 shape9Y= shape9Y - 2;
 shape10Y--;
 shape11Y= shape11Y - 2;*/


