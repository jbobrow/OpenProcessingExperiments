
//first thing to do is load the images you want
PImage cam;
PImage mush1;
PImage mush2;
PImage toungue1;
PImage tounge2;
PImage fly;

//declare variables for the first mush button
int buttonx1; //x position of buttonx1
int buttony1; //y position of buttony1
int buttonsize1; //size of buttons1
int hover1; //used to determine strokeWeight if hovering
boolean button1; //the switch that turns the image on/off- true/false
int flyx;


//declare variables for the second mush button
int buttonx2; //x position of buttonx2
int buttony2; //x position of buttony2
int buttonsize2; //size of buttons2
int hover2; //used to determine stokeWeight if hovering
boolean button2; //the switch that turns the image on/off

//setup the sketch
void setup() {
  //load the first image for background and set the canvas to be the image's width and height
  cam = loadImage("cameleon.jpg");
  size (340, 454);
  

  //load image for first button
  mush1 = loadImage("m1.png");
  fly = loadImage("flys.png");

  toungue1 = loadImage("toungue.png");

  //initialize variables for the first button
  buttonx1 = 10;
  buttony1 = 10;
  buttonsize1 = 25;
  button1 = false;

  //load second image
  mush2 = loadImage("pschrecent.png");
  //initialize variables for second button
  buttonx2 = 230;
  buttony2 = 50;
  buttonsize2 = 25;
  button2 = false;
   flyx = 0;
}
//change ellipseMode to radius to make it easier to find d


void draw() {

  background(cam); //cameleon background
  image(fly, flyx , 0);
 flyx++;

  ellipseMode(RADIUS);
  //conditional to check whether the switch for the first image is on or off
  
 if (button2 == true ) {
  image(mush2, 0, 0); //if button is true then draw the imge
  }
  if (button1 == true && button2 == false) {
    image(mush1, 0, 0); //if the button is set to TRUE, draw the image
  }
  
  //conditional to check to see if the switch for the second image is on or off
  
  //conditional checks whether mouse is touching the button AKA hover 
  if (mouseX > buttonx1 && mouseX < buttonx1+buttonsize1 &&
    mouseY > buttony1 && mouseY < buttony1+buttonsize1) {
    hover1 = 10;
  }//if hovering, change the variable for strokeWidth to 5

  else {
    hover1 = 0;
  } //if not hovering leave strokewidth at 0}
  strokeWeight (hover1); //change stroke weight depending on the hover

  //if button 1 is clicked, draw button1
  if (button1 == true) {
    image(toungue1, 0, 0);
  }

  //if not clicked, draw a green button
    fill(0,255,0);
    rect(buttonx1, buttony1, buttonsize1, buttonsize1);
 

  //find the distance from the mouse to the center of the circle button
  float d = dist(mouseX, mouseY, buttonx2, buttony2);

  //if this distance is less than the radius of the circle button (inside the circle)
  if (d < buttonsize2) {
    hover2 = 5; //if hovering, change the variable for strokeWidth to 5
  }
  else {
    hover2 = 0; //if not hovering, leave the strokeWidth at 1
  }

  strokeWeight(hover2); //Change the stroke weight depending on the hover

  //if the circle button has been clicked, make it green
  if (button2 == true) {
    fill(0, 255, 0);
    ellipse(buttonx2, buttony2, buttonsize2, buttonsize2);
  }

  //if the circle button has not been clicked, make it white
  else {
    fill(255);
    ellipse(buttonx2, buttony2, buttonsize2, buttonsize2);
  }
}
//mouseclicked is used to run code when you click.
//code will only run whenever processing detects mouse clig
void mouseClicked() {
  //check and se if the user has clicked within the boundaries of square button
  if (mouseX > buttonx1 && mouseX < buttonx1+buttonsize1 && mouseY > 
    buttony1 && mouseY <buttony1+buttonsize1);
  {
    button1 = !button1;
  }

  //so if mouseX is greater than button 1 and mouse x is less than button and
  //button size AND the same for mouseY and the button
  //we're measuring the size of the button, so anything which is outside of it's
  //parameters doesn't count as true or false- this is clarified as below

  //now we need to show this distance between mouse and center of circle button
  //use because circle doesn't have 4 sides
  float d = dist(mouseX, mouseY, buttonx2, buttony2);
  //if the distance from the mouse to the circle is less than the radius then
  //will be inside the circle.

  if (d < buttonsize2) {
    button2 = !button2;
  }
  
  
}



