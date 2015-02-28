
PImage Brain; 

void setup(){
  Brain=loadImage("brain.gif");
  size(900,950);
  background(0);
}

void draw(){
  for(int i=-50;i<=1100; i+=150){   //line 1
  image(Brain,i,0);
  }
  
  for(int i=-50;i<=1100; i+=150){  //line2
    imageFlip(Brain,i, 100, "v2");
  }
    
  for(int i=-50;i<=1100; i+=150){    //line3
    imageFlip(Brain,i, 210,"h2");
  }
  for(int i=-0;i<=25; i++){
    pushMatrix();                         //line4
    translate(i*100, 0);
    imageFlip(Brain,i-19, 320,"h2");
    popMatrix();
   }
  for(int i=0;i<=25; i++){      
    pushMatrix();
    translate(i*100, 975);                //line4
    rotate(radians(180));
    imageFlip(Brain,i, 440,"h2");
    popMatrix();
  }
 for(int i=0;i<=25; i++){ 
   pushMatrix();
   translate(i*200, 500); 
   rotate(radians(90));
   image(Brain,i,560);
   popMatrix();
 }
 for(int i=-3;i<=25; i++){ 
   pushMatrix();
   translate(i*200, 620); 
   rotate(radians(270));
   image(Brain,i,560);
   popMatrix();
 }
 for(int i=-45;i<=1100; i+=150){   //line 1
  image(Brain,i,600);
 
 }

for(int i = 0; i <= 25; i++){
  pushMatrix();
  translate(i*150, 1220);
  rotate(radians(180));
  image(Brain, i, 500);
  popMatrix();
}


for(int i=-40;i<=1100; i+=150){    //line3
    imageFlip(Brain,i, 700,"h2");
}
for (int i=0;i<=25; i++){
  pushMatrix();
  translate(i*150, 1520);
  rotate(radians(180));
 imageFlip(Brain,i, 700,"h2");
  popMatrix();
}
 fill(255);
 text("p111", 80,100);  
 text("p1m1",80,200);
 text("pm11",80,300);
 text("pmm2",70,400);
 text("p112",70, 500);
 text("p1a1",80,600);
 text("pma2",45,700);
  
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

