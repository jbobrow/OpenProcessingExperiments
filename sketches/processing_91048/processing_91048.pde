
//Smiley Face Chris Pro
 //click the mouse anywhere to see an image
 //press a key and a body appears
 PImage myGuitars;
 
 
 int imageX = 200;
 int imageY = 325;
 int frekSize = 7;
  
 
//Window Size
 void setup() {
 size(800, 600);
 background(255);
 myGuitars = loadImage("myGuitars.jpg");
 }
void mousePressed() {
 //image appears
 image(myGuitars, 0, 0, imageX, imageY);
 }
void draw() {
 strokeWeight(3);
 //face
 fill(255, 246, 142);
 ellipse(400, 300, 200, 200);
//eyes
 fill(255, 255, 255);
 ellipse(360, 260, 25, 25);
 ellipse(430, 260, 25, 25);
 fill(0, 255, 0);
 ellipse(360, 260, 12, 12);
 ellipse(430, 260, 12, 12);
 fill(0, 0, 0);
 ellipse(360, 260, 5, 5);
 ellipse(430, 260, 5, 5);
//nose
 line(395, 275, 395, 315);
 line(395, 315, 410, 315);
//freckles
 fill(183, 174, 78);
 ellipse(330, 295, frekSize, frekSize);
 ellipse(360, 295, frekSize, frekSize);
 ellipse(345, 315, frekSize, frekSize);
 ellipse(430, 295, frekSize, frekSize);
 ellipse(460, 295, frekSize, frekSize);
 ellipse(445, 315, frekSize, frekSize);
//glasses
 fill(255, 255, 255, 0);
 rect(340, 247, 40, 25);
 rect(410, 247, 40, 25);
 line(380, 259.5, 410, 259.5);
 line(340, 259.5, 315, 247);
 line(450, 259.5, 485, 247);
//Mouth
 fill(255, 0, 0);
 bezier(350, 350, 375, 400, 425, 400, 450, 350);
//Hair
 fill(242, 155, 24);
 triangle(340, 200, 380, 200, 340, 230);
 triangle(340, 200, 380, 200, 355, 230);
 triangle(350, 200, 400, 200, 375, 230);
 triangle(370, 200, 410, 200, 385, 230);
 triangle(410, 200, 430, 200, 385, 230);
 triangle(400, 200, 450, 200, 425, 230);
 triangle(425, 200, 460, 200, 460, 230);
 }
void keyPressed() {
 //Stick Figure Body
 line(400, 400, 400, 500);
 line(400, 435, 365, 415);
 line(400, 435, 435, 415);
 line(400, 500, 365, 525);
 line(400, 500, 435, 525);
 }


