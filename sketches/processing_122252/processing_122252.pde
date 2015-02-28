
void setup(){
   size(500,500);
   predatorP={10,20};
   preyP={200,100};
   rectMode(CENTER);
   frameRate(1);
   }
   
void draw(){
   background(204);
   
   predatorP={random(0,500),random(0,500)};
   prey={random(0,500),random(0,500)};
     
   predator=rect(predatorP[0],predatorP[1],20,20);
   prey=ellipse(preyP[0],preyP[1],20,20);
   }
