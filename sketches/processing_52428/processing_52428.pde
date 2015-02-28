
//put a coppy of image in applate folder

//figureout how to set ombinations of intigers
int i;
boolean j;
int x;
int y;
int xS = 82;
int yS = 65;
PImage tile;


//image is 82,65

void setup(){
 size(720,650);
 x =0;
 y =0;
  tile = loadImage("275297_787087485_1563076923_q_NC.png");


 /* 
    for(int i = 0; i < 820; i+=82){
  x=i;
  imageFlip(tile,x,y,"v");
  }
*/




  //================  reflection PII2 ================
  for(int i = 0; i < 820; i+=82){
  x=i;
  y=0;
  imageFlip(tile,x,5*yS,"h");
    rotate(radians(180));
  imageFlip(tile,x,5*yS,"v");//works independent of weather i use "v" or "h"
  }


//this is gunking up the system
/*
  //================  reflection PII@ ================
  for(int i = 0; i < 820; i+=82){
  x=i;
  y=0;
  imageFlip(tile,x,4*yS,"h");
    rotate(radians(180));
  imageFlip(tile,x,4*yS,"v");
  }


  for(int i = 0; i < 820; i+=82){
  x=i;
  y=0;
  image(tile,x,1*yS);
  rotate(radians(90));
  imageFlip(tile,x,1*yS,"v"); 
  }
*/
 

  //================  reflection PIII  ================#1
  for(int i = 0; i < 820; i+=82){
  x=i;
  imageFlip(tile,x,0*yS,"v");
  }
  
}

void draw(){  
    tile = loadImage("275297_787087485_1563076923_q_NC.png");
 
  //================  reflection PIMI  ================
  
   for(int i = 0; i < 820; i+=82){
     boolean j =true;
     x = 82;
     y = 2*yS;
     if(i == 164){
       translate(x,y);
     imageFlip(tile,0,2*yS,"v");
     x = 0;
     y = 0;
     }else{
       pushMatrix();
     rotate(radians(180));
          popMatrix();
     imageFlip(tile,0,2*yS,"v");

     }
   }



  //================  reflection PMA2  ================#7
  for(int i = 0; i < 820; i+=164){
  x=i;
  y=0;
  imageFlip(tile,x,9*yS,"h");
  imageFlip(tile,x-82,9*yS,"h");
  }
}  
 
 /* 
  //justin
   for(int i = 0; i < 820; i+=82){
     x = i;
     y = 260;//pos
     imageFlip(tile,x,1*yS,"v");
   
  
 //inverting the grid 
 for(int i = 0; i < 820; i+=82){
 pushMatrix();
  x = i;
  y = 260;//pos
  x += 30;
  translate(820,650);
  rotate(radians(90));
  image(tile,x,y);
  popMatrix();
 }
}
*/

/*
void draw(){
  tile = loadImage("275297_787087485_1563076923_q_NC.png");
   for(int i = 0 ; i < 820 ; i+=164){//this works
   if(xS%){
     imageFlip(tile,x,y,"v");
   }else{
     imageFlip(tile,x,y,"h");
      }
   }
}
*/



  //================  reflection PIII  ================
/*
   void draw(){
  tile = loadImage("275297_787087485_1563076923_q_NC.png");
   for(int i = 1 ; i < 30 ; i=i+1){//this works
   translate(100,0);//this is stationary
        imageFlip(Tile,0,100,"h");
       

   }

}
*/
 
 
 /*
 //screenshot function. From Nick's class. it really is more trouble than it's worth though.
  millis();
  float s = millis()/1000;
 
 if (s > 10){
   //do something
 }
 
  mouseReleased();
  save(millis()+"*image.png");
}
 */
 


//void draw was removed and enabled this to work






//"v" flips vertically, "v2" flips top half vertically, //"h" flips horizontally, "h2" flips left half horizontally

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

