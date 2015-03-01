
//Nick Kreuter
//DMS 110
//Hw 1
//2.2.15

int x = 1;
int y = 0;
void setup(){
  //executed only once
  size(200,200);//Block size
  background(255,0,0);// Background color 
  frameRate(45);// frames per second (speed)
}

void draw(){ 
  //executed every frame
  rect(x,y,20,20);//(x,y,height,width)
  fill(0,0,255);//color of small box
  x= x + 86;//determines pattern of x
  x= x%300;// allows for multiple diagionals
  y = y + 86;//determines pattern of y
  y= y%300;
 
}

