
int y;
PImage squid;
PImage squid2;


void setup(){
  y=0;
  size(600,700);
  smooth();
  background(45,85,131);
  
  squid = loadImage("squid.png");
  squid2 = loadImage("squid2.png");

 
  //imageMode(CENTER);
  
  
/*}


void draw(){*/
  
  /*
    for(int x=0; x<width; x+=120){
    //for(int y=0; y<height; y+=60){
      fill(255);
      image(squid,x,y);
    }*/

text("P 1 1 1",0,10);
    for(int x=0; x<width; x+=60){
      image(squid,x,10);
    }
    
    
text("P 1 M 1",0,100);
    for(int x=0; x<width; x+=30){
      imageFlip(squid,x,100,"v2");
    }
    
    
text("P M 1 1",0,200);
    for(int x=0; x<width; x+=60){
      imageFlip(squid,x,200,"h2");
    }
    
   
text("P M M 2",0,300);
    for(int x=0; x<width; x+=60){
      image(squid2,x,300);
    }
    

text("P 1 1 2",0,400);
    for(int x=0; x<width; x+=100){
      imageFlip(squid,x,400,"v");
      imageFlip(squid,(x+50),400,"h");
    }


text("P 1 A 1",0,500);
    for(int x=0; x<width; x+=100){
      image(squid,x,500);
      imageFlip(squid,(x+50),500,"v");
    }

text("P M A 2",0,600);
    for(int x=0; x<width; x+=50){
      imageFlip(squid,x,600,"h2");
      imageFlip2(squid,(x+900),600,"v");
    }





}


//- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
//- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
//- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
//- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
//- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

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

/*- - - - - - - - - - -
- - - - - - - - - - -
- - - - - - - - - - -
- - - - - - - - - - -*/

//imageFlip function by nick lally
//paste function at the bottom of your sketch, and use like this: imageFlip(imageName,x,y,"mode")
//modes are "v", "v2", "h", "h2"
//"v" mirrors vertically, "v2" mirrors top half vertically
//"h" mirrors horizontally, "h2" mirrors left half horizontally
void imageFlip2(PImage imageName, int xPos, int yPos, String mode){
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


