

//DORAHAN
//Frieze patterns

PImage image1;

void setup(){
  
  size(800,1000);
  background(185,224,173);
  image1 = loadImage("twitter1.png");
  imageMode(CENTER);
  smooth();
}
 
void draw(){
  
 //P111
fill (255);
textSize (30);
text ("P111",90,30);
 pushMatrix();
    for(int i=0;i<20;i++){
    translate (i+70,0);
    image(image1,-100,80);
    }
  popMatrix();
 
    //P112
fill (255);
textSize (30);
text ("P112",90,150);
 pushMatrix();
    for(int i=0;i<20;i++){
       if (i%2==0){
       translate (i+70,0);
       imageFlip (image1,-100,190,"v");
      } else {
      translate (i+70,0);
      imageFlip (image1,-100,190,"h");
      }
    }
popMatrix();
 
    //PM11
fill (255);
textSize (30);
text ("PM11",90,260);
 pushMatrix();
    for(int i=0;i<20;i++){
     if (i%2==0){
     translate (i+70,0);
     imageFlip (image1,-100,310,"h2");
    } else {
    translate (i+70,0);
     imageFlip (image1,-100,310,"h2");
    }
    }
popMatrix();
 
 //P1M1
fill (255);
textSize (30);
text ("P1M1",90,370);
 pushMatrix();
    for(int i=0;i<20;i++){
            translate (i+70,0);
            imageFlip (image1,-100,420,"v2");
   }
  popMatrix();
  
  //PMM2
fill (255);
textSize (30);
text ("PMM2",90,480);
 pushMatrix();
    for(int i=0;i<20;i++){
            translate (i+70,0);
         //   if (i%2==0){
            imageFlip (image1,-100,520,"v2");
           //}else{
           imageFlip(image1,-100,520,"h2");
 //   }
   }
  popMatrix();
 
 //P1G1
fill (255);
textSize (30);
text ("P1G1",90,580);
 pushMatrix();
    for(int i=0;i<20;i++){
            translate (i+70,0);
            if (i%2==0){
            imageFlip (image1,-100,620,"v");
           }else{
            image(image1,-100,620);
          }
   }
  popMatrix();
           
  //PMG2
 
fill (255);
textSize (30);
text ("PMG2",90,690);
    pushMatrix();
   /*   for(int i=0;i<20;i++){
            translate (0,i+70);
            if (i%2==0){
            imageFlip (image1,-100,730,"v");
            }else{
            image(image1,-100,730);
           }
  }
 popMatrix();
}
*/
//I couldn't figure out this last one...

      for(int i = 0; i < 20; i++){
        translate(i*70, 0);
        if(i%2 == 0){
          imageFlip(image1, 100, 730, "h2");
        } else {
          imageFlip(image1, 100, 730, "h2");
        }
      }
        popMatrix();
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


