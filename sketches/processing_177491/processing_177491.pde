
//Working with images in Processing

//Global Variables
color[] palette1 = 
{#FFE049, #E88D42, #FF566D, #9E42E8, #498AFF};
int PImage;


//Declare a PImage variable Type
PImage fondo, imagen1, imagen2, imagen3, imagen4, imagen5;


//Load an image file
void setup () {
  size(820, 600);
  colorMode(HSB, 200, 100, 100);
  noFill();
  fondo = loadImage("fondo.jpg");
  background(fondo);
  imagen1 = loadImage("imagen1.jpg");
  imagen2 = loadImage("imagen2.JPG");
  imagen3 = loadImage("imagen3.JPG");
  imagen4 = loadImage("imagen4.jpg");
  imagen5 = loadImage("imagen5.JPG");
}

    //Shape()
void mouseMoved () {
  strokeWeight(random(4));
  stroke(palette1[int(random(1, 5))]);
  rect(70, 15, random(50), random(50));
  rect(200, 15, random(50), random(50));
  rect(320, 15, random(50), random(50));
  rect(440, 15, random(50), random(50));
  rect(570, 15, random(50), random(50));
  rect(700, 15, random(50), random(50));
  rect(15, 100, random(50), random(50));
  rect(15, 260, random(50), random(50));
  rect(15, 425, random(50), random(50));
  rect(755, 100, random(50), random(50));
  rect(755, 260, random(50), random(50));
  rect(755, 425, random(50), random(50));
  rect(70, 505, random(50), random(50));
  rect(200, 505, random(50), random(50));
  rect(320, 505, random(50), random(50));
  rect(440, 505, random(50), random(50));
  rect(570, 505, random(50), random(50));
  rect(700, 505, random(50), random(50));
  }
  
  

  //Input Image()
  void draw () {
  if(keyPressed) {
     if (key == '1') {
     image(imagen1, 70, 70, 200, 200);
     }
  }
  if(keyPressed) {
     if (key == '2') {
     image(imagen2, 550, 70, 200, 200);
     }
  }
   if(keyPressed) {
     if (key == '3') {
     image(imagen3, 70, 300, 200, 200);
     }
  }
   if(keyPressed) {
     if (key == '4') {
     image(imagen5, 550, 300, 200, 200);
     }
  }
  if(keyPressed) {
     if (key == '5') {
     image(imagen4, 285, 145, 250, 250);
     }
  }
 

  }

  

