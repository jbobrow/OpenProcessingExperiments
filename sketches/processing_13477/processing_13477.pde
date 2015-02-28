
void setup() {
  size(640,480);
  smooth();
  background(184,206,38);
 

  noStroke();
}
void draw() {
  background(184,206,38);
if(mousePressed==true)
{
  
  fill(255);
  ellipse(mouseX-25,mouseY,75,30);
  fill(185,32,32);
  ellipse(mouseX-22.5,mouseY,30,30);
  fill(0);
  ellipse(mouseX-23,mouseY,6,6);
}
else{
  
  background(184,206,38);
  fill(255);
  ellipse(mouseX-25,mouseY,60,60);
 // fill(48,144,206);
   if((mouseX>=320)  && (mouseY<=240))
 
    fill(24,97,180,200);
    if((mouseX <= 320) && (mouseY <=240)  )
  
    fill(255,0,0,200);
    
    if((mouseX<=320)  && (mouseY>=240))
  
     fill(0,100,0,200);
    
    if((mouseX>=320)  && (mouseY>=240))
  
  
    fill(24,45,200,100);
    
    
  ellipse(mouseX-22.5,mouseY,30,30);
  fill(0);
  ellipse(mouseX-23,mouseY,6,6);
}


  if(mousePressed== true)
  {
    fill(255);
    ellipse(mouseX + 25, mouseY, 60,60);
    fill(185,32,32);
    ellipse(mouseX +22.5,mouseY,30,30);
    fill(0);
    ellipse(mouseX+ 23,mouseY,6,6);
    fill(0);
   
  }
  else {
    fill(255);
    ellipse(mouseX + 25, mouseY, 60,60);
   // fill(48,144,206);
     if((mouseX>=210)  && (mouseY<=180))
 
    fill(24,97,180,200);
    if((mouseX <= 210) && (mouseY <=180)  )
  
    fill(255,0,0,200);
    
    if((mouseX<=210)  && (mouseY>=180))
  
     fill(0,100,0,200);
    
    if((mouseX>=210)  && (mouseY>=180))
  
  
    fill(24,45,200,100);
    
    ellipse(mouseX +22.5,mouseY,30,30);
    fill(0);
    ellipse(mouseX+ 23,mouseY,6,6);
    fill(0);
  }
  //if(mousePressed== true)
  {
 // ellipse(mouseX,mouseY+ 50, 30, 15);
  }
 
}

//if you actually read all of my code you wasted a lot of
//time and need to get out more.


