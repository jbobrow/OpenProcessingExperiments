
PImage myImg;
PImage myNose;
PImage myNipple;
PImage myHands;
PImage myEar;
PImage myThumb;
PImage myMouth;

void setup(){
  size (1200,900);
  background(0);
  imageMode(CENTER);
  myHands= loadImage("2.gif");
  myNose= loadImage("250px-Neus1.gif");
  myNipple= loadImage("Human_nipple.gif");
  myEar= loadImage("ear-nose-throat.gif");
  myThumb= loadImage("Clubbed_thumb.gif");
  myMouth= loadImage("837375_mouth.gif");
}

void draw(){
  
//PIII  
  for(int i=0;i<1200;i++){
   pushMatrix();
   translate(i*100,270);
   image(myNipple,i,0);
   popMatrix();
  }
  
//PIMI  
  for(int i=0;i<1200;i++){
   pushMatrix();
   translate(i*80,160);
   imageFlip(myNose,i,0,"v2"); 
   popMatrix();
  }
    
 //PMII
 for(int i=0;i<1200;i++){
   pushMatrix();
   translate(i*100,50);
   image(myNose,0,0);
   imageFlip(myNose,0,0,"h2");
   
   popMatrix();
   } 
   
 // PMG2 
  
   for(int i=0; i<1200; i++){
     pushMatrix();
    translate(i*50,360);
   imageFlip(myHands,i*100,0,"h");
   imageFlip(myHands,i*100,100,"v");
   
   popMatrix(); 
}

//PMM2 

   for(int i=0; i<1200; i++){
     pushMatrix();
    translate(i*90,540);
    image(myEar,0,0);
    imageFlip(myEar,30,0,"h");
    translate(30,60);
    rotate(radians(180));
    image(myEar,0,0);
     imageFlip(myEar,30,0,"h");
   popMatrix(); 
}

//PIMI

 for(int i=0; i<1200; i++){
     pushMatrix();
    translate(i*50,660);
    rotate(radians(90));
    image(myThumb,0,0);
    imageFlip(myThumb,0,0,"h");
   popMatrix(); 
 }
//PIGI
 for(int i=0; i<1200; i++){
     pushMatrix();
    translate(i*110,750);
    image(myMouth,0,0);
    translate(50,0);
    rotate(radians(180));
    image(myMouth,0,0);
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

