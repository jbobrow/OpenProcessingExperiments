
//I basically just used the notes I had from the class lesson, and your imageFlip code
PImage WoodStock;
void setup(){
  size(800,400);
  background(255,0);
  imageMode(CENTER);
  WoodStock=loadImage("WoodStock.jpg");
//first line, P111
    for(int i = 0; i <4; i++){
      pushMatrix();
      translate(i*200+100,300);
      image(WoodStock,0,-275);
      popMatrix();
    }
//second line, P1G1
    for(int i = 0; i <4; i++){
      pushMatrix();
      translate(i*200+100,300);
      if(i%2 == 0){
        imageFlip(WoodStock,0,-220,"v");
      } else {
        image(WoodStock,0,-220);
      }
      popMatrix();
    }
 //third line, PMM2 FIX
    for(int i = 0; i <4; i++){
      pushMatrix();
      translate(i*200+100,135);
      if(i%2 == 0){
        imageFlip(WoodStock,0,0,"v2");
      } else {
        rotate(radians(180));
        imageFlip(WoodStock,0,0,"v2");
      }
      popMatrix();
    }
 //fourth line, P112
    for(int i = 0; i <4; i++){
      pushMatrix();
      translate(i*200+100,195);
      if(i%2 == 0){
        image(WoodStock,0,0);
      } else {
        rotate(radians(180));
        image(WoodStock,0,0);
      }
      popMatrix();
    }
//fifth line, P1M1
    for(int i = 0; i <4; i++){
      pushMatrix();
      translate(i*200+100,250);
      imageFlip(WoodStock,0,0,"v2");
      popMatrix();
    }
//sixth line, PM11
    for(int i = 0; i <4; i++){
      pushMatrix();
      translate(i*200+100,310);
      imageFlip(WoodStock,0,0,"h2");
      popMatrix();
    }
//seventh line, PMG2
     for(int i = 0; i <4; i++){
      pushMatrix();
      translate(i*200+100,370);
      if(i%2 == 0){
        imageFlip(WoodStock,0,0,"v2");
      } else {
        rotate(radians(180));
        imageFlip(WoodStock,0,0,"h2");
      }
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

