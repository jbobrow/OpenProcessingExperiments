
void setup() {
  size(500,500);
  smooth();
  background(0);
  stroke(255);      //This line is unnessesary... I think.   
}

float x = mouseX;  //The program gets upset when I don't define the variables 
float y = mouseY;  //before hand, these definitions are useless.
int n = 100;   
int m = 11;   // m is the "jump" around the black and white scale every fan.

void mousePressed() {     
  x = mouseX;             //Sets the center of the fan to the mouse's position.
  y = mouseY;
} 

void draw() { }   //The draw loop, I probably want my conditional key presses here.

void mouseDragged() {
  line(x, y, mouseX, mouseY);    //Draws a line every frame.
}

void mouseReleased() {
  stroke((n + m) % 250);   //Change the hue of the fan.
  n = n + m;
}

void keyPressed() {
  background(0);    //Clears the screen.
  x = mouseX;
  y = mouseY;
}




