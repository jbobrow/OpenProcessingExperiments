
PImage image4;  //www.jellyfishart.com/kb_results.asp?ID=2

void setup (){
size(700,435);

//P111
 for (int i = -100; i <width; i +=95){
  image4 = loadImage("image4.jpeg");
  image( image4, i,0);
 }

//PM11\
scale(.95);
for (int i = -40; i <width; i+=90) {
  image4 = loadImage("image4.jpeg");
  imageFlip(image4,i,90,"h2");
}

//PMM2
scale(.90);
for(int i =0; i < 1100; i+=190){
  image4 = loadImage("image4.jpeg");
  imageFlip(image4,i,193,"v2");

}
  pushMatrix();
   translate(190,247);
   translate(100,235);
   rotate(PI);
   imageFlip(image4,100,205,"v2");
  popMatrix();
  pushMatrix();
   translate(380,247);
   translate(100,235);
   rotate(PI);
   imageFlip(image4,100,205,"v2");
   popMatrix();
   pushMatrix();
    translate(530,228);
    translate(100,235);
    rotate(PI);
    imageFlip(image4,60,186,"v2");
   popMatrix();
    pushMatrix();
    translate(720,228);
    translate(100,235);
    rotate(PI);
    imageFlip(image4,60,186,"v2");
   popMatrix();
  
//P1M1
{
scale(.85);
for (int i = 0; i <1200; i+=90) {
  image4 = loadImage("image4.jpeg");
  imageFlip(image4,i,325,"v2");
}
//P112
{ scale(.8); 
for(int i = 0; i <1200; i+=190){
  image4 = loadImage("image4.jpeg");
   image( image4, i,511);
    }
    pushMatrix();
     translate(230,95);
     rotate(PI);
     image(image4,40,-500);
    popMatrix();
    pushMatrix();
     translate(230,95);
     rotate(PI);
     image(image4,-150,-500);
    popMatrix();
    pushMatrix();
     translate(420,95);
     rotate(PI);
     image(image4,-150,-500);
    popMatrix();
    pushMatrix();
     translate(610,95);
     rotate(PI);
     image(image4,-150,-500);
    popMatrix();
    pushMatrix();
     translate(800,95);
     rotate(PI);
     image(image4,-150,-500);
    popMatrix();
    pushMatrix();
     translate(990,95);
     rotate(PI);
     image(image4,-150,-500);
    popMatrix();
   }
 }
 
//PMG2
{
scale(.9);
for(int i = 0; i < 1400; i+=190){ 
   image4 = loadImage("image4.jpeg");
   imageFlip(image4, i,660,"h2");
   } 
    pushMatrix();
     translate(190,611);
     translate(100,235);
     rotate(PI);
     imageFlip(image4,100,100,"h2");
    popMatrix();  
     pushMatrix();
     translate(380,611);
     translate(100,235);
     rotate(PI);
     imageFlip(image4,100,100,"h2");
    popMatrix();  
    pushMatrix();
     translate(571,611);
     translate(100,235);
     rotate(PI);
     imageFlip(image4,100,100,"h2");
    popMatrix();  
    pushMatrix();
     translate(760,611);
     translate(100,235);
     rotate(PI);
     imageFlip(image4,100,100,"h2");
    popMatrix();  
    pushMatrix();
     translate(950,611);
     translate(100,235);
     rotate(PI);
     imageFlip(image4,100,100,"h2");
    popMatrix();  
     pushMatrix();
     translate(1140,611);
     translate(100,235);
     rotate(PI);
     imageFlip(image4,100,100,"h2");
    popMatrix();  
    pushMatrix();
     translate(1330,611);
     translate(100,235);
     rotate(PI);
     imageFlip(image4,100,100,"h2");
    popMatrix();  
}

//P1G1
scale(.93);
for (int i = -50; i <1300; i +=190){
  image4 = loadImage("image4.jpeg");
  image( image4, i,800);
}
     translate(40,649);
     translate(100,235);
     rotate(radians(180));
     imageFlip(image4,0,0,"h");
  pushMatrix();
     translate(-190,-0);
     image(image4, 0,0);
     rotate(radians(180));
     translate(100,235);
   popMatrix();
   pushMatrix();
     translate(-381,-0);
     image(image4, 0,0);
     rotate(radians(180));
     translate(100,235);
   popMatrix();
    pushMatrix();
     translate(-570,-0);
     image(image4, 0,0);
     rotate(radians(180));
     translate(100,235);
   popMatrix();
   pushMatrix();
     translate(-760,-0);
     image(image4, 0,0);
     rotate(radians(180));
     translate(100,235);
   popMatrix();
   pushMatrix();
     translate(-950,-0);
     image(image4, 0,0);
     rotate(radians(180));
     translate(100,235);
   popMatrix();
   pushMatrix();
     translate(-1140,-0);
     image(image4, 0,0);
     rotate(radians(180));
     translate(100,235);
   popMatrix();
   pushMatrix();
     translate(-1330,-0);
     image(image4, 0,0);
     rotate(radians(180));
     translate(100,235);
   popMatrix();
 
   }



//imageFlip function by nick lally
//paste function at the bottom of your sketch, and use like this: imageFlip(imageName,x,y,"mode")
//modes are "v", "v2", "h", "h2"
//"v" mirrors vertically, "v2" mirrors top half vertically
//"h" mirrors horizontally, "h2" mirrors left half horizontally
void imageFlip(PImage imageName, int xPos, int yPos, String mode){
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
} 

