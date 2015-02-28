
/*
Project 2
 Ellena Lawrence
 ellena.lawrennce@gmail.com
 October 28th 2013
 Images of athabasca with pointizism add
 */

PImage [] Athabasca = new PImage [25]; //setting up array for image
int wide = 640; // setting width
float period = wide/Athabasca.length; //setting period length for fade
Fading [] athas;//setting array for fade



void setup () {
  size (wide, wide);
  smooth ();
  athas = new Fading [Athabasca.length]; //loading array for fade
  for (int i = 0; i < Athabasca.length; i++) {
    Athabasca [i] = loadImage("athabasca_tm5_"+i+".jpg");//loading image array
    athas [i] = new Fading ((period*i),(period*(i+1)),"1998",Athabasca[i]); //loadinf fade array info
  }
}

void draw () {
  image (Athabasca [0],0,0);

  for (int i = 0; i < Athabasca.length; i++){
    athas [i].update();//calucating fade
    image (Athabasca [i],0,0);//displaying image
  }

}

class Fading {

  Float x1, x2;
  String YearX;
  Float tint1;
  PFont font;
  PImage img;
  int pointillize;

  Fading (float Start, Float Finish, String Year, PImage Source) {
    x1 = Start;
    x2 = Finish;
    YearX = Year;
    img = Source;
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
   /* pointillize = mouseY - 640;//setting circle size based on mouse postion 
    int x = int(random(img.width));//picking random point for circle
    int y = int(random(img.height));
    int loc = x + y*img.width;//setting pixel location

    // Look up the RGB color in the source image
    loadPixels();
    float r = red(img.pixels[loc]);//checking color at loction
    float g = green(img.pixels[loc]);
    float b = blue(img.pixels[loc]);
    noStroke();

    // Draw an ellipse at that location with that color
    fill(r, g, b, 100);
    ellipse(x, y, pointillize, pointillize);//draawing pixel */
  }
}



