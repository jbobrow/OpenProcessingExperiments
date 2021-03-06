

PImage monkey;



void setup(){
  size(800, 1200);
  background(255);
  monkey = loadImage("monkey.gif");
}

void draw(){
  fill(0);
 text("p111", 40, 40);
 text("p1m1", 40, 140);
 text("pm11", 40, 240);
 text("pmm2", 40, 360);
 text("p112", 40, 525);
 text("p1a1", 40, 700);
 text("pma2", 40, 840);
  
  
  
  
  
//p111  
 for(int i = -100; i < 1000; i += 150){
  image(monkey, i, 15);
 }
//p1m1
for(int i = -100; i < 1000; i += 150){
  imageFlip(monkey, i, 115,"v2");
 }
 
//pm11
for(int i = -100; i < 1000; i += 150){
 imageFlip(monkey, i, 215, "h2");
}
//pmm2
  for(int i = -175; i < 20; i++){
  pushMatrix();
  translate(53+(i*150), 1000);
  rotate(radians(180));
  imageFlip(monkey, i, 475, "h2");
  popMatrix();
  }
 
 for(int i = -100; i < 1200; i += 150){
   imageFlip(monkey, i, 330, "h2");
 }
 
 //p112
 
  for(int i = -250; i < 20; i++){
  pushMatrix();
  translate(70+(i*300), 550);
  rotate(radians(90));
  image(monkey, i, 475);
  popMatrix();
  }
  for(int i = -175; i < 20; i++){
  pushMatrix();
  translate(122+(i*300), 705);
  rotate(radians(270));
  image(monkey, i, 475);
  popMatrix();
  }
//p1a1
for(int i = -100; i < 1000; i += 300){
  image(monkey, i, 700);
}

for(int i = -250; i < 20; i++){
  pushMatrix();
  translate(215+(i*300), 1285);
  rotate(radians(180));
  image(monkey, i, 475);
  popMatrix();
  }
 
//pma2
for(int i = -100; i < 1000; i += 300){
 imageFlip(monkey, i,815, "h2");
}

for(int i = -100; i < 20; i++){
  pushMatrix();
  translate(205+(i*300),1350);
  rotate(radians(180));
 imageFlip(monkey, i, 415, "h2");
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

