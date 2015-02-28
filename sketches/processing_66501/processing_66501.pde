
PFont topp;
float d;
float xVel;
float yVel;
float xPos;
float yPos;
PFont L;
PFont M;




void setup() {

  size(600,600);
  background(255);
  smooth();
  fill(0);
   L= loadFont("dandelioninthespring-48.vlw");
   M= loadFont("WaltDisneyScriptv4.1-48.vlw");
   

 
  d = random(20,20);
  xPos = random (d/2, width - (d/2));
  yPos = random (d/2, height - (d/2));
  xVel = random (-5,5);
  yVel = random (-5,5);
  

}

void draw()  {
  
  background(255);
  topp = loadFont("Serif-20.vlw");

 textFont(topp);
 text("speed+",width/2,20);
 text("color",width/2,height);
 text("speed-",width-50,height/2);
 text("size",0,height/2);
 
  xPos = xPos + xVel;
  yPos = yPos + yVel;


if(xPos <= (d/2)) 
 {   
   d=random(20,40);
   xVel  = xVel*(-1);
 
   
 }


 if(yPos <= (d/2)){
  
  xVel+= 10;
  yVel = yVel*(-1);
  
  } 

if(xPos >= width-(d/2)){
  yVel-= 10;
  xVel = xVel*(-1);

}

 if(yPos >= height-(d/2)){
  yVel = yVel*(-1);
fill(random(0,255),random(20,100),random(100,200));
 
}
if (mouseX>=width/2&&mouseY>=height/2){
  textFont(L);
   text("You can't~~~",100,200);}
else 

   {textFont(M);
   text("Catch me!!!",400,100);
  }
    ellipse(xPos,yPos,d,d);

}
  




