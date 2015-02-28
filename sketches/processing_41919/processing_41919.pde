
PImage potato;
PImage slinky;
PImage ham;
PImage dino;
PImage alien;
PImage buzz;
PImage woody;
float x;
float y;
float x2;
float x3;
float x4;
float x5;
float x6;
float x7;
float x8;
float x9;
float x10;
float x11;
float x12;

void setup(){
  size(800,800);
  background(255);
  
  potato = loadImage("potato.gif");
  slinky = loadImage("slinky.jpg");
  ham = loadImage("ham.jpg");
  dino = loadImage("dino.jpg");
  alien = loadImage("alien.jpg");
  buzz = loadImage("buzz.jpg");
  woody = loadImage("woody.jpg");
  

    for(int x = 0; x < width; x+= 100){//P111
    if(x%50 == 0){
     image(potato,x,y);
}
}
       for(int x2 = 0; x2 < width; x2+= 100){//P1M1
         imageFlip(slinky,x2,100,"v2");

}
          for(int x3 = 0; x3 < width; x3+=200){//P112
            if(x3%50 == 0){
             image(ham,x3,200);
}
}
                for(int x4 = 00; x4 < width; x4+=100){
                  if(x4%50 == 0){
                   imageFlip(ham,x4,200,"v");
}
                    for(int x5 = 0; x5 < width; x5+=200){//PIGI
                     if(x5%50 == 0){
                       image(dino,x5,300); 
}
}
                        for(int x6 = 100; x6 < 900; x6+=100){
                           if(x6%50 == 0){
                            imageFlip(dino,x6,300,"v");    
                            imageFlip(dino,x6,300,"h");
}
}
                                
                        for(int x7 = 0; x7 < width; x7+=100){ //PMM2
                          if(x7%50 == 0){
                            imageFlip(alien,x7,400,"v2");
}
}
                             for(int x8 = 0; x8 < width; x8+=100){ //PM11
                               if(x8%50 == 0){
                                 imageFlip(buzz,x8,500,"h2");
}
}
                                   for(int x9 = 0; x9 < width; x9+=100){//PMG2
                                     if(x9%100 == 0){
                                       imageFlip(woody,x9,600,"h2");
}
}
                                         for(int x10 = 100; x10 < width; x10+=100){
                                            if(x10%50 == 0){     
                                              imageFlip(woody,x10,600,"v");                           
}                                     
} 
                 
    }  
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
    //println("No mirror direction specified!");
   // println("Use v, v2, h, or h2 for the 4th argument");
  }  
}

