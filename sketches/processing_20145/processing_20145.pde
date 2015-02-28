
// Love Jon - February 1, 2011
PFont myFont;
float x = 1;
  
void setup(){
  size(420, 160);
  myFont = createFont ("Batang", 48);
  textFont(myFont, 50);
  textAlign (0,CENTER);
}
   
void draw() {
  background(33,245,225);
  x -= 0.010;
  fill(255, 25, 20, 300 * abs(sin(x)) - 130);
  text("I",30,40);
  fill(0, 50, 160, 275 * abs(sin(x + HALF_PI * 0.1)) - 90);
  text("Love");
  fill(90, 130, 150, 250 * abs(sin(x + HALF_PI* 0.3)) - 90);
  text("You");
  fill(30, 200, 40, 225 * abs(sin(x + HALF_PI* 0.5)) - 90);
  text("Becca"); 
} 

