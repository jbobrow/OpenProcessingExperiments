

//images
PImage mapImage;
PImage bArt;
PImage eDwin;
PImage eUgene;
PImage sTanley;


void setup() {
  size(700, 900); //load size of screen
  mapImage = loadImage("map.jpg"); //load map background
  bArt = loadImage("BartTreiber.jpg");
  eDwin = loadImage("EdwinWheeler.jpg");
  eUgene = loadImage("EugeneWilliams.jpg");
  sTanley = loadImage("StanleyIvey.jpg");
  
  smooth();
  noStroke();  
}


void draw() {
  background(255);
  image(mapImage, 0, 0);
  fill (233, 37, 175);
  ellipse(487, 172, 18, 18); //Bart dot
  ellipse(475, 209, 18, 18); //Edwin dot
  ellipse(656, 221, 18, 18); //Eugene dot
  ellipse(471, 273, 18, 18); // Stanley dot
  
  //load images based on x and y coordinates
  
  if(mouseX == 487) {
    image (bArt, 200, 200);
  }
  
  if (mouseX == 475) {
    image(eDwin, 200, 200);
  }
  
  if (mouseX == 656) {
    image(eUgene, 200, 200);
  }   
 
   if (mouseX == 471) {
    image(sTanley, 200, 200);
  }


}

