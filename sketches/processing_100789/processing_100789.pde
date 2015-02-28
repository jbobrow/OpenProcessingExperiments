
int compteur = 0;
PImage[] images = new PImage[10]; // 10 means YOUR 10 pictures,can be more or less

void setup() {
 
  size(1400,1000);
  frameRate(15);
  
  for(int i=0; i< images.length; i++) {
   // images[i] = loadImage("image_" + i + ".jpg");//your pictures here via data folder
      images[i] = loadImage("image_" + i + ".jpg");//your pictures here via data folder
   
      
  }  
}

void draw() {
  image( images[compteur],mouseX,mouseY,random(0,50),random(0,50));
  compteur++;
  if (compteur >= images.length) compteur = 0;
 
}

void keyPressed()
{
   println(key);
  if (key =='s');// pour sauvegarder l image
saveFrame("pict######.png");
}


