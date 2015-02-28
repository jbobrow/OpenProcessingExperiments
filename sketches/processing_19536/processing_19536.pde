
boolean end=false;

float x;
void setup(){
  size(250, 250);
  noStroke();
  smooth();
  frameRate(60);
}
 
void draw(){
  background(25, 100, 200);
  x=x+0.4;
  translate(20*sin(x/20), x);
  fill(164, 218, 210);
  bezier(25, 210, 100, 35, 150, 135, 130, 0);
  bezier(25, 210, 100, 35, 50, 35, 130, 0);
  
  x=x+0.4;
  translate(20*cos(x/20), -2*x); //-2*x means it is going twice the 
  //speed backwards, otherwise it would be going twice the speed forwards
  //because of translate appearing twice in this code
  fill(164, 218, 210);
  bezier(225, 250, 225, 250, 100, 175, 130, 140);
  bezier(225, 250, 225, 250, 175, 150, 130, 140);
  if (x>250)
  {
    end=true;
  }
}

void mouseClicked()
{
  if(end==true)
  {
    x=0;
    end=false;
   
    //if you want for the mouse to be able 
    //to click for restart before the show ends, then delete:
    //end=false; 
    //after x=0 and change if(end==true) to: 
    //if(end==false)
    
  }
}
  

