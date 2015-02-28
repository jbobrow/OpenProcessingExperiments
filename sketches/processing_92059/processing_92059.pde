
int state = 1;
PImage mario;
PImage cloud;
PImage cloud2;
PImage bush;
PImage bullet;
int x = 0;
int x2 = 0;
int y = -200;
int w = 0;
int v = 60;
int v2 = 500;
int ctr;




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
   
   if (x < -300){
    x = 560; 
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
   
   if (x < -300){
    x = 560; 
   }
   
   if (x2 > 500){
    x2 = -300; 
   }
   
   break;
   
   
   case 5:
   println("case5");
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
   
   if (x < -300){
    x = 560; 
   }
   
   if (x2 > 500){
    x2 = -300; 
   }
   break;
    
  }
  
}

void mousePressed(){
  state++;
  if(state > 5){
   state = 0; 
  }
  
  

  }



