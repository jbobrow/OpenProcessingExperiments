
// Declaring a variable of type PImage+deux paintures petite et grande en une 
PImage img;	

void setup() {
  size(320, 320);
  // Make a new instance of a PImage by loading an image file
  img = loadImage("gbor01.jpg");


}

void draw() {
  background(0);
  // Draw the image to the screen at coordinate (0,0)

  //image devient sombre sinon 255 =transparence, 
  //quatrième chiffre 200, c'est l'alpha
 
  image(img, 0, 0);//big image
   //image(img, 0, 0,width/2, height/2);//small image

}

//SCREENSHOT STUFF///////////////////////////////////////////////////////////////
void keyPressed()
{
   println(key);
  if (key =='s');// pour sauvegarder l image
saveFrame("pict######.png");

}


