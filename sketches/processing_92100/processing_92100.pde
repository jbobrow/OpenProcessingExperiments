
int state = 1;
PImage mario;
PImage cloud;
PImage cloud2;
PImage bush;
PImage bullet;
PImage fire;
int x = 0;
int x2 = 0;
int y = -200;
int w = 0;
int v = 60;
int v2 = 500;
int ctr;
int myLoop = 0;


/*int t = 0;
float j = 0;
boolean jumping = false;*/



void setup(){
 size(750,500); 
 frameRate(60);
 
 ctr = 2*60;
 
 background(#5c95fc);
 bullet = loadImage("bullet.png");
 cloud2=loadImage("cloud.png");
 cloud=loadImage("cloud.png");
 bush=loadImage("bush.png");
 mario=loadImage("mario.png");
 fire = loadImage("fire.png");
  
}


void draw(){
  
  background(100);
  
  switch(state){
    
   case 1:
   println("case1");
   background(#5c95fc);
   v--;
   v2--;
   //image(mario, 560,320);
   image(bush,200,320);
   image(cloud2,v,0);
   image(cloud,v2,60);
   if (v < -300){
    v = 580; 
   }
   
   if(v2 < -300){
    v2 = 500; 
   }
   
   ctr--;
   if (ctr < 0){
    state = 2;
   ctr = 5*60; 
   }
   break; 
    
    
    
   case 2:
   println("case2");
   background(#5c95fc);
   y++;
   if (y > 320){
     y = 320;
   }
   
   v--;
   v2--;
   image(bush,200,320);
   image(cloud2,v,0);
   image(cloud,v2,60);
   image(mario,560,y);
   if (v < -300){
    v = 580; 
   }
   
   if(v2 < -300){
    v2 = 500; 
   }
   
   if (y > 319){
     x = 560;
    state = 3;
    
   }
   
   break;
 
 
   case 3:
   println("case3");
   background(#5c95fc);
   v--;
   v2--;
   x--;
   image(bush,200,320);
   image(cloud2,v,0);
   image(cloud,v2,60);
   image(mario, x,320);
   if (v < -300){
    v = 580; 
   }
   
   if(v2 < -300){
    v2 = 500; 
   }
   
   if (x < -300){//Mario
    x = 560;
   myLoop++; 
   }
   
   if (myLoop > 0){
    state = 4;
   myLoop = 0; 
   }
   
   break;
   
   
   case 4:
   println("case4");
   background(#5c95fc);
   v--;
   v2--;
   x--;
   x2++;
   image(bush,200,320);
   image(cloud2,v,0);
   image(cloud,v2,60);
   image(mario, x,320);
   image(bullet, x2, 320);
   if (v < -300){
    v = 580; 
   }
   
   if(v2 < -300){
    v2 = 500; 
   }
   
   //if (x < -300){
   // x = 560;
   
   
    //println(mouseX);
    if(x < 360){
     x = 360; 
     
    }
    
   
   if (x2 > 250){
    x2 = 250; 
    state = 5;
    
   }
   
   if (myLoop > 1){
    state = 5;
   myLoop = 0; 
   }
   
   break;
   
   
   case 5:
   println("case5");
   background(#5c95fc);
   image(bush,200,320);
   image(cloud2,v,0);
   image(cloud,v2,60);
   image(fire, 360,320);
   
    ctr--;
   if (ctr < 0){
    state = 1;
   ctr = 5*60; 
   }
  
   break;
    
  }  
}

void mousePressed() {
  state++;
  if(state > 5){
   state = 1; 
  }
 }
  


/*void keyPressed(){
  if ((key == 'j') ||(key == 'J')){
   t = 0;
  j = 0;
 jumping = true; 
    
  }
}*/


