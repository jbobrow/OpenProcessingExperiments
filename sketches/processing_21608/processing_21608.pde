

// The statements in the setup() function 
// execute once when the program begins
//void setup() 
//{
  //size(200, 200);  // Size should be the first statement
  
  
  
PImage BRIAN2;



void setup() {
  size(429,600);
 



   
  
BRIAN2 = loadImage("BRIAN2.png");
//image(BRIAN2, 0, 0); 
image(BRIAN2, 0, 0);

translate(0, 0); //No symetry

imageMode(CORNERS);
for(int i = 0; i < 100; i ++) {
  pushMatrix();
 
 //imageFlip function:
 
  imageFlip(BRIAN2, 0, 0, "h2"); //"h2" mirrors left half horizontally
  //imageFlip(BRIAN1, 0, 0, "h2"); 
  popMatrix();

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

