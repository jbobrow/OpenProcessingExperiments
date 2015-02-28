
//Devon Kelley HW 5
//each line of pictures is a different sequence

PImage myImg;

void setup(){
  size(800,800);
  myImg=loadImage("devonpuppy.jpeg");
  imageMode(CENTER);
    background(255);
}
void draw(){
 //P111
  image(myImg,50,50);
  for(int i=0;i<15;i++){
    pushMatrix();
    translate(i*100,0);
    image(myImg,50,50);
    popMatrix();
  }
  //P112
  imageFlip(myImg,50,170,"v");
  for(int i=0;i<10;i+=2){
    pushMatrix();
    translate(i*100,0);
    imageFlip(myImg,50,170,"v");
    popMatrix();
  }
  image(myImg,150,170);
  for(int i=0;i<10;i+=2){
    pushMatrix();
    translate(i*100,0);
    image(myImg,150,170);
    popMatrix();
  }
  //P1G2
  imageFlip(myImg,150,290,"v");
  for(int i=0;i<10;i+=2){
    pushMatrix();
    translate(i*100,0);
    imageFlip(myImg,150,290,"v");
    popMatrix();
  }
  image(myImg,50,290);
  for(int i=0;i<10;i+=2){
    pushMatrix();
    translate(i*100,0);
    image(myImg,50,290);
    popMatrix();
  }
  //P1M1
  image(myImg,150,410);
  for(int i=0;i<15;i+=2){
    pushMatrix();
    translate(i*100,0);
    image(myImg,150,410);
    popMatrix();
  }
  imageFlip(myImg,50,410,"h");
  for(int i=0;i<10;i+=2){
    pushMatrix();
    translate(i*100,0);
    imageFlip(myImg,50,410,"h");
    popMatrix();
  }
  //PM12
  image(myImg,50,530);
  for(int i=0;i<15;i+=2){
    pushMatrix();
    translate(i*100,0);
    image(myImg,50,530);
    popMatrix();
  }
  imageFlip(myImg,50,530,"v2");
  for(int i=0;i<15;i+=2){
    pushMatrix();
    translate(i*100,0);
    imageFlip(myImg,50,530,"v2");
    popMatrix();
  }
  imageFlip(myImg,150,530,"v2");
  for(int i=0;i<10;i+=2){
    pushMatrix();
    translate(i*100,0);
    imageFlip(myImg,150,530,"v2");
    popMatrix();
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

