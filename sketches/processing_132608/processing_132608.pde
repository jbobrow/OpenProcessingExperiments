
import processing.pdf.*;
String creator =  "created by Tony Sinclair";
int yCenterVal = height/2; //centers the screen (y axis)
int xCenterVal = width/2;  //centers the screen (x axis)
int counter = 0; //initiates variable
int rs = 0; //initiates variable
int record = 0;//initiates variable
void setup() {
  size(700, 700);
//  beginRecord(PDF, "circles.a."+ record +".pdf");
}
void draw() {
  translate(width/2, height/2); //centers the screen
  rotate(PI/int(rs)); //rotates the screen
  drawingCircles(xCenterVal, yCenterVal, Scale()); //draws the circles
  count(); //increases the value of variable counter
  rotate(PI/int(rs)); //rotates the screen
  count_Check(); //checks the value of "counter"
  print(",");
  println(counter);
}
void count_Check()
{
  int stop_num = int(random(5, 300)); //randomizes the number of circles to be drawn
  print(stop_num);
  if (counter >= stop_num)
  {
//    endRecord();
    background(200); //resets background
    counter = 0; //resets the variable "counter"
    record = record + 1; //increses the value of the variable "record" to save the pdf to a new location
    rs = rotSpeed(); //sets the value of rs
//    beginRecord(PDF, "circles.a."+ record +".pdf");
  }
}
void count()
{
  counter = counter + 1; //increases the value of the variable
}
int Scale()
{
  return int(random(300)); //randomizes the size of the circles
}
int rotSpeed()
{
  return int(random(2, 10)); //randomizes the angle of rotation
}
void drawingCircles (int xCenterVal, int yCenterVal, int Scale)
{
  noFill();
  ellipse (xCenterVal, yCenterVal, Scale, Scale); //draws the circle located in the center (when not rotated)
  ellipse(xCenterVal+Scale, yCenterVal, Scale, Scale);  //draws the circle located to the right (when not rotated)
  ellipse(xCenterVal, yCenterVal+Scale, Scale, Scale);  //draws the circle located on the top (when not rotated)
  ellipse(xCenterVal-Scale, yCenterVal, Scale, Scale);  //draws the circle located to the left (when not rotated)
  ellipse(xCenterVal, yCenterVal-Scale, Scale, Scale); //draws the circle located on the bottom (when not rotated)
}


