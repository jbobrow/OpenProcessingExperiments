
int speed;
int xPos, yPos;
int xPos2, yPos2;
float diameter;
float diameter2;


void setup(){
  size(600,600);
  background(59,249,233,80);
  
   xPos = width/2;
   yPos = height/2; 
   xPos2 = xPos;
   yPos2 = yPos;
   
  speed=3;
  stroke(0,200,200);
  fill(0,200,200,50);
  diameter=50;
}

 void draw(){
  rectMode(CENTER);
  rect(100,100,width/2,height/2);
  rect(500,500,width/2,height/2);
  rect(100,500,width/2,height/2);
  rect(500,100,width/2,height/2);
  
  if (mouseX >100 && mouseX<width/2 && mouseY>100 && mouseY<height/2)
  {
 fill(random(255),random(255),random(255),random(255)); 
 }
 else {
    fill(#FFADF4);
 }

ellipse(xPos, yPos, diameter, diameter);
  ellipse(width-xPos, yPos, diameter, diameter);
  
    if(mouseX<width/3){
    xPos-=speed;
    diameter*=1.01;
    }
    
    if(mouseX>width*2/3){
    xPos+=speed;
    diameter/=1.01;
    }
 
 ellipse(xPos2, yPos2, diameter, diameter);
 ellipse(xPos2, -yPos2+height, diameter, diameter);
 
   if(mouseY<height/3){
   yPos2-=speed;
   }
   if(mouseY>height*2/3){
   yPos2+=speed;
   }

    
    
    
}



