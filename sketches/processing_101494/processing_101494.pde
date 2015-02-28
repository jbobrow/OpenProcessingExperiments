
//sort of DIAPORAMA

int compteur = 0;
PImage[] images = new PImage[5];// 5 or more or less due to your DATA folder

void setup() {
 
  size(900,600);
  frameRate(0.5);// speed 1 change the timerate  here between 0.01 and 10
  for(int i=0; i< images.length; i++) {
    images[i] = loadImage("image_" + i + ".png");
  }  

}

void draw() {
  // DIAPORAMASTUFF//////////////////////////////////////
  image( images[compteur], 0, 0);
  compteur++;
  if (compteur >= images.length) compteur = 0;
}

void keyPressed()
{
   println(key);
  if (key =='s');// pour sauvegarder l image
saveFrame("pict######.png");
}


