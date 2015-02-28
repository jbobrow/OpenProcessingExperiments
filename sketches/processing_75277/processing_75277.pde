
PImage prince; 

void setup() {
  size(800,1400);
  background(255);
  prince = loadImage("prince.jpeg");
  imageMode(CENTER);
}

void draw () {

 
for (int i=0; i<4; i++) {
  pushMatrix();
  translate(i*200+90,50); 
  image(prince,0,0);
  popMatrix();
  // First row fresh prince images
}

for (int i=0; i<4; i++) {
  pushMatrix();
  translate(i*200+90,180); 
  rotate(radians(i*180));
  image(prince,0,0);
  popMatrix();
  //fresh prince second row alternate 
 
}

for (int i=0; i<4; i++) {
  pushMatrix();
  translate(i*200+90,300); 
  rotate(radians(i*90));
   imageFlip(prince,0,0,"v");
  popMatrix();
  //fresh prince third row
}

for (int i=0; i<4; i++) {
  pushMatrix();
  translate(i*200+90,420); 
  imageFlip(prince,0,0,"v2");
  popMatrix();
  //fresh prince fourth row
}

for (int i=0; i<4; i++) {
  pushMatrix();
  translate(i*200+90,520); 
 imageFlip(prince,0,0,"h");
  popMatrix();
}

for (int i=0; i<4; i++) {
  pushMatrix();
  translate(i*200+90,610); 
imageFlip(prince,0,0,"h2");
  popMatrix();
}

for (int i=0; i<4; i++) {
  pushMatrix();
  translate(i*200+90,700); 
  image(prince,0,0);
  popMatrix();
}
}




//imageFlip function by nick lally
//paste function at the bottom of your sketch, and use like this: imageFlip(imageName,x,y,"mode")
//modes are "v", "v2", "h", "h2"
//"v" mirrors vertically, "v2" mirrors top half vertically
//"h" mirrors horizontally, "h2" mirrors left half horizontally
void imageFlip(PImage imageName, int xPos, int yPos, String mode){

 //records original pixel config so it can set it back at the end
 imageName.loadPixels();
 int ogImage[] = new int[imageName.width*imageName.height];
 for(int i = 0; i < imageName.width*imageName.height; i++){
   ogImage[i] = imageName.pixels[i];
 }
 imageName.updatePixels();

 //"v2" flips the top half of the image across the x-axis
 if(mode == "v2"){
   imageName.loadPixels();
   for(int i = 0; i < imageName.height; i++){
     for(int j = 1; j < imageName.width; j++){
       imageName.pixels[(imageName.height - 1 - i)*(imageName.width) + j] = imageName.pixels[i*(imageName.width) + j];
     }
   }
   imageName.updatePixels();
   image(imageName,xPos,yPos);

 //"v" flips the entire image across the x-axis
 }else if(mode == "v"){
   imageName.loadPixels();
   int tempImage[] = new int[imageName.width*imageName.height];
   for(int i = 0; i < imageName.width*imageName.height; i++){
    tempImage[i] = imageName.pixels[i];
   }

   for(int i = 0; i < imageName.height; i++){
     for(int j = 1; j < imageName.width; j++){
       imageName.pixels[(imageName.height - 1 - i)*(imageName.width) + j] = tempImage[i*(imageName.width) + j];
     }
   }
   imageName.updatePixels();
   image(imageName,xPos,yPos);

 //"h2" flips the left half of the image across the y-axis
 }else if(mode == "h2"){
   imageName.loadPixels();
   for(int i = 0; i < imageName.height; i++){
     for(int j = 1; j < imageName.width; j++){
       imageName.pixels[i*imageName.width + j] = imageName.pixels[(i+1)*(imageName.width) - j];
     }
   }
   imageName.updatePixels();
   image(imageName,xPos,yPos);

 //"h" flips the entire image across the y-axis
 }else if(mode == "h"){
   imageName.loadPixels();
   int tempImage[] = new int[imageName.width*imageName.height];
   for(int i = 0; i < imageName.width*imageName.height; i++){
    tempImage[i] = imageName.pixels[i];
   }
   for(int i = 0; i < imageName.height; i++){
     for(int j = 1; j < imageName.width; j++){
       imageName.pixels[(i+1)*(imageName.width) - j] = tempImage[i*imageName.width + j];
     }
   }
   imageName.updatePixels();
   image(imageName,xPos,yPos);
 } else {
   println("No mirror direction specified!");
   println("Use v, v2, h, or h2 for the 4th argument");
 }

 //resets image to original
 imageName.loadPixels();
 for(int i = 0; i < imageName.width*imageName.height; i++){
   imageName.pixels[i] = ogImage[i];
 }
 imageName.updatePixels();
}

