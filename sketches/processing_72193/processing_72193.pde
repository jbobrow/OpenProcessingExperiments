
//Tchunoo Rhee Kahng, andrewID: tkahng
//Hw_4, Tuesday 4 Sep 2012, 48-257 Processing for the Arts
//All materials and images on this code Copyright (c) Tchunoo Rhee Kahng, 2012.

//global variables

float spawnx = 200;
float spawny = 200;
float spawnx_2 = 100;
float spawny_2 = 100;
int ringnum = 5;
int squarenum = 5;
float speedX= random(-5,5);
float speedY= random(-5,5);
float speedX_2= random(-5,5);
float speedY_2= random(-5,5);

void setup(){
  size(400,400);
  smooth();
  
}

void draw(){
  background(150,150,250);
  object_1(spawnx,spawny);
  object_2(spawnx_2,spawny_2);
  
  
}
//-------------------------------------------------------------

void object_1(float xpos,float ypos){
  
  //variables
  
  strokeWeight(2);
  noFill();
  smooth();
    float r = random(0, 100);
 
  float b = random(50, 255);
 
  float g = random(50, 255);
  
  stroke(r,g,b);
  
  //shape
  for(int i = 0; i < ringnum; i++){
   
    ellipse(xpos,ypos,i*10,i*10);
  }
  
  //movement
  spawnx = spawnx+speedX;
  spawny = spawny+speedY;
  
  //bounce
  if(spawnx > width){
         speedX = speedX * -1;
      }
      if(spawnx < 0){
         speedX = speedX * -1;
      }
      if(spawny > height){
         speedY = speedY * -1;
      }
      if(spawny < 0){
         speedY = speedY * -1;
   }
   
   //gravity
   speedY += 0.2;
   
}



  
  
//---------------------------------------------------------------

void object_2(float xpos_2,float ypos_2){
  
  //variables
  
  
  float r = random(0, 100);
 
  float b = random(50, 255);
 
  float g = random(50, 255);
  
  stroke(r,g,b);
  strokeWeight(3);
  noFill();
  smooth();


  
  //shape
  for(int j = 0; j < squarenum; j++){
   
    ellipse(xpos_2,ypos_2,j*10,j*10);
  }
  
  //movement
  spawnx_2 = spawnx_2+speedX_2;
  spawny_2 = spawny_2+speedY_2;
  
  //bounce
  if(spawnx_2 > width){
         speedX_2 = speedX_2 * -1;
      }
      if(spawnx_2 < 0){
         speedX_2 = speedX_2 * -1;
      }
      if(spawny_2 > height){
         speedY_2 = speedY_2 * -1;
      }
      if(spawny_2 < 0){
         speedY_2 = speedY_2 * -1;
   }
   
   //gravity
   speedY_2 += 0.2;
   
}

//___________________________________________________________

 //Controlling Rings and speed
void keyPressed(){
 spawnx = random(5,385);
 spawny = random(5,385);
 spawnx_2 = random(5,385);
 spawny_2 = random(5,385);

 speedX= random(-5,5);
 speedY= random(-5,5);
 speedX_2= random(-5,5);
 speedY_2= random(-5,5);
 //saveFrame("hw6.jpg");
}
