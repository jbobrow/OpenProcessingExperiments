
PImage image1;
PImage image2;
PImage image3;
PImage image4;
PImage image5;
float x;
float y;
PImage currentimage;
void setup() {  
    size(500,500);
 background(225);
 image1 = loadImage("frisbee.jpg");
  image2 = loadImage("pic_1242_exploreint.jpg");
   image3 = loadImage("render.jpg");
    image4 = loadImage("science_clipart1.jpg");
     image5 = loadImage("whitewaterrafting-27v2bkc.jpg");
     image2.resize(500,500);
     image4.resize(500,500);
     image1.resize(500,500);
     image3.resize(500,500);
     image5.resize(500,500);
 currentimage= image2;
}
void draw(){  
  background(currentimage);
  if (mousePressed==true){
    if (mouseX< 250){
      if (mouseY< 250){
      currentimage=image4;
      background(currentimage);
        if (mousePressed=true){
          currentimage=image4;
          background(currentimage);
      }
        }
      }
    }
  if (mousePressed==true){
    if (mouseX>250){
      if (mouseY<250){
      currentimage=image1;
      background(currentimage);
      }
    }
  }
  if (mousePressed==true){
    if (mouseX<250){
      if (mouseY>250){
      currentimage=image3;
      background(currentimage);
      }
    }
  }
  if (mousePressed==true){
    if (mouseX>250){
      if (mouseY>250){
      currentimage=image5;
      background(currentimage);
      }
    }
  }
if(keyPressed==true){ 
 if(key== 'f'){
    currentimage=image2;
    background(currentimage);
}    
}
}
  
  



