
//shapes are not moving until mouse is over correct area
boolean disperse = false;
boolean stopped = false;

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
  frameRate(70);
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
  if (disperse && shape10Y < 700) {
    shapeY= shapeY - 5;//red circle
    shape0Y= shape0Y - 4;//white rect
    shape2Y= shape2Y - 3;//top blue rect
    shape4Y= shape4Y - 2;//top line
    //////////
    shape1Y= shape1Y - 2;//bottom blue rect
    shape3Y= shape3Y - 2;//blue rect
    shape5Y= shape5Y - 3;//black rect
    shape6Y= shape6Y - 5;//orange rect
    shape8Y= shape8Y - 2;//right blue rect
    shape7Y= shape7Y - 1;//diagonal line
    //////////
    shape9Y= shape9Y - 3;//orange rect
    shape10Y= shape10Y - 2;// small line
    shape11Y= shape11Y - 3;// red square
  }
  else {
    ///////top///////
    shapeY= shapeY + 5;//red circle
    shape0Y= shape0Y + 4;//white rect
    shape2Y= shape2Y + 3;//top blue rect
    shape4Y= shape4Y + 2;//top line
    ///////middle///////
    shape1Y= shape1Y + 2;//bottom blue rect
    shape3Y= shape3Y + 2;//blue rect
    shape5Y= shape5Y + 3;//black rect
    shape6Y= shape6Y + 6;//orange rect
    shape8Y= shape8Y + 2;//right blue rect
    shape7Y= shape7Y + 1;//diagonal line
    ///////bottom///////
    shape9Y= shape9Y + 3;//orange rect
    shape10Y= shape10Y + 2;// small line
    shape11Y= shape11Y + 3;// red square*/
  }

  if (mouseX > 200 && mouseX < 400 && mouseY > 250 && mouseY < 450) {
    disperse = true;
  }

  else {
    disperse = false;
  }
  if (stopped && shapeY < 200) { //when its y is greater than
    shapeY=200;
    shape0Y=265;
    shape2Y=125;
    shape4Y=125;
    shape1Y=525;
    shape2Y=125;
    shape3Y=500;
    shape4Y=125;
    shape5Y=325;
    shape6Y=25;
    shape7Y=25;
    shape8Y=465;
    shape9Y=500;
    shape10Y=425;
    shape11Y=580;
  }

  if (shapeY < 100) {
    stopped = true;
  }
}//end draw
  



