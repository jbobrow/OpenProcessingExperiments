
//Title: The speed bubbles with squares
/*This work mixing speed with the generation of bubbles and 
confetti squares. The mouse movement creates bubbles 
proportional to the drift velocity of the mouse. 
To create squares simply press the mouse. 
To modify the colors just press 1, 2, 3.
*/
//Global variables
color strokeColor = color(0,10);

//setup
void setup() {
 size(800,700);
  colorMode(HSB, 360, 100, 100, 100);
 // noFill();
  background(360);
}
//draw 
void draw() {
  variableEllipse(mouseX, mouseY, pmouseX, pmouseY);
   if (mousePressed){
   rect(mouseX,mouseY,50,50);
   }
}

// It calculates the speed of the mouse
// and draws the ellipse proportional to the drift velocity 
// of the mouse.  

void variableEllipse(int x, int y, int px, int py) {
  float speed = abs(x-px) + abs(y-py);
  stroke(speed);
  strokeWeight(5);
  stroke(strokeColor);
  fill(strokeColor);
  ellipse(x, y, speed/2, speed);
}

//KeyPressed()
//change colors
void keyReleased(){
  if(key == DELETE || key == BACKSPACE) background(360);
  if(key == 's' || key == 'S') saveFrame("bubble.png");
  
  switch(key){
   case'1':
   strokeColor = color(30,10,10,20);
   break;
   case'2':
   strokeColor = color(1942, 100, 48, 10);
   break;
   case'3':
   strokeColor = color(32, 1470, 71 ,10);
   break;
   
  }
}
//end
