
//Levi Mousaw 
//image load
PImage snail; 

void setup(){
  size(1000,800);
  snail = loadImage("snail.png");
  background(255);
  imageMode(CENTER);

//for (int i = -100; i <width; i +=95){
//  snail = loadImage("snail.png");
//  image( snail, i,0);
 }

void draw(){
  //P111
  for (int i = 0; i < 12; i++) {
   pushMatrix(); 
        translate(i*100+50,25);
        image(snail,0,0);
   popMatrix();
  }
  
  
 //P112 
  for (int i = 0; i < 12; i++) {
     pushMatrix(); 
          translate(i*100+50,125);
          if(i % 2 == 1){
            rotate(radians(180));
          } else {
            ;
          }
          image(snail,0,0);
     popMatrix();
  }
  //P1G1
    for (int i = 0; i < 12; i++) {
     pushMatrix();
       translate(i*100+50,225);
       imageFlip(snail,0,0,"v");
     popMatrix();
  }
 //p1M1 
  for (int i = 0; i < 12; i++) {
   pushMatrix(); 
        translate(i*100+50,325);
        image(snail,0,0);
        imageFlip(snail,0,0,"v");
   popMatrix();
  }
  
  //PMM2
  for (int i = 0; i < 12; i++) {
   pushMatrix(); 
        translate(i*100+25,425);
        if(i % 2 ==2){
          image(snail,0,0);
            translate(0,65);
            rotate (radians(180));
         imageFlip(snail,0,0,"h");
          translate(0,65);
        } else {
          imageFlip(snail,0,0,"h");
            translate(0,65);
            rotate (radians(180));
          imageFlip(snail,0,0,"v");
         }
      popMatrix();
  }
  
  //PM11
   for (int i = 0; i < 12; i++) {
   pushMatrix(); 
        translate(i*100+50,600);
        rotate (radians(90));
        image(snail,0,0);
        imageFlip(snail,0,0,"v");
   popMatrix();
  }
  
   //PMG2
   for (int i = 0; i < 12; i++) {
   pushMatrix(); 
        translate(i*100+50,700);
        rotate (radians(90));
          if(i % 2 == 1){
     rotate(radians(180));
     imageFlip(snail,0,0,"v");
   }else{
     image(snail,0,0);
   }
      //image(snail,0,0);
      imageFlip(snail,0,0,"v");
   popMatrix();
   }
 //*
   
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






