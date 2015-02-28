
PImage myImg;

void setup(){
  size (800,600);
  myImg = loadImage("smallboobs.png");
  imageMode(CENTER);
  background(236,191,252);
  
}

void draw(){
  
  for(int i = 0; i<10; i++){
  pushMatrix();
  translate(i*100,0);
  image(myImg,20,50);
  popMatrix();
  } //P111
  
    for(int i = 0; i<10; i++){
  pushMatrix();
  translate(i*100,0);
  imageFlip(myImg,20,150,"v2");
  popMatrix();
    }
  /*for(int i = 0; i<10; i++){
  pushMatrix();{
  translate(i*100,0);
  if(i % 2 == 0){
    rotate(radians(180));}
  imageFlip(myImg,20,150,"v");
  popMatrix();
  }//P1G1
    }*/
    
  /*for(int i = 0; i<10; i++){
  pushMatrix();{
  translate(i*200,0);
  image(myImg,50,300);}
  popMatrix(); 
}*/
 for(int i = 0; i<10; i++){
  pushMatrix();
  translate(i*100,0);
  imageFlip(myImg,50,220,"h2");
  popMatrix(); }
  /*for(int i = 0; i<10; i++){
  pushMatrix();
  translate(i*300,0);
  imageFlip(myImg,50,300,"h");
  popMatrix(); }//P112*/

   for(int i = 0; i<20; i++){
       pushMatrix();
  translate(i*100,690);
   rotate(radians(180));
  imageFlip(myImg,50,320,"h2");//----------line4
   popMatrix(); 
   }
   for(int i = 0; i<10; i++){
  pushMatrix();
  translate(i*100,-10);
  imageFlip(myImg,50,300,"h2");
  popMatrix(); }
 // popMatrix(); 
  
 
  //for(int i = 0; i<= 800; i+= 50){
                             //   -------------line4
  //translate(i*100,0);
 //imageFlip(myImg,50,300,"h2");
  //}
  
   for(int i = 0; i<20; i++){
  pushMatrix();
  translate(i*200,350);
  rotate(radians(90));
  image(myImg,50,350);
  popMatrix();
   }
   for(int i = -200; i<20; i++){
  pushMatrix();
  translate(i*200,450);
  rotate(radians(270));
  image(myImg,50,350);
  popMatrix();
   }
   
     
   for(int i = 0; i<20; i++){
  pushMatrix();
  translate(i*200,120);
  image(myImg,50,350);
  popMatrix();
   }
   for(int i = -200; i<20; i++){
  pushMatrix();
  translate(i*200,810);
  rotate(radians(180));
  image(myImg,50,350);
  popMatrix();
   }
  
 // popMatrix(); 
  /*for(int i = 0; i<10; i++){
  pushMatrix();
  translate(i*100,0);
  image(myImg,50,450);
  popMatrix(); }
  for(int i = 0; i<10; i++){
  pushMatrix();
  translate(i*100,0);
  imageFlip(myImg,50,600,"v");
  popMatrix(); }*/
    for(int i = 0; i<20; i++){
       pushMatrix();
  translate(i*200,850);
   rotate(radians(180));
  imageFlip(myImg,50,320,"h2");
   popMatrix(); 
   }
   for(int i = 0; i<10; i++){
  pushMatrix();
  translate(i*200,210);
  imageFlip(myImg,50,300,"h2");
  popMatrix(); }
   
    textSize(32);
    fill(0);
  text("p111", 20,50);
 text("p1m1", 20,150);
text("pm11", 20,240);
text("pmm2", 20,340);
text("p112", 20,420);
text("p1a1", 20,480);
text("pma2", 20,550);
    
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


