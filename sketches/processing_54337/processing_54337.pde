
PImage coke;
int x,y;
 
 
void setup(){
  size(1000,2000);
  background(255);
  x = 0;
  y = 0;
 coke = loadImage("coke.png");
 
 
    for(int i=0;i < 800;i += 150){
      x = i;
      image(coke , x , y);
  }
    for(int i=0;i < 800;i += 150){
      x = i;
      y = 0;
      image(coke,x,y);
      y = 820;
      imageFlip(coke,x, y,"v");
  }
  for(int i=0;i < 800;i += 150){
      x = i;
      y = 550;
      imageFlip(coke,x, y,"h2");
  
  }     
       for(int i=0;i < 800;i += 300){
      x = i;
      y = 1100;
      image(coke,x,y);
      x += 100;
      imageFlip(coke,x, y,"v2");
  }
  for(int i=0;i < 800;i += 170){
    pushMatrix();
    x = i;
    y = 240;
    x += 107;
    translate(1000,800);
    rotate(radians(180));
    image(coke,x,y);
    popMatrix();

  }

  
    
}
 
 
 
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
}


