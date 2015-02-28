
Rain[] rain = new Rain[500];
boolean stopRain = false;
PImage img0; 
void setup() {
  size(700, 525);
  smooth();
img0 = loadImage("2011_0914Interactivity0046.jpg");
 
  for(int i = 0; i < rain.length; i++) {
    rain[i] = new Rain(random(width), random(height),random(2, 5));
  }
}
 
 
void draw() {
  image(img0,0,0);
  for(int i = 0; i < rain.length; i++) {
    rain[i].move();
    rain[i].display();
  }

}
 
class Rain {
  float x, y, s;
 
  Rain(float _x, float _y, float _s) {
    x = _x;
    y = _y;
    s = _s;
  }
 
 
  void move() {
    y += s;
    if (y > height){
      if (stopRain == false)
        y = 0;
      else if (stopRain == true)
        y = height;
    }
  }

  void display() {
    stroke(#FAFBFC,random(100,255));
    line(x,y,x,y + random(20)); //amount of rain
    
    if(keyPressed){
   if(key == '1'){ //increase rain
     frameRate(100);
   }
 }
    if(keyPressed){
   if(key == '2'){ //increase rain
     frameRate(150);
   }
 }
     if(keyPressed){
      if(key == 's'){ //stop
      //frameRate(100);
      stopRain = true;
   }
 }
    if(keyPressed){
   if(key == 'r'){ //start
     //frameRate(150);
     stopRain = false;
   }
 }
  }
}


