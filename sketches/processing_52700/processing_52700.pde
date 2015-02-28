
int mode = 1;
int numLoops;

PImage birds;
PImage birdies;
PImage clouds;
PImage birdcloud;
float x,y,dX,dY,easing;

void setup (){
  size(640,640);
  birds = loadImage("birds.jpg");
  birdies = loadImage("birdies.png");
  clouds = loadImage("clouds.jpg");
  birdcloud = loadImage("birdcloud.jpg");
  
  imageMode(CENTER);
  x = 0;
  y= 0;
  easing = .05;
  numLoops = 1;
  smooth();
}

void draw(){
  if(mode ==1){
  background(birds);
  dX = mouseX - x;
  dY = mouseY - y;
   x = x + dX*easing;
  y = y + dY*easing;
  image(birdies,x,y,55,55);
  
   } else if(mode == 2){
   
    //image(birdies,x,y,random(width),random(height));
    numLoops += 10;
    
   } else if(mode == 3){
      dX = mouseX - x;
  dY = mouseY - y;
   x = x + dX*easing;
  y = y + dY*easing;
  image(birdies,x,y,random(70),random(70));
  smooth();
   }
   }

void keyPressed(){
  if(key == '1'){
  mode = 1;
  } else if(key == '2'){
    mode = 2;
    background(clouds);
    smooth();
    numLoops++;
  } else if(key == '3'){
      mode = 3;
      background(birdcloud);
  }
}

void mousePressed(){
  if(mode == 2){
  image(birdies,random(width),random(height));
   numLoops += 10;
  } else if(mode == 3){
     background(birdcloud);
   }
  }




