
/* I wanted a program where I can play around with the picture of 
a sunrise. I wanted to play with the changing and quickly passing
moment where every carelessness in attenion will refuse an impression 
you cannot bring back.

Program starts immediatly with producing bubbles. 
Use c or C and the background will change and bubbles will start 
again. 
Left mouse click once and you will see multiple sunrises hidden. 
But bubbles will cover the picture quickly. You cannot stop it.
The only possibility is not to release the mouse. The disturbing 
bubbles will be covered by the moving picture. But you can't stop 
the sunrise from vanishing. 
Only saving with s or S will give you a screenshot like a 
photo and allows you to catch the moment.
You can pause by going back with c or C and watch bubbles for a while 
and continue later. But everything that had already changed with the 
pictures of the sunrise you can't bring back and the traces of the 
pictures will also have vanished and be replaced by the plain color 
of the background.
Only by starting the program again like a new day and a new chance you
will have the pictures and the sunrises back - for a while.
By Delete or Backspace, Bubbles will first be reduced and the background 
will turn to dark blue like at night time. But the pictures of the 
sunrise will not return to their beginning. 
Altogether I wanted to give an impression of the disturbing momentariness 
of a sunrise.
*/

//Declare a PImage variable type
PImage testo;

//Load an image file from HDD
/*Don't forget to add the file 
to your sketch 'data' folder*/
void setup() {
  size(990, 700); 
  background(255, 145, 105);
  testo = loadImage("Sonnenaufgang.JPG");
}

//Draw the images to the screen, draw the bubbles
  int x = 0;

void draw() {
  if (mousePressed) {
   image(testo, x, 0, 495, 350);
   image(testo, x + 495, 0, 495, 350);
   image(testo, x + 495, 350, 495, 350);
   image(testo, x, 350, 495, 350);
   x++;
   drawBubble(random(30, 60));
  }
  else {
    drawBubble(random(25, 80));
  }
}

//define drawBubble
void drawBubble(float d) {
  float x = random(width);
  float y = random(height);

  stroke(random(155, 135), 3, random(50, 255));
  noFill();
  ellipse(x, y, d, d - 5);
  ellipse(x, y, d - 5, d - 10);
}

 //KeyboardInput
 void keyReleased(){
  if (key == DELETE || key == BACKSPACE) background(360);
  if (key == 's' || key == 'S') saveFrame("screenshot.png");
  if (key == 'c' || key == 'C'){
    background(random(width), random(height), 100);
  }
}

