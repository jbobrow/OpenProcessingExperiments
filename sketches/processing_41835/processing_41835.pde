
//homework 4
//Maximilian Uriarte
//I think I may start focussing on a McDonald's theme for everything.
//used the 'easing' code given to us in class
//Very image-heavy, framerate slows down on my computer

PImage mcD,hamB,arch,fry,moon,bigM,soda;
float i;
int x,fx,mx,bx,cx;

//easing
float rx,ry;
float dx,dy;
float easing;


void setup(){
  noCursor();
  background(255);
  smooth();
  size(1000,1000);
  mcD = loadImage("ronald.png");
  hamB = loadImage("hamburglar.png");
  arch = loadImage("arches.png");
  fry = loadImage("fries.png");
  moon = loadImage("moon.png");
  bigM = loadImage("bigmac.png");
  soda = loadImage("coke.png");
  imageFlip(hamB,0,50,"v2");
  imageFlip(moon,0,500,"v2");
  imageFlip(bigM,0,700,"h2");
  imageFlip(soda,0,900,"h2");
  
   //easing
   rx = 0;
   ry = 0;
   easing = .05;

}

void draw(){
  smooth();
  background(255);
  
  //easing ronald
    dx = mouseX-rx; //must be in draw loop
  dy = mouseY-ry;
  rx = rx + dx * easing;
  ry = ry + dy * easing;
  image(mcD,rx,ry);
  
  //begin patterns:
  
  for(int i=0;i<width;i+=100){ //hamburglar P1M1 pattern
    image(hamB,i,25,100,100);
    }

//

  for(int x=0;x<width;x+=100){ //arches P112 Pattern
    image(arch,x,175,50,50);
      if(x % 10 == 0){
      imageFlip(arch,-400,250,"v");
      imageFlip(arch,-400,250,"h");
       }  
    }
  //The P112 pattern is subtle, you have to look at the shadow on the arch to
  //see that it isn't symmetrical
  
//
    
  for(int fx=0;fx<width;fx+=75){ //fries P1G1 pattern
    image(fry,fx,275,75,75);
      if(fx % 25 == 0){
        imageFlip(fry,-300,300,"v");
      }
  }
  //This P1G1 pattern is also subtle, the fries are technically not symmetrical

//

  for(int mx=0;mx<width;mx+=175){ //PMM2 Pattern MOON
    image(moon,mx,375,125,125);
      if(mx % 25 == 0){
        imageFlip(moon,-200,500,"h");
      }
  }
  
  for(int bx = 0; bx < width; bx+=50){ //PM11 Big Mac pattern
    image(bigM,bx,525,50,50);
  }

  for(int cx = 0; cx < width; cx+=100){ //PMG2 Soda pattern
    image(soda,cx,750,100,100);
      if(cx % 20 == 0){
        imageFlip(soda,-400,750,"v");
      }
  }
//
  for(int i=0;i<width;i+=200){ //ronald P111 pattern
    image(mcD,i,600,150,150);
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


