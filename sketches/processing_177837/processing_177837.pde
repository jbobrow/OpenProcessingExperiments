
//Final Project - Coloring on Processing

//ProjectDescription
/*In this project, you will be able to change the backgrounds and
color of some characters you will see in white. 
The objetive is to spend some time experimenting with 
the color provided.*/

//Instructions
/*You can choose between three scenaries. You can choose the one
you like the most by trying them all before you start coloring.
Press either "1", "2" or "3" on the keyboard to see your options.

Your default color brush is black, but you can choose between a variety
of colors: yellow, green, blue, pink, orange, red, lightblue, and
of course, black again.

In order to change the brush color press the correct letter:
Blue: "b"
Green: "g"
Pink: "p"
Black: "n"
LightBlue: "l"
Yellow: "y"
Orange: "o"
Red: "r"

IMPORTANT NOTE: Everytime you want to change the color of the brush
you'll have to press the background number again.
For example: If I'm coloring the background number "1" and I want to
change from black to blue, I'll have to press the number "1" first
and then the letter "b" (blue)

If you liked what you did, you can always save it by pressing either
"S" or "s" on the keyboard and, if you want to move on to the next
background, don't forget to delet the one you finished already by
pressing either "DELETE" or "BACKSPACE" on your keyboard. NOTE: In
the web version you will have to press "0" to delete the canvas*/

//Technical Information

/*All the background images are copyright free and they were
found at https://unsplash.com

The characters were drawn by myself, Estívaliz Silva.*/


//Declare global variables

  //Color
  color fillColor = color(0, 10);
  //Images
  PImage FirstImageFill;
  PImage SecondImageFill;
  PImage ThirdImageFill;

//Brushes Parameters
int w = 5;
int h = 5;

//Setup
void setup(){
   size(1000, 667);
   background(#FFFFFF);
   colorMode (HSB, 300, 200, 100, 100);
   FirstImageFill = loadImage("FirstImageFill3.png");
   SecondImageFill = loadImage("SecondImageFill.png");
   ThirdImageFill = loadImage("ThirdImageFill.png");
}

//Key Trigger - Change Background

void draw(){
if ( key == '1' ) {
    image(FirstImageFill, 0, 0);
  }
if ( key == '2' ) {
    image(SecondImageFill, 0, 0);
  }
if ( key == '3' ) {
    image(ThirdImageFill, 0, 0);
  }
if ( key == '0' ) {
    background(#FFFFFF);
  }
 
//Manage brushes

if (mousePressed) {
    pushMatrix();
    noStroke();
    fill(fillColor);
    ellipse(mouseX, mouseY, w, h);
    popMatrix();
  }
}
void mouseDragged() {
  w++;
  h++;
}
void mouseReleased() {
  w = 20;
  h = 20;
}

// Chnaging Brush Color

void keyPressed() {
 switch(key){
//Green
  case 'g':
  fillColor = color(100, 100, 100, 20);
  break;
//Blue
  case 'b':
  fillColor = color(200, 500, 100, 5);
  break;
//LightBlue
  case 'l':
  fillColor = color(150, 200, 600, 4);
  break;
//Red
  case 'r':
  fillColor = color(700, 242, 100, 15);
  break;
//Orange
  case 'o':
  fillColor = color(10, 100, 300, 20);
  break;
//Yellow
  case 'y':
  fillColor = color(59, 100, 100, 50);
  break;
//Salmon/Pink
  case 'p':
  fillColor = color(296, 60, 100, 25);
  break;
//Black
  case 'n':
  fillColor = color(300, 200, 100, 100);
  break;
}
}

//Saving
void keyReleased() {
   //ScreenShot Saving Capability
  if (key =='S' || key == 's') saveFrame("screenshot.png"); 
  if (key == DELETE || key == BACKSPACE) background(#FFFFFF);
}

