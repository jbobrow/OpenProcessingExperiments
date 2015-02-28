
/*
User Input From Keyboard
Dan Olson, 2012

Enter any number less than 10 digits long
Press enter to clear the input string
Press backspace to delete the last input digit //Delete feature does not work in Processing JS!!!
Left click to clear the screen
Right click to pause screen
Try these numbers:
"0,2,3,4,34,67,30,31,32,35,64,65,69,200,897"
*/
String inpLast = new String();
String inpCurrent = new String();
int num;
//import processing.pdf.*;
float angle;
float r;
float a;
float s;
void keyPressed(){
  if (key == ENTER) {
    inpLast = inpCurrent = inpCurrent + key;
    inpCurrent = "";
  }
  else if (key == BACKSPACE && inpCurrent.length() > 0 ){
    inpCurrent = inpCurrent.substring(0, inpCurrent.length() - 1);
  }
  else {
    inpCurrent = inpCurrent + key;
  }
}
void setup() {
  s=random(10,30);
  size(300,300);
  background(255);
  smooth();
  a = random(1);
  
  angle = 0.0;
  //beginRecord(PDF, "filename.pdf");
}
void draw() {
  stroke(50,random(150,255),255);
  num= int(inpCurrent);
  translate (mouseX, mouseY);
  float scalar = sin(angle*num) + 2;
  scale(scalar);
  strokeWeight(1.0 / scalar);
  rotate(angle);
  ellipse(s,s,s,s);
  angle += a *((1+sqrt(5))/2); //changing the denominator produces interesting results
  println(num);
  println(a);
}
void mousePressed() {
  if (mouseButton == RIGHT) {
  noLoop();
  endRecord();
  } else {
   a = random(1);
   a =1;
  loop();
  setup();
  }
}
