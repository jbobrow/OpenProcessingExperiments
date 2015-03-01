
Bowling bowlingball1;

int disp = 0;


PImage img;

//Ball checker;

int holding;
 
void setup()
{
  size (800, 400);
  
  img = loadImage("cursor01.png");
  
  bowlingball1 = new Bowling();
 textSize(25);
  
}
 
 
void draw()
{
  

  
  background(255);
  
  noStroke();
  fill(200,15,0);
  ellipse(width/2,height/2,150,150);
  stroke(255,0,0);
  noFill();
  strokeWeight(10);
  ellipse(width/2,height/2,140,140);
  fill(255);  
  
  text("DO NOT",(width/2)-48,(height/2));
  text("CLICK",(width/2)-38,(height/2)+25);
 
  bowlingball1.update();
  bowlingball1.display();
 

  
  
  
}



class Ball{
float xSpeed;
float ySpeed;
float xPosition;
float yPosition;
float xx,yy;
float xcheck1, xcheck2, ycheck1, ycheck2;
int counter;
float spring;
float rot, frot; 
float dia;
float weight;
PImage basketball;
int rolling = 0;
int parea;
int id;
int mcheck = 0;

  
 Ball(){
  xSpeed = random(10);
  ySpeed = random(10);
  rot = 0;
  frot = rot;  
  xPosition = random(width);
  yPosition = random(height);
  counter = 0;
 }

void update(){  
  


  timer();
  if(counter == 0){
    xcheck1 = xPosition;
    ycheck1 = yPosition;
  }  
  if(counter == 1){
    xcheck2 = xPosition;
    ycheck2 = yPosition;
  }
  

  if(mcheck == 0){
    cursor(ARROW);
    disp = 0;
  }
  if(mcheck == 1){
    noCursor();
    disp = 1;
  }
  

  if(dist(mouseX,mouseY,width/2,height/2) > 75){
    
  if(dist(xPosition,yPosition,mouseX,mouseY)<=1){    
  mcheck = 0;
  }
    
    
    
    rot = 0;
    frot = 0;
   

  rolling = 0;
  
  if(mcheck == 1){
  xPosition += (mouseX - xPosition) *.5;
  yPosition += (mouseY - yPosition) *.5;
    
  }
  if(mcheck == 0){

    xPosition = mouseX;
    yPosition = mouseY;


  }

//println(mcheck);


  
  
  if(counter == 0){
  xSpeed = (xcheck1 - xcheck2)*weight;  
  if((ycheck1 - ycheck2)<0){
  ySpeed = (ycheck1 - ycheck2)*weight;
  }else{
  ySpeed = ycheck1 - ycheck2;
  }
  }
  


  }else{
      

  
  mcheck = 1;
  xPosition = xPosition;
  yPosition = yPosition;
    parea = int(dia);
    
  
  rot+=map(xSpeed,0,width,0,(PI*dia)*(width/(PI*dia)));

  
  frot += (rot - frot) *.5;

  
  ySpeed +=1;
  xSpeed *=.9975;
  xPosition += xSpeed;
  yPosition += ySpeed;
 // changing directions after hitting the right wall
  if (xPosition > width-dia/2)
  {
    xPosition=width-dia/2;
    xSpeed=-xSpeed*spring;
    rolling = 1;
  }
  
// changing directions after hitting the left wall
  if (xPosition<dia/2)
  {
    xPosition=dia/2;  
    xSpeed=-xSpeed*spring;
    rolling = 1;
  }
  
// loosing height after each bounce
  if (yPosition > height-dia)
  {
    yPosition=height-dia;
    ySpeed = -ySpeed*spring;
    rolling = 1;
  }
  
// slow the ball down faster when it is rolling.
  if (yPosition > height-dia-1)
  {
    xSpeed *=.5;
  }
  } 
}

void timer(){
  counter++;

if(counter == 0){
}
if(counter > 1){
  counter = 0;
}
}
}


class Bowling extends Ball{
  
 Bowling(){
  spring = .4;
  dia = 27;
  weight = .5;
  id = 3;
 }
 

 
 void display(){
  focursor(xPosition, yPosition, dia, frot); 
 }
    
}

void focursor(float x,float y,float d,float r){
 pushMatrix();
   translate(x+9.25,y+13.25);
   rotate(radians(r));
   ///
   if(disp == 1){
   image(img, -9.25, -13.25, 13.875, 19.875);
   }
   ///
   popMatrix();  
}




