
//float xDistance, yDistance;
float frameHeight = 600;
float frameWidth = 900;
float xPos;
float yPos;
float frames = 0;
float frames2 = 0;
float idle = 1;
float idleSpeed = 25;
float acc = .04;
float speed = 2;
float distance;
float frames3 = 0;
int mouseOn=0;

void setup(){
//  background(20);
  size(900,600);
//  strokeCap(SQUARE);
//  stroke(235);
  xPos = frameWidth/2;
  yPos = frameHeight/2;
}

void draw(){
  background(30);
  frames++;
  if(frames>=idleSpeed*4){
    frames=0;
    idle=1;
    }
  else if(frames>=idleSpeed*3){
    idle=-1;
  }
  else if(frames>=idleSpeed*2){
    idle=1;
  }
  else if(frames>=idleSpeed){
    idle=3;
  }
  else if(frames>=0){

    idle=1;
  }
  frames3++;
  if(frames3>=30){
    frames3=0;
  }
  distance=sqrt((xPos-mouseX)*(xPos-mouseX)+(yPos-mouseY)*(yPos-mouseY)); //"Beeps"
  if(mouseOn==1){  //start of mousePressed
    if(frames3>15){
      ellipse(xPos-1+17,yPos-1+idle-43,30,30);
    }
    else{
      ellipse(xPos-1+17,yPos-1+idle-43,20,20);
    }
    idle=1;
    frames=0;


    if(distance>=speed){
    xPos=xPos+speed*(mouseX-xPos)/distance+(mouseX-xPos)*acc;
    yPos=yPos+speed*(mouseY-yPos)/distance+(mouseY-yPos)*acc;
  }  
  
/*    if(xPos>mouseX+speed){ //move strangely
      xPos=xPos-speed;
    }
    else if(xPos<mouseX-speed){
      xPos=xPos+speed;
    }
    if(yPos>mouseY+speed){
      yPos=yPos-speed;
    }
    else if(yPos<mouseY-speed){
      yPos=yPos+speed;
    }
*/

//    xPos=xPos+(mouseX-xPos)*acc; //travel quicker when further from mouse
//    yPos=yPos+(mouseY-yPos)*acc;

//    xPos=(mouseX+xPos)/2
//    yPos=(mouseY+yPos)/2; //average

  } // end of mousePressed
  
  frames2++;
  if(frames2>=360){
    frames2=0;
  }
  fill(235);
  noStroke();
  ellipse(xPos-1,yPos-1+idle,50,50);
  fill(50);
  arc(xPos-1,yPos-1+idle,40,40, 0+radians(frames2), 3*QUARTER_PI+radians(frames2));
  fill(235);
  arc(xPos-1,yPos-1+idle,30,30, 0-1+radians(frames2), 3*QUARTER_PI+1+radians(frames2));
  fill(50);
  ellipse(xPos-1,yPos-1+idle,10,10);
  stroke(235);
  strokeWeight(2);
  
/*  if(frames>=idleSpeed*2){
    ellipse(xPos-1+17,yPos-1+idle-43,30,30);
    ellipse(xPos-1+17,yPos-1+idle-43,20,20);

  }
*/

  line(xPos-1+17,yPos-1+idle-18,xPos-1+17,yPos-1+idle-43);
  ellipse(xPos-1+17,yPos-1+idle-43,10,10);
}

void mousePressed(){
  mouseOn=1;
}

void mouseReleased(){
  mouseOn=0;
}


