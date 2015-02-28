
/* how to store images!!!!*/

PImage abcd;

void setup() {
  abcd = loadImage("large-hand.jpg");/*put name of file in here*/
  size(abcd.width, abcd.height);
}

void draw () {
  noTint();
  image(abcd,0,0);
  tint(127, 255); /*values can be either; g(grey), ga(alpha/opacity), rgb, rgba*/
  image(abcd,300,0 , 40,200); /*the 2 extra values add a width&height and warp image*/
}

