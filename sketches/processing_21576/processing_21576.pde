
//Symmetry ice cream cones
//by Nicky Silber

PImage cone;
PImage coneSmall;

void setup(){
  size(800,600);
  smooth(); 
  
}

void draw(){
  background(#E87CB8);
  cone = loadImage("ice_cream_cone_small_flipped.png");
  coneSmall = loadImage("ice_cream_cone_smaller_flipped.png");
  colorMode(HSB,360,100,100);
  
  //point symmetry ice cream cones in the center
  //a C11 shape, maybe?
  pushMatrix();
  translate(width/2,height/2);
  for(int i=0;i<11;i++){
    rotate(radians(35));
    tint(i*38,80,100);
    image(cone,0,0,89,150);
  }
  popMatrix();
  
  //first row of transparent cones
  //glide reflection, also known as P1G1
  pushMatrix();
  translate(-100,0);
  tint(0,0,100,60);
  for(int i=0;i<width;i++){
    translate(80,0);
    imageFlip(coneSmall,0,0,"v");
  }
  popMatrix();
  
  //second row of transparent cones
 //a relfection known as a P1M1 
  pushMatrix();
  translate(-100,150);
  tint(0,0,100,60);
  for(int i=0;i<width;i++){
    translate(80,0);
    imageFlip(coneSmall,0,0,"v2");  
  }
  popMatrix();
  
  
  //third row of transparent cones
  //reflected horizontally and vertically wiht 180 degree rotation
  //PMM2
  pushMatrix();
  translate(-100,300);
  tint(0,0,100,60);
  for(int i=0;i<width;i++){
    translate(100,0);
    imageFlip(coneSmall,0,0,"h");
  }
  popMatrix();


//fourth row of transparent cones
//reflected vertically and horizontally, with a 180 degree rotation
//and a possible glide reflection
//PMG2
  pushMatrix();
  translate(-100,450);
  tint(0,0,100,60);
  for(int i=0;i<width;i++){
    translate(100,0);
    imageFlip(coneSmall,0,0,"h2");
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

