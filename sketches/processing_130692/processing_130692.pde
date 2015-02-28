
/*
Project 2
 Ellena Lawrence
 ellena.lawrennce@gmail.com
 October 28th 2013
 Image of the sun over 11 years. Slide left and right to fade the pictures
 */

PImage [] Solar = new PImage [11];//load array for images
int wide = 340;//setting width for the pictures
float period = wide/Solar.length + 15; //setting period length for fade
Fading [] Sun;


void setup () {
  size (340, 340);
  smooth ();
  Sun = new Fading [Solar.length];//load fade class
  for (int i = 0; i < Solar.length; i++) {
    Solar [i] = loadImage("Sun"+i+".jpg");//loading image array
    Sun [i] = new Fading ((period*i),(period*(i+1)));//loading a fade array
  }
}

void draw () {
  image (Solar [0],0,0);
  for (int i = 0; i < Solar.length; i++){
    Sun [i].update();//running class
    image (Solar [i],0,0);//showing image
  }

}
class Fading {

  Float x1, x2;
  Float tint1;

  Fading (float Start, Float Finish) {
    x1 = Start;
    x2 = Finish;
  }
  //if mouse is in period image fades in 
  void update () {
    if ( mouseX > x1 && mouseX < x2) {
      tint1 = ((255/(x2-x1))*(mouseX-x1));//stretching period out
      tint (255, tint1);//tint
    } 
    if ( mouseX < x1) {
      tint (255, 0);// image at full streght
    }
    if ( mouseX > x2) {
      tint (255, 255);//image gone might need to be flipped
    }
  }
}



