
//Rayniel Estrella
//Math, Programming and Art
//Homework # 4 - Seven line symmetry patterns.
//Had huge difficulties using the imageFlip code. When I used a mode on a line of images and then try to use another mode, it won't work and all subsequent images tend to have the same transformation. In other words, I couldn't find a way to stop the imageFlip code.

PImage Totodile;

void setup(){
  background(255);
  smooth();
  size(600,620);
}

void draw(){
    //Background - Pokeball
  noStroke();
  fill(#ef1111);
  triangle(0,0,0,600,600,0);
  fill(#ffffff);
  triangle(600,600,600,0,0,600);
  stroke(20);
  strokeWeight(15);
  line(600,0,0,600);
  fill(#000000);
  ellipse(300,300,150,150);
  fill(#ffffff);
  ellipse(300,300,100,100);
  
  Totodile = loadImage("Totodile.png");
  
  //Totodile - P111
  pushMatrix(); 
  image(Totodile,0,0);
  image(Totodile,50,0);
  image(Totodile,100,0);
  image(Totodile,150,0);
  image(Totodile,200,0);
  image(Totodile,250,0);
  image(Totodile,300,0);
  image(Totodile,350,0);
  image(Totodile,400,0);
  image(Totodile,450,0);
  image(Totodile,500,0);
  image(Totodile,550,0);
  popMatrix();
  
  //Totodile - P1M1 
  pushMatrix();
  imageFlip(Totodile,0,90,"v2");
  image(Totodile,50,90);
  image(Totodile,100,90);
  image(Totodile,150,90);
  image(Totodile,200,90);
  image(Totodile,250,90);
  image(Totodile,300,90);
  image(Totodile,350,90);
  image(Totodile,400,90);
  image(Totodile,450,90);
  image(Totodile,500,90);
  image(Totodile,550,90);
  popMatrix();
  
  //Totodile - P112 
  pushMatrix();
  imageFlip(Totodile,0,180,"h");
  image(Totodile,50,180);
  image(Totodile,100,180);
  image(Totodile,150,180);
  image(Totodile,200,180);
  image(Totodile,250,180);
  image(Totodile,300,180);
  image(Totodile,350,180);
  image(Totodile,400,180);
  image(Totodile,450,180);
  image(Totodile,500,180);
  image(Totodile,550,180);
  popMatrix();
  
    //Totodile - P1G1 
  pushMatrix();
  imageFlip(Totodile,0,270,"h2");
  image(Totodile,50,270);
  image(Totodile,100,270);
  image(Totodile,150,270);
  image(Totodile,200,270);
  image(Totodile,250,270);
  image(Totodile,300,270);
  image(Totodile,350,270);
  image(Totodile,400,270);
  image(Totodile,450,270);
  image(Totodile,500,270);
  image(Totodile,550,270);
  popMatrix();
  
      //Totodile - PMM2 
  pushMatrix();
  imageFlip(Totodile,0,360,"h");
  image(Totodile,50,360);
  image(Totodile,100,360);
  image(Totodile,150,360);
  image(Totodile,200,360);
  image(Totodile,250,360);
  image(Totodile,300,360);
  image(Totodile,350,360);
  image(Totodile,400,360);
  image(Totodile,450,360);
  image(Totodile,500,360);
  image(Totodile,550,360);
  popMatrix();

        //Totodile - PM11 
  pushMatrix();
  image(Totodile,0,450);
  image(Totodile,50,450);
  image(Totodile,100,450);
  image(Totodile,150,450);
  image(Totodile,200,450);
  image(Totodile,250,450);
  image(Totodile,300,450);
  image(Totodile,350,450);
  image(Totodile,400,450);
  image(Totodile,450,450);
  image(Totodile,500,450);
  image(Totodile,550,450);
  popMatrix();
  
          //Totodile - PMG2 
  pushMatrix();
  image(Totodile,0,540);
  image(Totodile,50,540);
  image(Totodile,100,540);
  image(Totodile,150,540);
  image(Totodile,200,540);
  image(Totodile,250,540);
  image(Totodile,300,540);
  image(Totodile,350,540);
  image(Totodile,400,540);
  image(Totodile,450,540);
  image(Totodile,500,540);
  image(Totodile,550,540);
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

