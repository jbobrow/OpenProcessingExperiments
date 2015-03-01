

//runs the code line by line, one time
void setup () {
//shows the rate at which each frame will play 
 frameRate (15);
//sets the size of the sketch 500px by 500 px
 size (500, 500);
 
}
// runs the code as a loop at the default frame rate 
void draw () {
//sets the background of the sketch to purple
  background (#B01FDE);
//decimal point 
float x = mouseX;
float y = mouseY;


 //sets the fill of the ellipse to orange 
fill (#FFA646);
//gives no stroke to the ellipse
noStroke();
//(mouseX,mouse Y is where the ellipse will be on the sketch)
//135 by 135 is how big the ellipse is
ellipse (mouseX, mouseY, 135, 135);
//sets the fill to the first rectangle green
fill (#81F022);
//(189,189 is where the rect appears on the screen. (100,100) is the width and height of the rectangle
rect (189,189, 100, 100);
fill (#2291F0);
rect  (200, 200, 75, 75);
fill (#81F022);
rect(215, 215, 45, 45); 


 
}


