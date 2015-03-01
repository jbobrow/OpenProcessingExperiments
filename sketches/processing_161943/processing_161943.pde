
int x = 110;
int y = 2*x;
int h = height;
int c = (540/2);
int p = c+270;


   

void setup() {
  size(540, 540);
  strokeWeight(4);
  smooth();
 

}
//Watch
void draw() {
  background(0);
  ellipse(c, c, p, p);
  stroke(255);
  line(c, c, mouseX, mouseY);  // Blue line
  stroke(0);
  float mx = mouseX/2 + 60;
  line(c, c, mx, mouseY);  // Black line
  stroke(250);
  fill(255);
  text(12, c-20, 40);  //12
  text(6, c, 535);     //6
  text(9, 20, c);      //9
  text(3, 510, c);     //3
  //Date
  if (keyPressed) {
    text("09/21/14", c-90, c+50);    //Date
  }
  //Instructions
  text("Press", 5, 55);   //Press
  text("For", 5, 510);    //For
  text("Key", 455, 55);   //Key
  text("Date", 450, 510); //Date
  textSize(40);
  fill(0, 102, 153); 

}


