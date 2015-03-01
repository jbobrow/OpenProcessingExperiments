
/*
  Tyler Sinclair
  
  This program visualizes 60 seconds with a diamond shaped clock
  HSB color values increasing with each second 
  
  a lil' bit of this code influenced the example show
  
*/

int counter = 0; //counter controls each quadrant of the clock
float startX, startY;  
float currX, currY;  
float destX, destY;  


int duration = 500; //duration in milliseconds
int starttime;      //transition start

  int h = 1;
  int s = 1;
  int b = 1;
 
 
void setup(){
  size(500,500);
   
   startX = 250; //initialize variables
   startY = 250;
   destX = 250;
   destY = 50;
   currX = startX;
   currY = startY;
    
  starttime = millis();  //starting
  
  colorMode(HSB, 60);
}
 
void draw(){
  background(h,s,b);
  noStroke();
  //show the starting + ending positions
  fill(0,0,100);
  ellipse(startX, startY, 10,10);
  fill(0,0,100);
  ellipse(destX, destY, 10,10);
   
  if( millis() < starttime + duration ){  //testing if its done
    fill(0,0,100);
    ellipse(currX, currY, 10,10);  //draw the current position
     
    float xVelocity = (destX - startX) / duration; //calculate speed
    float yVelocity = (destY - startY) / duration;
     
    currX = startX + xVelocity * (millis() - starttime); //calculate position
    currY = startY + yVelocity * (millis() - starttime);
  }else{
    if (counter < 450){//draws first 15 seconds
    startX = 250;
    startY = 250;
    destX += 10.3 ;
    destY += 13.3;
    starttime = millis();
    }else if (counter < 900){//draws 16–30 seconds
    startX = 250;
    startY = 250;
    destX +=  -10.3;
    destY += 13.3;
    starttime = millis();
    }else if (counter < 1350){//draws 31–45 seconds
    startX = 250;
    startY = 250;
    destX += -10.3;
    destY += -13.3;
    starttime = millis();
    } else if (counter < 1725){//draws 46–60 seconds
    startX = 250;
    startY = 250;
    destX += +13.3;
    destY += -13.3;
    starttime = millis();
    }
    h++;
    s++;
    b++;
  }  
  counter++;
  
}



