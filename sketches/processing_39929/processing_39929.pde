
/*Daniela Gill
Assignment 3 / 09_30_11 
Classes 
*/
  
 
int numberofballs = 80;
int hueIndex = 0;

BallClass[] balls;
//float x, xspeed, y, yspeed;
 
void setup(){
 size(500,500);
 smooth(); 
 colorMode(HSB, 360, 100, 100);
  balls = new BallClass[numberofballs];
  for(int i=0; i<numberofballs; i++) {
    balls[i] = new BallClass();
  }
}
 
void draw(){
    
    fill(0,25);
    rect(0,0,width,height); // to leave trail
     
    for(int i=0; i<numberofballs; i++) {
    //balls[i].moveIt();
    balls[i].drawIt();
}
  
  //making the color change
  
  if (hueIndex < 360){ 
    hueIndex++;
  } else {
    hueIndex =0;
  }

      
    }
     
class BallClass {
  float x=50.0;
  float xspeed;
  float y=50.0;
  float yspeed;
  float r=random(15,80);
  float a=random(15,45);
 
 
  BallClass() {
    xspeed = 3+random(-3,3);
    yspeed = 5+random(-3,3);
  }
 
  void drawIt() {
    noStroke();
    fill(hueIndex, 100, 100);
    x=x+xspeed;
    y=y+yspeed;
     
    if (x > width-50){
      xspeed = xspeed*-1;
    } else if(x < 50){
      xspeed = xspeed*-1;
    }
     
    if (y > width-50){
      yspeed = yspeed*-1;
    } else if(y < 50){
      yspeed = yspeed*-1;
    }
    ellipse(x,y,r,r);     
  }
  
}

