
//use space key to initialize the movement
//the directions and sizes of stars changes every time the mouse shift around the center area
//no star will escape from the frame



float xmoonSize;
float ymoonSize;

PImage moonimg;
PImage starimg;

star[] starList = new star[100];

float d; 


void setup(){
  size(800, 800);
  smooth();
  xmoonSize = 30;
  ymoonSize = 36;
  for (int i=0; i<starList.length; i++){
    starList[i]= new star();
  }
  starimg = loadImage("star.png");
  moonimg = loadImage("moon.png");
}



void draw(){
  background(0);
  smooth();  
  for (int i=0; i<starList.length; i++){
    starList[i].update();
    d=dist(starList[i].xPos, starList[i].yPos, starList[i].xPos, starList[i].yPos);
    //I am trying to make every single object in the class repel each other so they would not overlap
    //but clearly this is not the solution code
  }
  
  image(moonimg, mouseX-xmoonSize/2, mouseY-ymoonSize/2, xmoonSize, ymoonSize);
  
}


class star{
  
  PImage img;
  float xPos = width/2;
  float yPos = height/2;
  float xVel;
  float yVel;
  float xSize = 20;
  float ySize = 30;
  
  
  star(){
    //xPos = width/2;
    //yPos = height/2;
    xVel = random(-2, 2);
    yVel = random(-2, 2);
    //xSize = 20;
    //ySize = 30;
  }
  
  
  
  void update(){
    image(starimg, xPos, yPos, xSize, ySize);
    move();
    
    if (d>50){
      xVel*=-1;
      yVel+=-1;
    }
    
  }
  


void move(){
  keyPressed();
//  if(d<ySize){
//  xVel*=-1;
//  yVel*=-1;
//  }  
}
 
void keyPressed(){
  if(keyCode == ' '){
    if(((mouseX<420)&&(mouseX>380))||((mouseY<420)&&(mouseY>380))){
    xPos += xVel;  
    yPos += yVel;
    //xSize +=0.3;
    //ySize +=0.3;
  }else{
   xPos -= xVel;
   yPos -= yVel; 
   //xSize -=0.3;
   //ySize -=0.3;
  }
  
  if((xPos>= width-10 || yPos>= height-10)||(xPos<=0 || yPos<=0)){
     xVel*=-1;
     yVel*=-1; 
  }
  }
  
  if(keyCode == 'R'){
    xPos = width/2;
    yPos = height/2;
  }
  
}
  
  
  
}


