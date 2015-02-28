
PImage imageName;

void setup(){
  size(600,600);
  background(129,81,79);
  smooth();
  noStroke();
  imageName = loadImage("mouthman.jpg");
  
}


void draw(){
  //P111
  for(int i = 1; i < 645; i++){
    if ( i % 44 ==0){
      image(imageName, i-44, 0);
    }
  }
  
  //P1G1
  for(int j = 1; j < 660; j++){
    if (j % 44 ==0){
      image (imageName, j-44, 95);
      imageFlip(imageName,j-44,60,"v");
    }
  }
  
  //PM11
  for(int k = 1; k < 660; k++){
    if (k % 44 ==0){
      imageFlip (imageName, k-44, 140 ,"h2");
    }
  }
  
  //PMM2
  for(int l = 1; l < 660; l++){
    if(l % 44 ==0){
     imageFlip (imageName, l-46, 265, "h2");
    }
  }
  
  for(int m = 1; m < 800; m++){
      if(m % 44 ==0){
        pushMatrix();
        translate(660,265);
        rotate(radians(180));
        imageFlip (imageName, m-44, 0, "h2");
        popMatrix();
      }   
  }

  //P112
  for(int n = 1; n < 800; n++){
    if(n % 44 ==0){
      image(imageName, n-22, 350);
    }
  }
  for(int o = 1; o < 800; o++){
    if(o % 44 ==0){
      pushMatrix();
      translate(660,350);
      rotate(radians(180));
      image(imageName, o-45, 0);
      popMatrix();
    }
  }
  
  //P1A1
  for(int p = 1; p < 800; p++){
    if(p % 88 ==0){
      image(imageName, p-47, 390);
    }
  }
  for(int q = 1; q < 800; q++){
    if(q % 88 ==0){
      pushMatrix();
      translate(660,390);
      rotate(radians(180));
      image(imageName, q, -35);
      popMatrix();
    }
  }
  
  //PMA2
  for(int r = 1; r < 800; r++){
    if(r % 88 ==0){
      imageFlip(imageName, r-47, 440,"h2");
    }
  }
  for(int t = 1; t < 800; t++){
    if(t % 88 ==0){
      pushMatrix();
      translate(660,440);
      rotate(radians(180));
      imageFlip(imageName, t, -35,"h2");
      popMatrix();
    }
  }


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

