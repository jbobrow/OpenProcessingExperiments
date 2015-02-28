
PImage myImg;
PImage myImg2;
PImage myImg3;
PImage myImg4;
PImage myImg5;
PImage myImg6;
PImage myImg7;
float  myNum;
float bounce;


void setup() {
  size(800, 800);
  myNum++;
  background(255);
    if(myNum>500){
        myNum=0;
    }
  myImg=loadImage("donut.png");
  myImg2=loadImage("bananasplit.png");
  myImg3=loadImage("gumball.png");
  myImg4=loadImage("candycane.png");
  myImg5=loadImage("frosting.png");
  myImg6=loadImage("dingdong.png"); 
  myImg7=loadImage("choc.png");  
  bounce=1;
}

void draw(){
  myNum++;
  smooth();
  
    pushMatrix();//p1a1
    for(int i=0; i<100; i++){
    translate(1*170,0);
    tint(255, 100);
    imageFlip(myImg7,-400,353,"v");
    }
  popMatrix();

  
    pushMatrix();//p1a1
    for(int i=0; i<100; i++){
    translate(1*170,0);
    tint(255, 100);
    imageFlip(myImg7,-315,353,"h");
    }
  popMatrix();
  
    pushMatrix();//pma2
    for(int i=0; i<100; i++){
    translate(1*200,0);
    tint(255, 100);
    imageFlip(myImg,-325,460,"v");
    }
  popMatrix();
  
      pushMatrix();//pma2
    for(int i=0; i<100; i++){
    translate(1*200,0);
    tint(255, 100);
    imageFlip(myImg,-425,460,"h");
    }
  popMatrix();

  
  
    pushMatrix();//p112
    for(int i=0; i<100; i++){
    translate(1*200,0);
    tint(255, 100);
    imageFlip(myImg6,-325,260,"v");
    }
  popMatrix();
  
      pushMatrix();//p112
    for(int i=0; i<100; i++){
    translate(1*200,0);
    tint(255, 100);
    imageFlip(myImg6,-425,260,"h");
    }
  popMatrix();

  
    pushMatrix();//pmm2
    for(int i=0; i<100; i++){
    translate(1*85,0);
    tint(255, 100);
    imageFlip(myImg5,-300,375,"v2");
    }
  popMatrix();
  
    pushMatrix();//pm11
    for(int i=0; i<100; i++){
    translate(1*85,0);
    tint(255, 100);
    imageFlip(myImg4,-300,300,"h2");
    }
  popMatrix();
  
    pushMatrix();//p111
    for(int i=0; i<100; i++){
    translate(1*50,0);
    tint(255, 100);
    imageFlip(myImg3,-300,150,"h");
    }
  popMatrix();
  
    pushMatrix();//p111
    for(int i=0; i<100; i++){
    translate(1*50,0);
    tint(255, 100);
    imageFlip(myImg3,-300,535,"h");
    }
  popMatrix();
  
  
    pushMatrix();//p1m1
    for(int i=0; i<100; i++){
    translate(1*100,0);
    tint(255, 126);
    imageFlip(myImg2,-300,0,"v2"); 
    }
  popMatrix();
  
  
    pushMatrix();//p1m1
    for(int i=0; i<100; i++){
    translate(1*100,0);
    tint(255, 126);
    imageFlip(myImg2,-300,585,"v2");
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



