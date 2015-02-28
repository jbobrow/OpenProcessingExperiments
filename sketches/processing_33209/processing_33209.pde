
PImage airplane;
PImage cloud;
int airX = 500;
int airY = 250;
int cloudYA = round(random(0, 400));
int cloudYB = round(random(0, 400));
int cloudYC = round(random(0, 400));
int cloudXA = 0;
int cloudXB = 300;
int cloudXC = 400;
int airVelX = 5;
int cloudVelX = 1;
void setup(){
  size (500, 500);
  background (86, 206, 209);
  airplane = loadImage("airplane.png");
  cloud = loadImage("cloud.png");
  frameRate(30);
}

void draw(){
   background (86, 206, 209);
   if(airX == 0){
    airX = 500;
    airY = round(random(0, 400));
   }
   
   image(airplane, airX, airY);
   
   airX = airX - airVelX;
   
    if(cloudXA == 500){
    cloudXA = 0;
    cloudYA = round(random(0, 400));
   }
   
   image(cloud, cloudXA, cloudYA);
   
   cloudXA = cloudXA + cloudVelX;


    if(cloudXB == 500){
    cloudXB = 0;
    cloudYB = round(random(0, 400));
   }
   
   image(cloud, cloudXB, cloudYB);
   
   cloudXB = cloudXB + cloudVelX;


    if(cloudXC == 500){
    cloudXC = 0;
    cloudYC = round(random(0, 400));
   }
   
   image(cloud, cloudXC, cloudYC);
   
   cloudXC = cloudXC + cloudVelX;
}
   
  

