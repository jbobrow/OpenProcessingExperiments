


 PShape innerwhites;
 PImage wrinkles;
 PImage lens;
 PImage bagsright;
 PImage bagsleft;
 PImage veins;
 PImage glasseswood;
 PImage glassespearl;
 PImage glassesyellow;
 PImage brow;
 PImage time;
 

 
 float shades = 0;
 float pupilX = map(mouseX, 0, width, 125,269); 
 float pupilY = map(0, 0, height, 286,213);
 float pupilXX = map(mouseX, 0, width, 400, 475);
 float pupilYY = map(0,0, height, 230,225);

   
void setup() {
  smooth();
  background(0);
  size(640, 480);

 bagsright = loadImage("bagsright.png");
 bagsleft = loadImage("bagsleft.png");
 veins = loadImage ("veins.png");
 glasseswood = loadImage("glasseswood.png");
 glassespearl = loadImage("glassespearl.png");
 glassesyellow = loadImage("glassesyellow.png");
 innerwhites = loadShape("eyewhite.svg");
 wrinkles = loadImage("wrinkles.png");
 lens = loadImage("shades2.png");
 brow = loadImage ("brow.png");
 time = loadImage ("time.png");

  

  
}



void draw() {
  
  // brows draw white
    strokeWeight(.75);
    stroke(255);
    line(mouseX, pmouseY, pmouseX, mouseY);
    
         
    image(brow, 0,0);
  
  
  shape(innerwhites, 0,0);
 
  

  
// veins

if (mouseY > 211 && mouseY < 250) {
  if (mouseX > 350 && mouseX < 513 || mouseX > 115 && mouseX < 268) {
    image(veins, 0,0);
  }
}


 
// makin the pupils follow the cursor
  
  float pupilX = map(mouseX, 0, width, 185,205); 
  float pupilY = map(0, 0, height, 230,225);
  
  fill (#54AEB5);
  noStroke();
  ellipse(pupilX, pupilY, 65, 65);
  fill(0);
  ellipse(pupilX, pupilY, 30, 30);
  
  float pupilXX = map(mouseX, 0, width, 432, 455);
  float pupilYY = map(0,0, height, 230,225);
  
  fill (#54AEB5);
  noStroke();
  ellipse(pupilXX, pupilYY, 65, 65);
  fill(0);
  ellipse(pupilXX, pupilYY, 30, 30);
  




 // makin the bags form if click around eye /// stay once clicked**
 
 if (mouseY > 154 && mouseY < 315)  {  
 if (mouseX > 115 && mouseX < 268)  {
 image(bagsleft, 0,0);

   }
} 
  

if (mouseY > 154 && mouseY < 315 ) {
 if (mouseX > 350 && mouseX < 513) {
  image(bagsright, 0,0);

 }
}
   
 // wrinkles

if (mouseY > 211 && mouseY < 250  || mouseX > 513 && mouseX < 115 ) {
  
    image(wrinkles, 0,0);
 
}

// glasses
 
if (keyPressed) {
  if ((key == 'a') || (key == 'A')) {
 image(glassespearl, 0,0);
}
if ((key == 'g') || (key == 'G')) {
 image(glasseswood, 0,0);
}
if ((key == 'e') || (key == 'E')) {
  image(glassesyellow, 0,0);
}
if (key == ' ') {
  image(time, 0,0);
   }
}

}





 



