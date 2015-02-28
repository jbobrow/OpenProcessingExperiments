
//Homework #4 - Translations
//James Kim
PImage pp2;
float x,y;
float dx,dy;
float easing;

void setup(){
  size(800,500);
  pp2 = loadImage("pp2.png");
  smooth();
  image(pp2,0,0);
  x=0;
  y=0;
  easing=.01;
  
}

void draw(){
  background(255);
    
  //moving tri. (easing)
    dx=mouseX-x;
    dy=mouseY-y;
    x=x+dx*easing;
    y=y+dy*easing;
    image(pp2,x,y,100,100);
  //P111
  for(int i=0;i<width;i+=100){
    image(pp2,i,50,100,100);
  }
  //P112
  for(int i=0;i<width;i+=100){
    image(pp2,i,150,100,100);
    imageFlip(pp2,i,900,"v");
  }
  //PM11
  for (int i=0;i<width; i+=100){
  image(pp2,i,250,100,100);
  imageFlip(pp2,i,900,"h");
  }
  //PMM2
  for (int i=0;i<width;i+=50){
    image(pp2,i,350,100,100);   
  } 
}
    
  
  
  
  
//imageFlip function by nick lally
//paste function at the bottom of your sketch, and use like this: imageFlip(imageName,x,y,"mode")
//modes are "v", "v2", "h", "h2"
//"v" mirrors vertically, "v2" mirrors top half vertically
//"h" mirrors horizontally, "h2" mirrors left half horizontally
void imageFlip(PImage imageName, int xPos, int yPos, String mode){
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

