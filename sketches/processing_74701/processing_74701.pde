
PImage myImg;
  
  
  
void setup (){
  size (1000,1500);
  
  myImg=loadImage ("snoopy1.jpg");
  imageMode(CENTER);
   background(255);
}
  
void draw (){
  
for(int i=0;i<10;i++){
   pushMatrix();
    translate (i*300,100);
    imageFlip(myImg,200,200,"h");
        
   rotate (radians (45));
    image(myImg,100,100);
    
      popMatrix();
        
        
}
    
    
for(int i=0;i<10;i++){
 pushMatrix();
  translate (i*300,0);
    imageFlip(myImg,200,200,"h2");
        
   //rotate (radians (45));
    image(myImg,100,100);
    
     popMatrix();
}
  
for(int i=0;i<10;i++){
 pushMatrix();
  translate (i*300,300);
    imageFlip(myImg,200,200,"v2");
        
   //rotate (radians (45));
    image(myImg,100,100);
    
     popMatrix();
}
  
  
for(int i=0;i<10;i++){
 pushMatrix();
  translate (i*300,600);
    imageFlip(myImg,200,200,"v2");
        
   rotate (radians (45));
    image(myImg,100,100);
    
     popMatrix();
       
       
}
  
for(int i=0;i<10;i++){
 pushMatrix();
  translate (i*300,800);
    imageFlip(myImg,200,200,"h2");
        
   rotate (radians (90));
    image(myImg,100,100);
    
     popMatrix();
   }
for(int i=0;i<10;i++){
 pushMatrix();
  translate (i*300,1000);
    imageFlip(myImg,200,200,"h");
        
   rotate (radians (45));
    image(myImg,100,100);
    
     popMatrix();}
  
  
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


