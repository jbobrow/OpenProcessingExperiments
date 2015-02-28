

PImage  nemo;

void setup(){
  size(1200,1150);
  background(255);
  nemo = loadImage("nemo.gif");
  imageMode(CENTER);
}

void draw(){

for(int i = 100; i < 1200; i += 250){  // 3 part code. first is starting point, 2nd is where it ends, 3rd is spacing.
  image(nemo,i,50);  // "i" stands for the multiple i values for the x coordinates. You can change both x and y coordinate to "i".
}
 
for(int i = 100; i < 1200; i += 250){
 imageFlip(nemo,i,180,"v2");            // taken from Lally's code. "v2" mirrors top half vertically.
 } 

for(int i = 100; i < 1200; i += 250){
  imageFlip(nemo,i,330,"h2");
 }
 
for(int i=0; i < 20; i++){
  pushMatrix();                 // confining these specific rules to this loop.
  translate(i*280,1000);
  //rotate(radians(180));
  imageFlip(nemo,0,550,"h2");
  rotate(radians(180));
  imageFlip(nemo,0,550,"h2");
  popMatrix();
}
    
  for(int i = 0; i < 1200; i += 280){
  imageFlip(nemo,i,550,"h2");
  }

for(int i=0; i < 20; i++){
  pushMatrix();                 // confining these specific rules to this loop.
  translate(i*243,720);
  rotate(radians(90));
  image(nemo,0,530);
  popMatrix();
}

for(int i= -200; i < 20; i++){
  pushMatrix();                 // confining these specific rules to this loop.
  translate(i*243,720);
  rotate(radians(270));
  image(nemo,0,530);
  popMatrix();
}


for(int i=0; i < 20; i++){
  pushMatrix();                 // confining these specific rules to this loop.
  translate(i*450,1430);
  rotate(radians(180));
  image(nemo,0,530);
  popMatrix();
}

for(int i = -235; i < 1200; i += 450){  // 3 part code. first is starting point, 2nd is where it ends, 3rd is spacing.
  image(nemo,i,900);  // "i" stands for the multiple i values for the x coordinates. You can change both x and y coordinate to "i".
}
for(int i = 100; i < 1200; i += 450){
  imageFlip(nemo,i,1080,"h2");
}

for(int i=0; i < 30; i++){
  pushMatrix();                             // confining these specific rules to this loop.
  translate(i*450,1570);                    //1200 is the increasing number, NOT the number on the axis.
  //rotate(radians(180));
  imageFlip(nemo,-325,550,"h2");
  rotate(radians(180));
  imageFlip(nemo,-325,550,"h2");
  popMatrix();
}

fill(0);
  text("p111",150,120);
  text("p1m1",150,260);
  text("pm11",150,390);
  text("pmm2",150,580);
  text("p112",130,780);
  text("p1a1",130,980);
  text("pma2",130,1130);

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


