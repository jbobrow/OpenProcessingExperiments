

float speed = 18;
float x;
float y;
void setup() {
  size(400,400);
  smooth();
  x=width/2;
  y=height/2;

  frameRate(30);
}

void draw () {
  {
    int mySecond = second();  // Values from 0 - 59
    int myMinute = minute();  // Values from 0 - 59
    int myHour = hour();

    x += random(-speed, speed);
    y += random(-speed, speed);
    x = constrain(x, 0, width);
    y = constrain(y, 0, height);

  
    stroke(0);
    fill(255, 0, 0, 225); //red
    rect(x,y,myHour,myHour);
    translate(0,-100);{
    fill(0, 0, 255, 155);} //blue
    rect(x, y,myMinute , myMinute); 
    {translate(-100,0);}
    
    x += random(-speed , speed);
    y += random(-speed, speed);
    x = constrain(x, 0, width);
    y = constrain(y, 0, height);
     
    
   
    stroke(255);
    strokeWeight(2);
    
    fill(250,255,15,55); //yellow
  
    
    rect (x,y,mySecond*4,mySecond*4);}
    
    
    
    

 
    }



