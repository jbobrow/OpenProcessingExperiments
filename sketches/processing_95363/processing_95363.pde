
/*Create a pair of expressive eyes in processing. 
 Make the eyes on your face respond to the mouse in some way.
 
 You will need to use either one of the mouse system variables
 (mousePressed, mouseButton - see the example 4.5 in the Shiffman Textbook)
 or at least one conditional statement (see Page 51 of the Processing,
 A Programming Handbook for Visual Designers by Reas and Fry) to to make this interaction happen.
 
 You are also to read through chapter's 5 and 6 in Shiffman book and complete the exercises in them.*/

int righteye = 100;
int lefteye = 100;
int eye = 40;
int g = 198;
int r = 255;
int fur=5;
float xIris = map (mouseX, 0, width, 47, 137);
float yIris = map (mouseY, 0, width, 80, 130);



void setup () {


  size(300, 300);
}



void draw() {





  noStroke();
  background(9, 91, 188);



  //Draw eyes 
  fill(255, g, 8);
  ellipse(220, 120, righteye, eye);
  ellipse(90, 120, lefteye, eye);

  //iris follows the mouse XY positions

  float xIris = map (mouseX, 0, width, 40, 140);
  float yIris = map (mouseY, 0, width, 99, 140);

  fill(0);
  ellipse (xIris, yIris, 10, 10);
  ellipse (xIris+130, yIris, 10, 10);

  // If mouse is clicked, eyes open. 
  if (mousePressed == true) {
    eye = 80;
  }
  else if (mouseY > 296 || mouseY < 5 ) {
    eye = 40;
  }

}




//When mouse is click and dragged around, monster eyes change colour
void mouseDragged() 
{
  g= g+ 1;
  r= r+1;

  if (g > 255 || r <255) {
    g = 198;
    r=r+1;
    eye=40;
  }
}



