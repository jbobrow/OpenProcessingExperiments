
void setup() {
  size(800, 800);
  //smooth();
}

void draw() {
  background(164, 206, 250);
  strokeWeight(0);

  for (int x = height; x > 0; x = x - 5) { 
    //for (int rectColor = 0; rectColor < 256; rectColor++) {
    //fill(rectColor);
    {// thing that it does , can also use += sign
      colorMode(HSB);
      rectMode(CENTER);
      int BLight = (x + 15)0; //make a light brightness
      int BDark = (x + 55 )0; //make a dark brightness
      int HGreen = x-80 % 150;
      int HBlue = x-230 % 250;
      int HOrange = (x-20) % 60;
      int HRed = x-340 % 359;
      int SLight = x % 55;
      int SDark = x-75 % 100;
      //      int Yellow


      fill(x % 359, SDark, BLight);
      rect(width/2, height/2, x, x); //center
      //      rect(width/2, height/2, x, x); 

      fill(HGreen, SDark, BLight);
      rect(width, height, x, x);//Bottom Right rectangles

      fill(HOrange, SDark, BLight);
      rect(width, 0, x, x); // Top Right rectangles

      fill(HBlue, SDark, BLight);
      rect(0, height, x, x); // Bottom Left rectangles

      fill(HRed, SDark, BLight);
      rect(0, 0, x, x); // Top Left rectangles
    }
  }
}
//}
