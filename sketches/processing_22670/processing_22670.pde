
PImage img;

 
void setup(){
  size(790,550);
  smooth();
   
}
 
void draw(){
  background(255);
  img = loadImage("money.jpg");

   
//P1G1 glide reflection??
  pushMatrix();
  translate(95,150);
  for(int i=0;i<5;i++){
    rotate(radians(180));
    image(img,0,0,100,150);
  }
  popMatrix();


  pushMatrix();
  translate(295,150);
  for(int i=0;i<5;i++){
    rotate(radians(180));
    image(img,0,0,100,150);
  }
  popMatrix();
  
  pushMatrix();
  translate(495,150);
  for(int i=0;i<5;i++){
    rotate(radians(180));
    image(img,0,0,100,150);
  }
  popMatrix();
  
  pushMatrix();
  translate(695,150);
  for(int i=0;i<5;i++){
    rotate(radians(180));
    image(img,0,0,100,150);
  }
  popMatrix();
  
  //P111 no rotation or reflection
  
  pushMatrix();
  translate(150,305);
  for(int i=0;i<1;i++){
    rotate(radians(90));
    image(img,0,0,100,150);
  }
  popMatrix();
  
  pushMatrix();
  translate(300,305);
  for(int i=0;i<1;i++){
    rotate(radians(90));
    image(img,0,0,100,150);
  }
  popMatrix();
  
  pushMatrix();
  translate(450,305);
  for(int i=0;i<1;i++){
    rotate(radians(90));
    image(img,0,0,100,150);
  }
  popMatrix();
  
  pushMatrix();
  translate(600,305);
  for(int i=0;i<1;i++){
    rotate(radians(90));
    image(img,0,0,100,150);
  }
  popMatrix();
  
  pushMatrix();
  translate(750,305);
  for(int i=0;i<1;i++){
    rotate(radians(90));
    image(img,0,0,100,150);
  }
  popMatrix();
  
//P112 horizontal mirror  

  pushMatrix();
  translate(150,425);
  for(int i=0;i<1;i++){
    rotate(radians(90));
    image(img,0,0,100,150);
  }
  popMatrix();
  
  pushMatrix();
  translate(150,525);
  for(int i=0;i<1;i++){
    rotate(radians(270));
    image(img,0,0,100,150);
  }
  popMatrix();
  
  pushMatrix();
  translate(450,425);
  for(int i=0;i<1;i++){
    rotate(radians(90));
    image(img,0,0,100,150);
  }
  popMatrix();
  
  pushMatrix();
  translate(450,525);
  for(int i=0;i<1;i++){
    rotate(radians(270));
    image(img,0,0,100,150);
  }
  popMatrix();
  
  pushMatrix();
  translate(750,425);
  for(int i=0;i<1;i++){
    rotate(radians(90));
    image(img,0,0,100,150);
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

