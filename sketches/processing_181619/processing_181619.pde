

// spiral moves clockwise and changes color as time passes
// adapted from example in book "Getting Started in Processing" by Casey Reas and Ben Fry

int time1 = 5000;
int time2= 10000;
int time3= 15000;
int time4= 20000;
int time5= 25000;
int time6= 30000;
int time7= 35000;
int time8= 40000;


float angle = 0.0;
float offset = 225; //begins in center
float scalar = .5; // begins spiralling tightly
float speed = .1; //spiraling speed

void setup(){
  size (450,450); //canvas size
  background (255); //white background
  smooth(); //antialiasing
}

void draw(){
  int currentTime = millis();
  float x = offset + cos(angle) * scalar;
  float y = offset + sin (angle) * scalar;
  ellipse (x, y, 5, 5); //circle that makes spiralling shape
  fill (112,119,200);
  noStroke();
  angle += speed;
  scalar += speed;
  
  if (currentTime >= time1){ //as time passes, color changes
    fill(130,87,217);
  }
    else if (currentTime >= time2){
    fill(195,87,217);
  }
  
  if(currentTime >= time3){
    fill(217, 87, 150);
  }
    else if (currentTime >= time4){
    fill(247,92,110);
  }
    
  if(currentTime >= time5){
    fill (242,0,28);
  }
 
   else if (currentTime >= time6){
   fill (242,96,17);
 }
 
 if(currentTime >= time7){
   fill (242, 182, 17);
 }
   else if (currentTime >= time8){
   fill(198,232,30);
 }
 
}


