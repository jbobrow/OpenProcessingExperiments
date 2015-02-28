
//HW #4: Frieze Pattern
//By Mariana Moreno
//Math, Programming & Art
//2/14/12

PImage leaf;

void setup (){
  background (0);
  size (900,300);
  smooth ();
  noFill ();
  stroke (255);
  imageMode (CENTER);
  leaf = loadImage ("23636-bigthumbnail.jpg");
}

void draw (){
  //P1111
  pushMatrix ();
  strokeWeight (.15);
  for (int i= 0; i < 1000; i+=100){
    ellipse (i,150,100,100);
  }
  popMatrix ();
  
  //PMM2
  pushMatrix ();
  for (int i= 0; i < width; i +=10){
    strokeWeight (.25);
    ellipse (i,25,50,50);
    ellipse (i,275,50,50); 
  }
  popMatrix ();
  //P1G1
  for (int i= 0; i < width; i +=50){
    pushMatrix ();
      strokeWeight (2);
      translate (0,100);
      if (i%4 == 0){
        rect (i,0,50,50);
      } else {
        rect (i,50,50,50);
      } 
    popMatrix ();
  }
  //P1M1
  for (int i= 0; i < width; i+=50){
    pushMatrix ();
    strokeWeight (2);
    line (i,0,i+100,100);
    line (i,height,i+100,200);
    popMatrix ();
  }
  //PM11
  for (int i= 0; i < width; i+=50){
    pushMatrix ();
    strokeWeight (.25);
    translate (0,150);
    if (i%4 == 0){
      line (i,0,i+50,50);
    }
    if (i%4 == 0){
      line (i+50,50,i+100,0);
    }
    popMatrix ();
  }
  
  //PMG2
  for (int i= 0; i < width; i+=200){
    pushMatrix ();
    strokeWeight (1);
    translate (0,100);
    line (i,50,i+50,0);
    line (i+50,0,i+100,50);
    popMatrix ();
  }
  for (int i= 0; i < width; i+=200){
    pushMatrix ();
    strokeWeight (1);
    translate (150,100);
    line (i,50,i+50,0);
    line (i,50,i-50,0);
    popMatrix ();  
  }
  
  //P112
  for (int i=0; i < width; i++){
    pushMatrix ();
    translate (i*60,150);
    if (i%2 == 0){
      imageFlip (leaf,0,0,"v");
    } else {
      rotate (radians (180));
      imageFlip (leaf,0,0,"v");
    }        
    popMatrix ();
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

