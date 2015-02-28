
void setup(){   // this is only run once
  frameRate(60); //sets the frame rate per second
  size (608, 610); // 
  background (255); //sets background color to white
  strokeWeight(8); // sets thickness of line
  
} 
//defining and initalizing variables
//float is a data type
// stretch1, stretch2, y, y2, x, etc are names which are assigned values
// 0 and 420  are the initial values assigned to the variables 
float y = 0; 
int y2 = 0;
float x2 = 0;
float x3 = 0;
float x4 = 0;
float x5 = 0;
float y3 = 0;
float y4 = 0;
float y5 = 0;
float y6 = 0;
float stretch1 = 420;
float stretch2 = 420;
float y2r = 610;
int redColour = 0;
float newMouseX = 0;
float newMouseY = 0;
void draw(){ // method
// top horizontal line, constant size
line (0, 117, 452, 117);
// 2nd line from the top
line (0, 240, x2, 240); // expanding from 0 to 610 across the screen
if (x2<610) // let's stop when x2 gets to 610
x2 = x2 + 1.2; //speed of the line going across the screen
// 3rd line from the top
line (0, 320, x3, 320); // expanding from 0 to 608 across the screen
if (x3<608) // let's stop when x3 gets to 608
x3 = x3 + 1.0; //speed of the line going across the screen
// 4th line from the top 
line (0, 422, x4, 422); //expanding from 0 to 450
if (x4<450) // let's stop when x4 gets to 450
x4 = x4 + 0.6; //speed of the line going across the screen
// 5th line from the top
line (0, 520, x5, 520);  //expanding from 0 to 608
if (x5<608) // let's stop when x5 gets to 608
x5 = x5 + 2.1; //speed of the line going across the screen
 
//first line to the left (vertical)
stroke(0,255,0);
point(125, y2); //expanding from 0 to 610
if (y2<610) //let's stop when y2 gets to 610
y2 = y2 + 10; //speed of the line going down the screen 
stroke(255, 0, random(0,255)); //red color, no green, set the blue to a random value  
line(125, y2r, 125, 610); //expanding from 610 to 0
if (y2r>0) //let's stop when y2 gets to 0
y2r = y2r -2; //speed of the line going up the screen 
stroke(0,0,0); //setting the color back to black
// 2nd line
line (189, stretch1, 189, stretch2); // expanding outwards from 420, up and down by 100 pixels, to 520 and 320
if (stretch1>320) // stop at 320
stretch1 = stretch1 - 0.25; // speed and direction (up) of the expanding line
if (stretch2<520) //stop at 520
stretch2 = stretch2 + 0.25; //speed and direction (down) of the expanding line
// 3rd line
newMouseX = map (mouseX, 0, 610, 0, 255); // converts the values of the pixels (0-600) to fit better with the value of colour (0-255)
newMouseY = map (mouseY, 0, 610, 0, 255); // converts the values of the pixels (0-600) to fit better with the value of colour (0-255) and 
stroke (newMouseX,0,newMouseY); // changes the color when mouse moves up, down and/or to the right, left
line (250, y3, 250, 610);
stroke(0); // changing the colour back to black 
// 4th line  
line (452, 0, 452, y4); 
if (y4<=117) // up until pixel 117, go at speed 1
y4 = y4 + 1;
if (y4>117 && y4<610) // after pixel 117, speed up to 1.55
y4 = y4 + 1.55;
// 5th line
line (532, y5, 532, 0); //(553, 0, 553, 610)
if (y5<610)
y5 = y5 + 0.65;
// 6th line
line (575, 0, 575, y6); // line (575, 0, 575, 238);
if (y6<238)
y6 = y6 + 0.42;
//  rectangle
fill(redColour,0,0); //fills rectangle with red color, starting at black, going slowly to red 
rect (250, 320, 452-250, 422-320); //draws a rectangle
   if(redColour < 255)  // if the value is less than 255, keep going 
      redColour++; // add 1 to the red color and make it brighter (or more red)
}
