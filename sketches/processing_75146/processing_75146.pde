
//Alex Zajicek, Catterns, Hw #5

PImage myImg;

void setup(){
  size(1000, 900);
  background(255);
  myImg = loadImage("ginger-catEdit2.png");
  imageMode(CENTER);
  smooth();
}

void draw(){
  //image(myImg, mouseX, mouseY); //drawing with cats
    //imageFlip(myImg, 400, 200, "h2");
  //println(mouseY);
  fill(0, 0, 0);
  textSize(50);
  text("P111", 25, 85);
  text("P112", 25, 215);
  text("P1G1", 25, 343);
  text("P1M1", 25, 468);
  text("PMM2", 25, 593);
  text("PM11", 25, 715);
  text("PMG2", 25, 838);
}

void mouseReleased(){
  if(mouseX > 0 && mouseX < width && mouseY > 0 && mouseY < 130){
    for(int i = 0; i < 15; i++){                  //p111
      image(myImg, i*100, 65);
    }
  } else if (mouseX > 0 && mouseX < width && mouseY > 130 && mouseY < 260){
      for(int i = 0; i < 15; i++){                //p112
        imageFlip(myImg, i*200-100, 200, "h");
        imageFlip(myImg, i*200, 200, "v");
      }
  } else if (mouseX > 0 && mouseX < width && mouseY > 260 && mouseY < 385){
      for(int i = 0; i < 15; i++){                //p1g1
        pushMatrix();
        translate(i*100, 0);
        if(i%2 == 0){
          imageFlip(myImg, 0, 325, "v");
        } else {
          image(myImg, 0, 325);
        }
        popMatrix();
      }
  } else if (mouseX > 0 && mouseX < width && mouseY > 385 && mouseY < 510){
      for(int i = 0; i < 15; i++){                //p1m1
        pushMatrix();
        translate(i*100, 0);
        imageFlip(myImg, 0, 450, "v2");
        popMatrix();
      }
  } else if (mouseX > 0 && mouseX < width && mouseY > 510 && mouseY < 635){
      for(int i = 0; i < 15; i++){                  //pmm2
        pushMatrix();
        translate(0, 575);
        translate(i*100, 0);
        if(i%2 == 0){
          rotate(radians(180));
          imageFlip(myImg, 0, 0, "v2");
        } else {
          imageFlip(myImg, 0, 0, "v2");
        }
        popMatrix();
        }
  } else if (mouseX > 0 && mouseX < width && mouseY > 635 && mouseY < 755){
      for(int i = 0; i < 15; i++){                  //pm11
        pushMatrix();
        translate(i*100, 0);
        imageFlip(myImg, 0, 700, "h2");
        popMatrix();
      }
  } else if (mouseX > 0 && mouseX < width && mouseY > 755 && mouseY < 900){
      for(int i = 0; i < 15; i++){                  //pmg2
        pushMatrix();
        translate(0, 825);
        translate(i*100, 0);
        if(i%2 == 0){
          rotate(radians(180));
          imageFlip(myImg, 0, 0, "h2");
        } else {
          imageFlip(myImg, 0, 0, "h2");
        }
        popMatrix();
      }
  }
}
/*    for(int i = 0; i < 15; i++){                //pmm2 (failed code. Rewrote it from scatch in an attempt to debug, and I figured out what I was doing wrong)
    pushMatrix();
    translate(i*100, 0);
    if(i%2 == 0){
      translate(width, 575);
      rotate(radians(180));
      //translate(width, 0);
      imageFlip(myImg, 0, 575, "v2");
    } else {
      popMatrix();
      imageFlip(myImg, 0, 575, "v2");
    }
  } */




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

