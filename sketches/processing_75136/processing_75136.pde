
PImage myImg;

void setup(){
size(800, 750);
background(255);
myImg = loadImage ("nick.png");
imageMode(CENTER);
}

void draw(){
   
   pushMatrix();
   //for(int i = 0; i < 4; i++){
     //image(myImg,0,0);
     //translate(340,0);
  // }
   popMatrix();
   
   for(int i = 0; i <3; i++){
     pushMatrix();
     translate(i*105+52,75);
     image(myImg, 0, 0);
     popMatrix();
  text("p111", 35, 40);
 }
   for(int i = 0; i <3; i++){
     pushMatrix();
     translate(i*105+52,25);
     imageFlip(myImg, 0, 200, "v2");
     popMatrix();
   text("p1m1", 35, 190);
   }
   
   for(int i = 0; i <4; i++){
     pushMatrix();
     translate(i*105+52,175);
     imageFlip(myImg, 0, 200, "h2");
     popMatrix();
   text("pm11", 35, 340);
   }
   
for(int i = 0; i <4; i++){
     pushMatrix();
     translate(i*105+52,525);
     if(i%2==0){
       rotate(PI/.2);
     }else{
       
     }
     imageFlip(myImg, 0, 0, "h2");
     popMatrix();
   text("pmg2", 35, 470);
   }
   
    for(int i = 0; i <4; i++){
     pushMatrix();
     translate(i*105+52,675);
     if(i%2==0){
       rotate(PI/.2);
     }else{
       
     }
     imageFlip(myImg, 0, 0, "h");
     popMatrix();
   text("p112?", 35, 620);
   }
   
    for(int i = 0; i <4; i++){
     pushMatrix();
     translate(i*105+400,75);
     if(i%2==0){
       rotate(PI/.2);
     }else{
       
     }
     imageFlip(myImg, 0, 0, "v2");
     popMatrix();
   text("pmm2", 385, 40);
   }
   
    for(int i = 0; i <4; i++){
     pushMatrix();
     translate(i*105+400,225);
     if(i%2==0){
       rotate(PI/.2);
     }else{
       
     }
     imageFlip(myImg, 0, 0, "v");
     popMatrix();
   text("p1g1?", 385, 190);
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

