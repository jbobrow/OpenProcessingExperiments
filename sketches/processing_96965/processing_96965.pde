
int playerX = 250;
int playerY = 250;


int max_glow_Images = 20; // Total # of images
int imageIndex_glow = 0; // Initial image to be displayed is the first
PImage[] glow_images = new PImage[max_glow_Images]; //for glow sequence images 

int max_wall_Images = 69; // Total # of images
int imageIndex_wall = 0; // Initial image to be displayed is the first
PImage[] wall_images = new PImage[max_wall_Images]; //for glow sequence images 


boolean glow = false;
boolean wall_intact= true;






void setup(){
     size(500,500);
     smooth();
     frameRate(30);
     
     
     
     
     
    for (int i = 0; i < 69; i++){
  
        wall_images[i] = loadImage("wall_animation" +  nf(i,2)  + ".png"); 
     }
     
     
         for (int i = 0; i < glow_images.length; i++){
  
        glow_images[i] = loadImage("glow" +  nf(i,2)  + ".png"); 
     }

  
}


void draw(){
 

 background(50);
 
 fill(40,96,136);
 rect(0,250,500,250);
 
  imageMode(CENTER);
  
  
  image(glow_images[imageIndex_glow],playerX,playerY);
  imageIndex_glow = (imageIndex_glow + 1) % glow_images.length;

 
   
  //wall_break_animation
  
  if(glow && playerX > 330){
     

  
    
    image(wall_images[imageIndex_wall],400,200);
  
    if(imageIndex_wall < 68){
    
    imageIndex_wall = (imageIndex_wall + 1) % wall_images.length;
    

  
  }
   
    
    
  }
  
  
  
  
  else if(imageIndex_wall == 0){
  
  image(wall_images[0],400,200);
}

  else if(imageIndex_wall == 68){
  
  image(wall_images[68],400,200);
}

  //if(wall_intact = false){
    
   // image(wall_images[68],400,200);
   // println("wall is broken");
    
  //}
 
 
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
  
  glow = false;
  
 }
 
 
// if(keyCode == DOWN){
   
   //playerY = playerY + 5;
   
 //}
 
 
 if(keyCode == RIGHT){
   
   if(!glow && playerX > 340 && imageIndex_wall == 0){
     
     playerX = playerX;
     
   }
   
   else{
   
   playerX = playerX + 5;
   
   }
   
 }
 
 if(keyCode == LEFT){
   
   playerX = playerX - 5;
   
 }
   
 if(keyCode == ' ' && !glow){
   
   glow = true;
   
   println("glow is on");
   
 }
 

 

  
  
}


//void keyReleased(){

  //if(keyCode == ' '){
    
   // glow = false;
    
  //}
  
//}



