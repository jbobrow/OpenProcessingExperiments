
//Richard May rwmay@andrew.cmu.edu
//hw#4
//Copyright September 2012
//key board and mouse input
//starting from scratch 
//Move Mouse to Control Position of Red Trail and be chased by the Green Tail.
//Click a mouse button to have the blue trail chanse you as well. Click again to increase its speed.
//Moving Mouse Also affects lines and sliders.
//Hold Space to add more lines.


float x,y,lX,lY,sX,sY,incB,rX, rY,gY,gX, wd, ht, randX, randY, inc, buf,count,runX, runY;


void setup ()
{
  background (255,255,255);
  count = 1;
  size (1000,1000);
  randX = random (0,width + buf);
  randY = random (0,height + buf);
  inc = 4;
  runX = random (0, width);
  runY = random (0, height);
  noCursor();
  rX=5;
  rY=5;
  gX=5;
  gY=5;
  incB=0;
  x=0;
  y=0;
}

void draw ()
{
  fill(255,255,255,1);
  rectMode(CENTER);
  //rect(.5*width, .5*height, width, height);
  
  if (randX == mouseX && randY == mouseY){
inc=inc+1;
    
  }
  
  
  
//Red Mouse Tracker
  stroke(255,random (0,255),random (0,255), 40);
  ellipse (mouseX,mouseY,rX,rY);
  strokeWeight(random (1,10));
  

//Green Follower Code
stroke(random (0,255),255,random (0,255), 40);
ellipse (randX, randY, gX + buf,gY + buf);

  if (randY < mouseY){
    randY = randY + inc;
  }
  else if (randY > mouseY) {
    randY = randY - inc;
  } 
  if (randX > mouseX){
     randX= randX -inc;
  }
  else if (randX < mouseX){
    randX = randX + inc;
  }
  
  
  
//  if (randX == mouseX && randY == mouseY){
//    count = count + 1;
//    
    //    buf = 1;
//    buf = buf + 20;
//  }
  //else {
 // }
  
  
    
  textSize(30);
  stroke(0,0,0);
  text ("frameCount/60" , 20,20);
  
   
   
   
  
  
  
  
  
 
  
    
 //if (mouseX - 10 < runX < mouseX +10 && mouseY - 10 < runY < mouseY + 10){ 
   
////   runX = runX + random (-.1*mouseX, .1*mouseX);
////   runY = runY + random (-.1*mouseY, .1*mouseY);
//   for (0<runX;runX<width;0<runY;runY<height){
  
 

    
//Blue Tracker
  stroke(random (0,255),random (0,255),255, 5);
  //for (0<runX<width; 0<runY<height;){
  ellipse (runX, runY, 10, 10); 
 
   
     if (runY < mouseY){
      runY = runY + incB;
    }
    else if (runY > mouseY) {
      runY = runY - incB;
    } 
    if (runX > mouseX){
       runX= runX - incB;
    }
    else if (runX < mouseX){
      runX = runX + incB;
    }
    
//line backdrop
stroke(0,60,80,3);
line (width-pmouseX,pmouseY,pmouseX,height);


if (keyPressed == true){
  stroke(10,220,50,3);
  line (lX+random(20,60),lY+pmouseY*.2,sX-random(20,60),sY+pmouseY*.2);
// lX+pmouseY,lY
}
//Orange Switch Back
fill(0,0,0,15);
rect(0,pmouseX,random(0,20), 20);
rect(width,height-pmouseX,random(0,20),20);
lX=0;
lY=pmouseX;
sX=width;
sY=height-pmouseX;
fill(230,160,0,10);
noStroke();
ellipse (.5*width+x,.5*height+y,10,10);
  if (pmouseX > .5*width){
    x=x+1;
  }else{
    x=x-1;
  }
  if(pmouseX>.5*width){
    y=sY-10;
    y=y+random (1,3);
  }else{
    y=lY;
    y=y-random (1,3);
  }



//wipe rects
fill(225,225,225,5);
noStroke();
rect(0,.5*height,30,height);
rect (width,.5*height,30,height);
  
  
  }
  //Blue Acceleration
  void mouseClicked(){
    incB=incB+1;
  }








