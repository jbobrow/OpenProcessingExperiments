
PImage img; 
PImage img2; 
PImage img3; 



//____________________________________________________________________________

//Position der Schwalbe
int xPos = 55;
int yPos = 400;

//Richtung der Bewegung der Schwalbe - Schnelligkeit
int dirX = 3;
int dirY = 2;


//____________________________________________________________________________
void setup() {
  size(800, 500);
  smooth();
  
  noCursor();

  img = loadImage ("BerlinerMauer.jpg");
  
  img2 = loadImage ("Schwalbe1.png");
  img3 = loadImage ("weltkarte.gif");

}


//_____________________________________________________________________________
void draw() {
  //Berliner Mauer
  imageMode(CORNER);
  image(img, 0, 0);

  imageMode(CENTER);
  //Schwalbe
  image(img2, xPos, yPos, 160, 100);

  if (xPos > 570 || xPos < 0) {
    dirX = dirX * -1;
  }

 /* if (yPos > 450 || yPos <240) {
   dirY = dirY* -1;
  }
  */


  xPos = xPos + dirX;
 // yPos = yPos + dirY;

  if (mousePressed) {

    //Weltkarte
    imageMode(CORNER);
    image (img3, 0, 0, 800, 540);

    //Schwalbe
    imageMode(CENTER);
    image (img2, mouseX,mouseY, 80, 50);
 
    
  }
}


