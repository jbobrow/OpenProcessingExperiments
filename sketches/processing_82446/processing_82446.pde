

PImage myImg;


void setup(){
size(600,800);
myImg = loadImage("kiss.gif");
imageMode(CENTER);
background(255);

}



void draw(){
  
  for(int i= 0; i < 620; i+= 100){
    imageFlip(myImg,i,50,"v2");
  } 
 
 pushMatrix(); 
  for(int i= 0; i < 620; i+= 100){
    imageFlip(myImg,i,150,"h");
  }
popMatrix();

pushMatrix();
  rotate(radians(45));
  for(int i= 0; i < 620; i+= 100){
  imageFlip(myImg,i,350,"h2");
  translate(0,-100);
  }
  
    popMatrix();
    
    pushMatrix();
    rotate(radians(45));
  for(int i= 0; i < 620; i+= 100){
  imageFlip(myImg,i,500,"h2");
  translate(0,-100);
  }
  popMatrix();
  
   pushMatrix();
    rotate(radians(315));
  for(int i= -450; i < 620; i+= 100){
  imageFlip(myImg,i,40,"v2");
  translate(0,100);
  }
  popMatrix();
  
  pushMatrix();
  for(int i= 0; i < 620; i+= 170){
  imageFlip(myImg,i,460,"h2");
  }
  
    popMatrix();
    
    
  
  pushMatrix();
  for(int i= 100; i < 620; i+= 170){
  imageFlip(myImg,i,490,"h2");
  }
  
    popMatrix();
    
    
     pushMatrix();
  for(int i= 0; i < 620; i+= 225){
  imageFlip(myImg,i,600,"h2");
  }
  
    popMatrix();
    
      pushMatrix();
  for(int i= 100; i < 620; i+= 225){
  imageFlip(myImg,i,560,"v");
  }
  
    popMatrix();
    
        pushMatrix();
  for(int i= 100; i < 620; i+= 225){
  imageFlip(myImg,i,560,"v");
  }
  
    popMatrix();
    
        pushMatrix();
  for(int i= 0; i < 620; i+=270){
  imageFlip(myImg,i,700,"v");
  }
  
    popMatrix();
    
           pushMatrix();
  for(int i= 140; i < 620; i+=270){
  imageFlip(myImg,i,700,"h2");
  }
  
    popMatrix();
    
    

  
  
  



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


  
  
  
  
  
  
  
  
  
  
  
  


