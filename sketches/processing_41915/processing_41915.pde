
//Bryn Fraker 10/10 line smmetry homework

PImage giraffe;
PImage zebra;
int x;

void setup(){
  size(800,800);
  x = 0;
  giraffe = loadImage("giraffe.png");
  zebra = loadImage("Zebra.png");
}

void draw(){
  background(255);
  
   //P111
   for (int i = 0; i < 100; i++){
    translate(57, 0);
    image(giraffe,x,0);
   //}
    
    //P1M1
     //for(int i = 0; i < 100; i++){
      translate(90,0);
      imageFlip(zebra,x,100,"v2");
      image(zebra,x,100);
     //}
      
      //PMM2
     //for(int i = 0; i < 100; i++){
      translate(90,0);
      imageFlip(zebra,x,175,"h");
      imageFlip(zebra,x,175,"v2");
      image(zebra,x,175);
     //}
      
      //PM11
      //for(int i = 0; i < 100; i++){
        translate(57,0);
        imageFlip(giraffe,x,250,"h2");
        image(giraffe,x,250);
      //}   
   
      //P1G1
      //for(int i = 0; i < 100; i++){
       translate(90,0);
       rotate(radians(180));
       image(zebra,x,350);
      //}
      
      //P112
       //for(int i = 0; i < 100; i++){
        translate(90,0);
        rotate(radians(180));
        imageFlip(zebra,x,350,"v");
        image(zebra,x,350);
      //}
      
      //PMG2
      //for(int i = 0; i < 100; i++){
        translate(90,0);
        imageFlip(zebra,x,425,"v");
        imageFlip(zebra,x,425,"h2");
        rotate(radians(180));
        image(zebra,x,425);
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
    println("No mirror direction specified!");
    println("Use v, v2, h, or h2 for the 4th argument");
  }  
} 


