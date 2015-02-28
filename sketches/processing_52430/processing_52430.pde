
//Kelly Fadem
//Assignment 4 Images


//heart image
PImage heart;
int x;
int y;

//set up
void setup (){
  size (800,800);
  background (232,129,209);
  x=0;
  y=0;
  heart = loadImage("heart.png");
  
  //p111
    for (int i = 0; i < 800; i = i+55){
      x = i;
      image(heart, x, y);
    }
    
  //p1m1
    for (int i = 0; i <800; i = i+55){
      x = i;
      y = 70;
      image(heart, x, y);
      y = 122;
      imageFlip(heart, x, y, "v");
    }
    
  //pm11
    for (int i = 0; i <800; i = i+110){
      x = i;
      y = 200;
     image(heart, x, y);
    }
    for (int i = 0; i <800; i = i+110){
      x = i-53;
      y = 200;
      imageFlip(heart, x, y, "h");
    }
 
  //pmm2
    for (int i = 0; i <800; i += 110){
      x = i;
      y = 270;
      image(heart, x, y);
      x += -55;
      imageFlip (heart, x, y, "h");
    }
    for (int i = 0; i < 800; i += 110){
      x = i;
      y = 325;
      imageFlip (heart, x, y, "v");
    }
    for (int i = 0; i <800; i += 110){
      pushMatrix();
      x = i;
      y = 410;
      x += 12;
      translate(800, 800);
      rotate(radians(180));
      image(heart, x, y);
      popMatrix();
    }
     //p1a1
     for (int i = 0; i <800; i = i+110){
      x = i;
      y = 550;
      image(heart, x, y);
      x = i+55;
      y = 550;
      imageFlip(heart, x, y, "v");
    }
    //p112 i keep getting the message "unreachable code" so I can't get it to run but I think this is really close to correct...
    //for (int i = 0; 1 <800; i = i+110){
      //x = i;
      //y = 610;
      //image(heart, x, y);
   // }
    //for (int i = 0; 1 <800; i = i+110){
      //pushMatrix();
      //translate(800, 800);
      //x = i;
      //y = 40;
      //rotate(radians(180));
      //image(heart, x, y);
      //popMatrix();
    //}
     //pma2
     for (int i = 0; i <800; i = i+210){
      x = i;
      y = 620;
      image(heart, x, y);
      x = i+50;
      y = 620;
      imageFlip(heart, x, y, "v");
    }    
     for (int i = 0; i <800; i = i+210){
      x = i+155;
      y = 620;
      image(heart, x, y);
      x = i+105;
      y = 620;
      imageFlip(heart, x, y, "v");
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

