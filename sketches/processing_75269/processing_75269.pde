
PImage b;
PImage c;
PImage d;
PImage e;
PImage f;
PImage g;
PImage g2;
PImage stamp;


void setup(){
  size(800,700);
  smooth();
  colorMode(HSB, 360, 100, 100, 100);
  stamp = loadImage("b.png");
  b = loadImage("b.png");
  c = loadImage("c.png");
  d = loadImage("d.png");
  e = loadImage("e.png");
  f = loadImage("f.png");
  g = loadImage("g.png");
  g2 = loadImage("g2.png");
  imageMode(CENTER);
  background(185,35,79);

  }

void draw(){
//P11
  for(int i = 0; i < 20; i++){   
    pushMatrix(); 
      translate(i*50+25,35);
       image(b,0,0);
     popMatrix();
  }

//P112
  for(int i = 0; i < 12; i++){   
    pushMatrix(); 
      translate(i*70+35,125);
       if(i % 2 == 1){
         translate(0,-4);
          rotate(radians(180));
       } else {
          rotate(radians(0));
       }
       image(c,0,0);
     popMatrix();
  }

//P1G1  
  for(int i = 0; i < 10; i++){
    pushMatrix();
      translate(i*89+44,225);
        if(i % 2 == 0){
          imageFlip(g,0,50,"v");
        } else {
          image(g,0,0);
        }
      popMatrix();
  }

//P1M1
  for(int i = 0; i < 4; i++){
    pushMatrix();
      translate(i*212+106,350);
          image(e,0,0);
            translate(0,49);
          imageFlip(e,0,0,"v");
      popMatrix();
  }
//P1MM2?????????????????
  for(int i = 0; i < 13; i++){
    pushMatrix();
      translate(i*63+31,450);
        if(i % 2 ==1){
          image(d,0,0);
            translate(0,49);
          imageFlip(d,0,0,"v");
        } else {
          imageFlip(d,0,0,"h");
            translate(0,49);
          //  rotate(radians(180));
          imageFlip(d,0,0,"v"); //and h?
        }
      popMatrix();
        
  }
//PM11
  for(int i = 0; i < 19; i++){   
  pushMatrix(); 
    translate(i*43+25,575);
    rotate(radians(90));
     if(i % 2 == 1){
       imageFlip(g2,0,0,"v");
     }else{
       image(g2,0,0);
     }
   popMatrix();
  }
//PMG2
for(int i = 0; i < 16; i++){   
pushMatrix(); 
  translate(i*50+25,635);
  rotate(radians(90));
   if(i % 2 == 1){
     rotate(radians(360));
     imageFlip(stamp,25,0,"v");
   }else{
     image(stamp,0,0);
   }
 popMatrix();
}
          
 // image(stamp,200,200);
 // image(myImg,mouseX,mouseY);
 // imageFlip(stamp,350,200,"v2");


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


