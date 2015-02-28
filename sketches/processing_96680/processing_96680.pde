
int playerX = 250;
int playerY = 250;


int maxImages = 20; // Total # of images
int imageIndex = 0; // Initial image to be displayed is the first
PImage[] glow_images = new PImage[maxImages]; //for glow sequence images 


boolean glow = false;






void setup(){
     size(500,500);
     smooth();
     frameRate(30);
     
     
     
     
     
    for (int i = 0; i < glow_images.length; i++){
  
        glow_images[i] = loadImage("glow" +  nf(i,2)  + ".png"); 
     }

  
}


void draw(){
 

 background(50);
 
  imageMode(CENTER);
  image(glow_images[imageIndex],playerX,playerY);
  imageIndex = (imageIndex + 1) % glow_images.length;

 
 
 
 
 if(glow){
   
    float glow_amount = round(map(sin(millis()/150), -1,1, 128,255));

    fill(glow_amount,0,0);
    
 }
 
 else{ fill(128,0,0);}
 
 
 ellipseMode(CENTER);
 
 ellipse(playerX,playerY,50,50); //draws the 'player'
  
  
}

void keyPressed(){
  
 if(keyCode == UP){
  
  playerY = playerY - 5;
  
 }
 
 
 if(keyCode == DOWN){
   
   playerY = playerY + 5;
   
 }
 
 
 if(keyCode == RIGHT){
   
   playerX = playerX + 5;
   
 }
 
 if(keyCode == LEFT){
   
   playerX = playerX - 5;
   
 }
   
 if(keyCode == ' '){
   
   glow = true;
   
   println("glow is on");
   
 }
 

  
  
}


void keyReleased(){

  if(keyCode == ' '){
    
    glow = false;
    
  }
  
}


