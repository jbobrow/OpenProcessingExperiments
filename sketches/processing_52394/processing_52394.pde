


PImage laMusic;

void setup(){
  background(0);
  size(700,700);
  imageMode(CENTER);
 colorMode(HSB,360,100,100,100);

for(int i = 0;i < width;i++){
 float colorValue = map(i,0,width,0,360);
  stroke(colorValue,100,100,100);
 line(i,0,i,height);
}
  
  laMusic = loadImage("Wlly on Guitar without background - small.gif");




  
  for(int i = 0; i < 4; i++){
    pushMatrix();
    translate(i*200,300);
     if(i%2 == 0){
      
       
     //PIMI  
       imageFlip(laMusic,100,0,"v2");
     println("i%2 conditional: " + i);
   }else{
     //  
     rotate(radians(180));
       //PIGI
       imageFlip(laMusic,0,0,"v");
       imageFlip(laMusic,0,0,"h");
       
      
  
     }
    //PIII
    rotate(radians(180));
       imageFlip(laMusic,200,200,"h");
       
       
        //Pmm2
       imageFlip(laMusic,-100,300,"h2");
       imageFlip(laMusic,-100,300,"v2");
       
       
      //PII2
       imageFlip(laMusic,-100,125,"h");
       rotate(radians(180));
       imageFlip(laMusic,-100,125,"h");
      
      
      //PmG2
       rotate(radians(180));
       imageFlip(laMusic,100,400,"h2");
       imageFlip(laMusic,100,400,"h");
       imageFlip(laMusic,100,400,"v");
      
      
       //PmII
       rotate(radians(0));
       imageFlip(laMusic,50,200,"h2");
       
       
       
     
      
       
       
  
     
      
     
popMatrix();

}
}

void draw(){
  //int currentTime = second ();
  //println("mouseX: " + mouseX + "mouseY: " + mouseY);
  //print("seconds: " + currentTime);
  
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

