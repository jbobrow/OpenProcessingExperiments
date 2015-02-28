
PImage snowysf;
PImage missionblue;
PImage snarlingfoxes;

void setup() {
  size(1400,450);
  smooth();
}

void draw() {
 
  
  
  // PMM2 photo of golden gate bridge
  
 snowysf = loadImage("snowysf.JPG");
 
 pushMatrix();
 translate(width/2, height/2);
 imageFlip(snowysf,-100,-223,"h");
 popMatrix();
 
 PImage snowysf;
 snowysf = loadImage ("snowysf.JPG");
image (snowysf, 0, 0);
  
  
  //P1G1 image of butterfly
  
  missionblue = loadImage("missionblue.png");
  

   pushMatrix();
  translate(-100,0);
  for(int i=0;i<width;i++){
    translate(390,0);
    imageFlip(missionblue,0,0,"v");
  }
  popMatrix();
  
  //pointsymmetry of foxes
  
  snarlingfoxes = loadImage("snarlingfoxes.png");
  
  pushMatrix();
  translate(width/2.5,height/2.5);
  for(int i=0;i<10;i++){
    rotate(radians(55));
    image(snarlingfoxes,0,0,150,150);
  }
  popMatrix();
   
   //P1M2 foxes in reflective water?
   
   pushMatrix();
  translate(0,200);
  for(int i=0;i<width;i++){
    translate(340,0);
    rotate(radians(180));
    imageFlip(snarlingfoxes,0,0,"v2");
  }
  popMatrix();
  
  //PMG2 headless foxes
  
   pushMatrix();
  translate(-100,200);
  for(int i=0;i<width;i++){
    translate(350,0);
    imageFlip(snarlingfoxes,0,0,"h2");
  }
  popMatrix();
  
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

