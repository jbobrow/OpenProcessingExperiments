
PImage cageA; 
PImage cageB; 
PImage bird; 

int clickCount = 0;

int vel = 10; 
int Xvalue = 0; 
int Yvalue = 0; 

int birdvalueX = 0; 
int birdvalueY = 0; 

int cageX = 500; 
int cageY = 500;

int birdX = 500; 
int birdY = 500;

int lighttime = 4000; 
int darktime = 1000; 
int time; 
boolean lightOn = true; 


boolean birdmove = true; 

void setup(){
   size(600,600); 
   background(255,255,255); 
   frameRate(20); 
   smooth(); 
   bird = loadImage("bird.gif");  
   cageA = loadImage("cageA.gif"); 
   cageB = loadImage("cageB.gif"); 
}


void draw(){
  background(255,255,255);
  if(lightOn == true){

background(0,0,0); 
if(darktime <millis() - time){
lightOn =false; 
time = millis(); 
}



}else{
  background(255,255,255); 
  if(lighttime < millis() - time){
  lightOn = true; 
  time = millis(); 
  }
  
  if(birdmove == true){
  
  } 
  
  
  image (bird,birdvalueX,birdvalueY); 
  image (cageA,0,0); 
  image (cageB,Xvalue,Yvalue); 
  
  
   Xvalue = Xvalue +vel; 
   cageX = cageX-vel; 
   cageY = cageY-vel;
   if(Xvalue ==height/2){
vel = - vel;
}
 
else if(Xvalue ==0) {
  vel = - vel;
 
}
 
if(cageY==0){
 vel = - vel;
}
  
  
  
   birdvalueY = birdvalueY +vel; 
   birdX = birdX-vel; 
   birdY = birdY-vel;
   if(birdvalueY == width/2){
vel = - vel;
}
 
else if(birdvalueY ==0) {
  vel = - vel;
 
}
 
if(birdX==0){
 vel = - vel;
}  
  






} 







}
  


void mousePressed(){
  clickCount++; 
  println(clickCount);
  
  if(clickCount == 3){
  fill(0,0,0);
  rect(0,0,600,600);
  }
  
  if(mousePressed){
  background(255,3,3); 
  }

}


