
PImage myimg;

void setup(){
  size(1000,1100);
  myimg = loadImage("key.png");
  imageMode(CENTER);
  background (202,201,193);
}

void draw(){
  //PII1
  for (int i = 0; i < 15; i++) {
   pushMatrix();
     translate(i*100+40,70);
     image(myimg,0,0);
   popMatrix();
  }
  
  //PII2
  for(int i = 0; i < 10; i++){
    pushMatrix();
      translate(i*100+40,190);
        if(i % 2 == 0){
        imageFlip(myimg,0,50,"v");
        } else {
          image(myimg,0,0);
        }
      popMatrix();
  }
  
  //PIGI
  for (int i = 0; i < 12; i++) {
     pushMatrix();
       translate(i*100+40,360);
          if(i % 2 == 1){
          translate(0,-3);
          rotate(radians(180));
          } else {
            rotate(radians(0));
          }
          image(myimg,0,0);
     popMatrix();
  }
  
  //PIMI
  for (int i = 0; i < 12; i++) {
   pushMatrix();
        translate(i*130+40,480);
        image(myimg,0,0);
        imageFlip(myimg,0,0,"v");
   popMatrix();
  }

  //PMM2
  for (int i = 0; i < 12; i++) {
  pushMatrix();
        translate(i, 575);
        translate(i*100, 20);
        if(i%2 == 0){
          rotate(radians(180));
          imageFlip(myimg, 0, 0, "v2");
        } else {
          imageFlip(myimg, 0, 0, "v2");
        }
        popMatrix();
        }
        
  //PM11
   for (int i = 0; i < 12; i++) {
     pushMatrix();
        translate(i*100, 0);
        imageFlip(myimg, 0, 700, "h2");
        popMatrix();
      }
  
  //PMG2
  for (int i = 0; i < 12; i++) {
   pushMatrix();
        translate(i*100+50,800);
        rotate (radians(90));
          if(i % 2 == 1){
     rotate(radians(360));
     imageFlip(myimg,0,0,"v");
   }else{
     image(myimg,0,0);
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


