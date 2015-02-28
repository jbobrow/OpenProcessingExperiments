
PImage dino;
int x,y;


void setup(){
  size(800,850);
  background(255);
  x = 0;
  y = 50;
  dino = loadImage("dinosaur.png");
    for(int i=0;i < 800;i += 100){
      x = i;
      image(dino,x,y);
  }
    for(int i=0;i < 800;i += 100){
      x = i;
      y = 150;
      image(dino,x,y);
      y = 210;
      imageFlip(dino,x, y,"v");
  }
    for(int i=0;i < 800;i += 100){
      x = i;
      y = 310;
      image(dino,x,y);
      x += -30;
      imageFlip(dino,x, y,"h");
  }
   for(int i=0;i < 800;i += 100){
      x = i;
      y = 410;
      image(dino,x,y);
      x += -30;
      imageFlip(dino,x, y,"h");
  }
  for(int i=0;i < 800;i += 100){
      x = i;
      y = 470;
      imageFlip(dino,x, y,"v");
  }
  for(int i=0;i < 800;i += 100){
    pushMatrix();
    x = i; 
    y = 260;
    x += 30;
    translate(800,800);
    rotate(radians(180));
    image(dino,x,y);
    popMatrix();
  }
  for(int i=0;i < 800;i += 200){
      x = i;
      y = 580;
      image(dino,x,y);
      x += 100;
      imageFlip(dino,x, y,"v");
  }
  
  for(int i=0;i < 800;i += 200){
      x = i;
      y = 680;
      image(dino,x,y);
  }
  
  for(int i=0;i < 800;i += 200){
      pushMatrix();
      translate(800,800);
      x = i;
      y = 40;
      rotate(radians(180));
      image(dino,x,y);
      popMatrix();
  }
  
  for(int i=0;i < 800;i += 200){
      x = i;
      y = 780;
      image(dino,x,y);
      x += -30;
      imageFlip(dino,x, y,"h");
  }
  
   for(int i=0;i < 800;i += 200){
      x = i;
      y = 780;
      image(dino,x,y);
      x += -30;
      imageFlip(dino,x, y,"h");
  }
  
  for(int i=0;i < 800;i += 200){
      x = i + 100;
      y = 780;
      imageFlip(dino,x, y,"v");
  }
  
   for(int i=0;i < 800;i += 200){
    pushMatrix();
    x = i + 30; 
    y = -50;
    translate(800,800);
    rotate(radians(180));
    image(dino,x,y);
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

 //resets image to original
 imageName.loadPixels();
 for(int i = 0; i < imageName.width*imageName.height; i++){
   imageName.pixels[i] = ogImage[i];
 }
 imageName.updatePixels();
}

