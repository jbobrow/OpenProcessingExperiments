
int x = 0;
int y = 0;
int x_speed = 3;
int y_speed = 3;
int stoptime = 0;

public void setup() {
  //do not change, this is fixed for LED screens.
  size(512, 160);  
  //do not change, this is the refresh rate of LEDs.
  frameRate(8);    
}

void draw() {
  background(0); //keep background black (LEDs are brightness based)
  stroke(255,0,0); //LEDs are on the scale of red
  fill(255,0,0);   //LEDs are on the scale of red

  //----DO WHATEVER YOU LIKE BELOW-----
  //(do not make it interactive, since people won't be able to use mouse/keyboard on a bus stop--
  rectMode(CENTER);
  //making line
  rect(width/2,40,512,1);
  rect(width/2,120,512,1);
  //making bus stops
  rect(width/2,25.7,40,20);
  rect(width/2,135.3,40,20);
  //making buses
  

if(x>=0 && x<width){
    x=x+x_speed;
  }
  else{
    x=0;  
}
if(x==width/2){
  x_speed=0;
  stoptime++;
}
if(stoptime==60){
  x_speed = 1;
  stoptime =0;
}
 
 rect(x,54.7,60,30);
 if(y>=0 || y<width){
    y=y-y_speed;
  }
  else{
    y=width;  
  }

 rect(y+width,105.3,60,30);
}




  





  





  





  








