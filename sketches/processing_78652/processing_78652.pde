
                //*************************\\
        //   *** HW#7__Nov_12_2012 ****\\
// ****  Dana Silberberg-Sahar **** \\
         //part 1: Get (clown-stamp)\\

PImage cat;

void setup() {
  size(900, 300);
  cat=loadImage ("cat.jpg");

  colorMode (HSB, 360, 100, 100, 100);
  // colorMode (RGB, 255, 255, 255, 100);
}
void draw() {
  image (cat, 300, 0);//location of image
  color cp=get(mouseX, mouseY);
  float h= hue (cp);
  float s= saturation (cp);
  float b= brightness (cp);
  //println (r);
  //println (b);
  //  println (g);
  if (mousePressed) {
    fill (h, s, b);
    stroke (h, s, b);
    strokeWeight (5);
    rect (mouseX+300, mouseY, 1,1);
  }
  else {
    fill (h, 0, b);
    stroke (h, 0, b);
    strokeWeight (5);
    rect (mouseX-300, mouseY,1 ,1);
  }
}


