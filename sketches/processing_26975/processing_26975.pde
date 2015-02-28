
int maxImages = 22;
int ImageIndex = 0;
PImage [] images = new PImage [maxImages]; // declare and init array

void setup (){
  size(490,550);
  // Load images into the array
images[0] = loadImage("humanroid0.png"); 
images[1] = loadImage("humanroid1.png"); 
images[2] = loadImage("humanroid2.png"); 
images[3] = loadImage("humanroid3.png"); 
images[4] = loadImage("humanroid4.png");
images[5] = loadImage("humanroid5.png");
images[6] = loadImage("humanroid6.png");
images[7] = loadImage("humanroid7.png");
images[8] = loadImage("humanroid8.png");
images[9] = loadImage("humanroid9.png");
images[10] = loadImage("humanroid10.png");
images[11] = loadImage("humanroid11.png");
images[12] = loadImage("humanroid12.png");
images[13] = loadImage("humanroid13.png");
images[14] = loadImage("humanroid14.png");
images[15] = loadImage("humanroid15.png");
images[16] = loadImage("humanroid16.png");
images[17] = loadImage("humanroid17.png");
images[18] = loadImage("humanroid18.png");
images[19] = loadImage("humanroid19.png");
images[20] = loadImage("humanroid20.png");
images[21] = loadImage("humanroid21.png");


}

void draw (){
  
 image(images[ImageIndex],0,0); 
ImageIndex = int(map(mouseX,0,width,0,images.length));
println(ImageIndex);
}



