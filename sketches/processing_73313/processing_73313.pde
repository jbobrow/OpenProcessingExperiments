
//HomeWork 5 Frieze Patterns By Zach Ruddell
// Book helped me with text code
//Used your code that you provided at end
//Had trouble figuring out glide reflections, but I think all else is right


PImage myImg;
PFont f;

void setup(){
  size(1000,800);
  f = createFont("Arial",20,true);
  myImg = loadImage("Ghost.png");
  imageMode(CENTER);
background(250);
}
  
  void draw(){
     for(int i=0; i<20; i++){
      pushMatrix();
      translate(i*60,0);
      image(myImg,30,70);
      popMatrix();
      fill(0,0,0);
      textFont(f);
      text("P111",0,40);
      text("P112",0,140);
      text("P1G1",0,240);
      text("P1M1",0,340);
      text("PMM2",0,440);
      text("PM11",0,570);
      text("PMG2",0,670);
    } //1 P111
  
  
     for(int i=0; i<20; i++){
      pushMatrix(); {
      translate(i*60,340);
      rotate(radians(180)); }
      image(myImg,30,170); 
      popMatrix();
    } //2 P112
    
    
     for(int i=0; i<20; i++){
      pushMatrix();
      translate(i*60,0);
      imageFlip(myImg,30,270,"v");
      imageFlip(myImg,30,270,"h");
      popMatrix();
   }  //3 P1G1
    
    
     for(int i=0; i<20; i++){
       pushMatrix();
       translate(i*60,0);
       imageFlip(myImg,30,370,"v2");
       popMatrix();
       }  //4 P1M1
    
    
  for(int i=0; i<20; i++){
       pushMatrix();
       translate(i*60,970);
       rotate(radians(180));
       imageFlip(myImg,30,500,"v"); 
       imageFlip(myImg,30,500,"h2");
       popMatrix();
    }  // 5 PMM2
    
   
    for(int i=0; i<20; i++){
     pushMatrix();
     translate(i*60,0);
     imageFlip(myImg,30,600,"h2");
     popMatrix();
    } //6 PM11
    
    
    for(int i=0; i<20; i++){
     pushMatrix();
     translate(i*60,1400);
     rotate(radians(180));
     imageFlip(myImg,30,700,"h2");
     popMatrix();
    } //7 PMG2
  
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

