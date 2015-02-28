
//This program allows the user to make a line appear
//on the screen by clicking the mouse. The shade of the line
//gradually goes from black to white.

int x = 0;    //set 0 to variable x
int st = 0;   //set 0 to variable st

void setup() {
  size(640, 480);    //a 640 px by 480 px display
  background(111);   //set background color to medium gray
  strokeWeight(20);  //set stroke width to 20
  stroke(st);        //set stroke color to 0
}

void draw() {
  if (x > 0) {            //if the start of the line is greater than 0
  line(x, 0, x, height);  //draw a vertical line
  }
}

void mouseClicked() {        //when mouse is pressed
  stroke(st = st + 25);      //stroke color changes closer to white
  x = x + 50;                //moves the line to the right by 50 px
}

