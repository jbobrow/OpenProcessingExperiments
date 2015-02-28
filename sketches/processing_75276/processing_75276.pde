
PImage planchaso;

void setup(){
  size (800,800);
  background( 79, 207, 204);
  
  planchaso = loadImage ("planchaso.gif");
  
}



void draw(){
  scale(0.38);
  
  //PIII
    for(int i = 0; i < 5; i++){
    pushMatrix();
    translate(i*410,150);
    image(planchaso, i,-300);
    popMatrix();
    textSize(50);
  text("PIII", 25, 50);
    }
    
    //PIMI
    for(int i = 0; i < 5; i++){
    pushMatrix();
    translate(i*410,150);
    imageFlip(planchaso,i,-150,"v");
    image(planchaso, i,-150);
    popMatrix();
    textSize(50);
  text("PIMI", 25, 250);
     }
     
     
     //PIGI
      for(int i = 0; i < 5; i++){
    pushMatrix();
    translate(i*400,150);
    if( i % 2 == 0){
    imageFlip(planchaso,i, 120,"v");
      } else {
        image(planchaso, i, 120);
      }
    popMatrix();
    textSize(50);
  text("PIGI", 25, 550);
      }
     
     //PMM2
    for(int i = 0; i < 5; i++){
    pushMatrix();
    translate(i*400,150);
      if( i % 2 == 0){
    imageFlip(planchaso,i,450,"v2");
   
      } else {
        imageFlip(planchaso,i, 450,"h");
       
      }
    popMatrix();
    textSize(50);
  text("PMM2", 25, 950);
     }
     
      //PII2
     for(int i = 0; i <5; i++){
     pushMatrix();
    translate(i*410,150);
     if(i%2==0){
       imageFlip(planchaso, i, 720, "v");
       rotate(PI/.2);
     }else{
       imageFlip(planchaso, i, 720, "h");   
     }
     popMatrix();
      textSize(50);
  text("PII2", 25, 1250);
    }
     
      
    //PMII
    for(int i = 0; i <5; i++){
     pushMatrix();
    translate(i*410,150);
     imageFlip(planchaso, i, 980, "h2");
     popMatrix();
      textSize(50);
  text("PMII", 25, 1400);
    }
    
     //PMG2
     for(int i = 0; i <30; i++){
     pushMatrix();
    translate(i*160,1400);
      if(i%2==0){
       rotate(radians(90));
       imageFlip(planchaso, i, 1680, "h2");
      } else {
      rotate(radians(90));
       imageFlip(planchaso, i, 1680, "h2");   
      }
     popMatrix();
      textSize(50);
  text("PMG2", 25, 1550);
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

