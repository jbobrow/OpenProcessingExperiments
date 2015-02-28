
PImage myImg;
int xPos;
int yPos;

void setup(){
  size(800,600);
  myImg = loadImage("strawberry.jpg");
  imageMode(CENTER);
  background(255);
  smooth();
  xPos = 10;
  yPos = 10;
}

void draw(){
  for(int i = 0; i < 12; i++){
    pushMatrix();  
      translate(i*75,60);
      rotate(radians(180));
      imageFlip(myImg,0,0,"v");
    popMatrix();  
  }
  for(int i = 0; i < 12; i++){
    pushMatrix();
    translate(i*110,160);
    rotate(radians(180));
    imageFlip(myImg,0,0,"v2");
    popMatrix();
  }
  for(int i = 0; i < 12; i++){
    pushMatrix();
    translate(i*87,230);
    if(i % 2 == 0){
      rotate(radians(180));
    }
    imageFlip(myImg,0,0,"v2");
    popMatrix();
  }
  for(int i = 0; i < 22; i++){
    pushMatrix();
    translate(i*75,340);
    if(i % 2 == 0){
      rotate(radians(180));
    }
    image(myImg,0,0);
    popMatrix();
  }
  for(int i = 0; i < 12; i++){
    pushMatrix();
    translate(i*75,410);
    rotate(radians(45));
    if(i % 2 == 0){
      rotate(radians(90));
    }
    imageFlip(myImg,0,0,"h");
    popMatrix();
  }  
  for(int i = 0; i < 12; i++){               
    pushMatrix();
    translate(i*75,475);
    if(i % 2 == 0){
     imageFlip(myImg,0,0,"v");       //<---code is flipping every one "v", not every other?
    }else{
     image(myImg,0,0);
    }
    popMatrix();
  }
  for(int i = 0; i < 12; i++){
    pushMatrix();
    translate(i*75,550);
    imageFlip(myImg,0,0,"h2");
    if(i % 2 == 0){
      rotate(radians(180));
    }
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



