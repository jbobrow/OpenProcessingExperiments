
//making the light switch move up and down while turning on and off the light.

//using the boolean (true/false) variable to keep track of switch.
boolean lightswitch = false;

//---------------------------
void setup() {
  size(300, 300);
}

//---------------------------
void draw() {

  //use boolean variable to change background color with light switch location.
  if (lightswitch == true) {
    background(255, 255, 0); //if true, yellow
  }
  else {                    //otherwise...
    background(0);          //black
  }

  //light switch back
  smooth();
  rectMode(CENTER);
  rect(150, 150, 90, 150);
  rect(150, 150, 40, 70);
  rect(150, 150, 30, 60);

  //screws
  ellipse(150, 100, 8, 8);
  line(150, 96, 150, 104);
  ellipse(150, 200, 8, 8);
  line(150, 196, 150, 204);

  //light switch
  //change mouse variable so the switch moves up and down with background
  if (lightswitch== true) { //if light switch is true, draw on switch
    //on switch variables
    text("ON", 140, 50);
    line(140, 125, 160, 125);
    line(140, 135, 160, 135);
    line(140, 125, 140, 135);
    line(160, 125, 160, 135);
    line(140, 135, 139, 150);
    line(160, 135, 161, 150);
    line(139, 150, 161, 150);
    line(139, 150, 139, 175);
    line(161, 150, 161, 175);
    line(140, 175, 160, 175);
  }
  else {                    //if not true, draw off switch
    //off switch variables
    text("OFF", 140, 260);
    line(140, 125, 160, 125);
    line(139, 150, 161, 150);
    line(139, 150, 139, 175);
    line(160, 165, 161, 150);
    line(140, 165, 139, 150);
    line(161, 150, 161, 175);
    line(140, 125, 140, 150);
    line(160, 125, 160, 150);
    line(140, 165, 160, 165);
    line(140, 175, 160, 175);
  }
}

//---------------------------
//Click mouse on top and bottom of image to turn light on and off
void mousePressed() { 
  if (mouseY < height/2) {
    lightswitch = true;
  }

  else if (mouseY > height/2) {
    lightswitch = false;
  }
}


