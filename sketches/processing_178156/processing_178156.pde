
//working with images:processing
//Declare a PImage variable type
PImage IMG_3251;
//load an imag file from HDD
/*don't forget to add the file
 to your sketch "data" folder*/
 void setup() {
   //ColorMode(mode, redRange, greenRange, blueRange);
   
   size(1000, 600);

   colorMode(HSB);
   colorMode(HSB, width, height, 100);
   background(random(width), random(height), random(100) );
   IMG_3251 = loadImage("IMG_3251.jpg");
   //noLoop
   
 }
   //Draw the image to the screen at (0,0)
      void draw() {
     image(IMG_3251, 0, 0);
     translate(mouseX, mouseY);
     stroke (255);
     strokeWeight(2);
     fill(mouseY, mouseX, 75);
     beginShape();
      vertex(0, -50);
  vertex(14, -20);
  vertex(47, -15);
  vertex(23, 7);
  vertex(29, 40);
  vertex(0, 25);
  vertex(-29, 40);
  vertex(-23, 7);
  vertex(-47, -15);
  vertex(-14, -20);
  endShape(CLOSE);
    
     
     
     
     
   }


