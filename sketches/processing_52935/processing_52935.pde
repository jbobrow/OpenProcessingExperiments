


PImage abird;

void setup(){
  size(800,1000);
  background(#C11414);
  imageMode(CENTER);
  smooth();
  abird = loadImage("abird.jpg");

//p111-/-/-/
for(int i=0; i<2; i++){
  pushMatrix();
  translate(i*150,0);
  image(abird,0,50);//
  popMatrix();
}
  
//p1g1-/-\-/
for(int i = 0; i<3; i++){
 pushMatrix();
   translate(i*150,100);//x pos in incr of 150 
     if(i%2 == 0){
      imageFlip(abird,0,100,"v");
     } else {
       image(abird,0,100);
     }
 popMatrix();
}
  
//PMM2-\/--\/-  
//    -/\--/\-
for(int i = 0; i<4; i++){
 pushMatrix();
   translate(i*150,350);
     if(i%2 == 0){
      imageFlip(abird,0,0,"v2");
      } else {
        rotate(radians(180)); 
        imageFlip(abird,0,0,"v2");  
      }
 popMatrix();
}
  
//p112 
for(int i = 0; i<5; i++){
  pushMatrix();
   translate(i*150,500);//x pos in incr of 150 
     if(i%2 == 0){
      image(abird,0,0);
     } else {
       rotate(radians(180));
       image(abird,0,0);
     }
  popMatrix();
}       
  
//p1m1
for(int i=0; i<6; i++){
  pushMatrix();
    translate(i*150,650);
    imageFlip(abird,0,0,"v2");
  popMatrix();
}

//pm11
for(int i=0; i<5; i++){
  pushMatrix();
    translate(i*150,800);
    imageFlip(abird,0,0,"h2");
  popMatrix();
}

//pmg2
for(int i=0; i<4; i++){
  pushMatrix();
    translate(i*150,950);
      if(i%2 == 0){
        imageFlip(abird,0,0,"h2");
        
      } else {
        rotate(radians(180));
        imageFlip(abird,0,0,"h2");
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

                
