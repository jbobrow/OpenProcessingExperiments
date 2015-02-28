
//HangBing Deng

//ARTD 252 Spring 2013, 951125538

//P3: "Moment at Oregon coast

//My project 3 is about to show people how I flet at the moment when I was at the coast of Oregon
//enjoying the relaxing time that those clouds had broguht to me. At the time, each peice of clouds 
//has a single word to me. All of those works together fuel positive energy into me. The reason I created 
//this piece is to share that feeling with others, and let more and more feel that peaceful time.
PImage cloud;
PImage cloud2;
PImage cloud3;
PImage coast;
float cloudposition=800;
float cloud2position2=0;
float cloud3position3=0;
float direction = -1;
float direction2 = 1;
float direction3 = 1;


void setup(){
  size(800,600);
  cloud=loadImage("cloud.png");
  cloud2=loadImage("cloud2.png");
  cloud3=loadImage("cloud3.png");
  coast=loadImage("coast.jpg");
 
 
}
  
  void draw(){
     coast.resize(800,600);
     //I put my backgroud to be the picture I took when I was there, in order to create a space
     //in this piece.
    background(coast);
    
    //In order to make more domastic, I gave the more value for the movement of my clouds,
    //so it will go dissapear and then come back in this picture. And I gave each of my cloud
    //different speed to make it more domestic.
    if(cloudposition > 1000){
      direction = -1;
    }
    if(cloudposition <-200){
      direction = 1;
    }

    cloudposition+= 1.6*direction; 
   if(cloud2position2 > 900) {
      direction2 = -1;
    }
  
    if(cloud2position2 < -200){
      direction2 = 1;
    }
    
    
   cloud2position2+= 1.2*direction2;
   
   if(cloud3position3> 900){
     direction3 = -1;
   }
   
   if(cloud3position3< -100){
     direction3 = 1;
   }
   
   cloud3position3+= 1*direction3;
   
  
   //The size of my cloud are different, it will give people the feeling of different layer of space.

    cloud.resize(200,100);
    cloud2.resize(100,50);
    cloud3.resize(70,35);
   
    image(cloud,cloudposition,150);
    image(cloud2,cloud2position2,130);
    image(cloud3,cloud3position3,80);

  } 
  

  
  void mousePressed(){
    println(mouseX +","+ mouseY);
    
    








  }


