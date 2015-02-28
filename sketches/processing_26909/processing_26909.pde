
//JoyLBrown
//Prince, Pi


PImage prince;
 
void setup(){
  size(800, 200);
  prince = loadImage("Prince.png");
  background(129,6,196);
   
 
  translate(0, width, height);
  imageMode(CENTER);
  for(int i = 0; i < 100; i++){
  // pma2 Has a glide reflection, with alternating vertical mirrors & 180 degree rotation
  pushMatrix();
    translate(100*i, 10);
    imageFlip(prince,300,600,"h2");
    image(prince,0,100,100,100);
    popMatrix();
     
  }
}
  
   
//void setup(){
  //size(600, 600);// Size should be the first statement
  //background(255);
  //image (name, x,y)
  //The "name" parameter must be a "PIamge" variable.
  //The "x" and "y" parameters set the position of the upper-left corners of the image.
  //rooster = loadImage("rooster.png");
  //image(rooster, 200, 200, 200, 200);//image(img, 20, 20, 60, 60)
//}
 
 
 
 
 
 
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

