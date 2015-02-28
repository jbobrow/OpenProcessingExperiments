
PImage frame;
PImage LButton;
PImage RButton;
int x = 400; //Starting point for dot
int y = 300; //Starting point for dot
int z = 1;    //Rate of cursor speed
float i = 0; //rotation left button
float r = 0; //rotation right button
float k = 25; //Opacity Addition
float rotation = .4; //Rate of rotation
String s = "Ryan Stack is the cheapest male prostitute in California.  Call him at 1(503)867-1523 or add him at http://www.facebook.com/ryancstack";
void setup() {
  imageMode(CENTER);
  size (800, 600);
  frame = loadImage("Pad.png");
  LButton = loadImage("LeftButton.png"); //Loads both buttons
  RButton = loadImage("RightButton.png");
  image(frame, x, y);
  rect(100, 100, 600, 350, 10);
  image(LButton, 150, 500); //Draws Left button
  image(RButton, 650, 500); //Draws Right button
  
}

void draw() {

  smooth();
  noStroke();
  rect(x, y, 1, 1);
  fill(0);
  textSize(45);

  if (keyPressed &&(key == CODED)) {
    y = constrain(y, 105, 445);   //Up  & Down Contrain
    x = constrain(x, 105, 730);  //Left & Right Contrain

    if (keyCode == UP) { 
     fill(50);
            text(s, 300, 100, 800, 600);  // Text wraps within text box 
      translate(150, 500);
      //y = y - z;
      i = i - rotation;
    }
    if (keyCode == DOWN) {
            fill(50);
            text(s, 300, 100, 800, 600);  // Text wraps within text box
          translate(150, 500);
      //y = y + z;
      i = i + rotation;
     

    }
    if (keyCode == RIGHT) {
     fill(50);
            text(s, 300, 100, 800, 600);  // Text wraps within text box
      translate(650, 500);
      //x = x + z;
      r = r + rotation;
    }
    if (keyCode == LEFT) {
     fill(50);
            text(s, 300, 100, 800, 600);  // Text wraps within text box
      translate(650, 500);
      //x = x - z;
      r = r - rotation;
    } 

    rotate (r);
    image(RButton, 0, 0);
    rotate (i);
    image(LButton, 0, 0);
  }
}  

void mouseDragged() {
  background(255);
  smooth();
  stroke(1);
  k = k + 25;
  fill(255,255,255,k);
  image(frame, mouseX, mouseY);
  rectMode(CENTER);
  rect(mouseX, mouseY, 600, 400, 10);
    image(RButton, -250+mouseX, 200+mouseY);
    image(LButton, 250+mouseX, 200+mouseY);
}    
void mouseReleased () {
  background(255);
  smooth();
  stroke(1);
  fill(255,255,255,k);
  image(frame, 400, 300);
  rectMode(CENTER);
  rect(400, 275, 600, 350, 10);
  k = 25;
    image(RButton, 150, 500);
    image(LButton, 650, 500);
}
