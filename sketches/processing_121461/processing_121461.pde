
float min;
float seconds;
int minutes;
int f;
Sky day;
Sky noon;
void setup(){
  size(640,480);
  noStroke();
  smooth();
  seconds = 0;
  minutes = 0;
  day = new Sky(width,height);
  day.setPalette(day.m1,day.m2,day.palette);
  min = 0;
  f = 0;
}

void draw(){
  f++;
  seconds = millis()/1000;
  if(seconds > 1 && seconds % 60 == 0){
    seconds -= 60;
  }
  minutes = int(seconds / 60);
//  println(minutes + ":" + seconds);
  day.updateTime(seconds);
  day.display();
  if( seconds/60 >= min +.2 && seconds/60 < min +.4)
    day.changePalette(day.n1,day.n2);
  if( seconds/60 >= min +.4 && seconds/60 < min +.6)
    day.changePalette(day.e1,day.e2);
  if( seconds/60 >= min +.6 && seconds/60 < min +.8)
    day.changePalette(day.d1,day.d2);
  if( seconds/60 >= min +.8 && seconds/60 < min + 1)
    day.changePalette(day.m1,day.m2);
  if(f % 3600 == 0){
    min = min + 1.0; 
  }
  println(min + " " + seconds/60);
}






class Gradient{
//  int posX;
//  int posY;
//  float w;
//  float h;
  color hue;
  
  Gradient(color c1, color c2, float k){
//    posX = x;
//    posY = y;
//    w = wi;
//    h = hi;
    hue = lerpColor(c1, c2, k);
    
  }
  
}
class Sky{
  // need a variable that stores the time being fed into the class.
  float time;
  
  // need colors to cycle throughout the day and night
  color[] palette;
  color[] transition;
  color m1, m2, n1, n2, a1,a2, e1,e2,d1,d2; 
  int wide;
  int high;
  float timeInDay;
  Sky(int w, int h){
    time = 0;
    timeInDay = 4;
    //our morning variables
    m1 = color(25, 200,230);
    m2 = color(200, 255, 255);
    //noon variables
    n1 = color(25,225,190);
    n2 = color(225,255,225);
    //evening variables
    e1 = color(225,160,90);
    e2 = color(25,50,75);
    //dark variables
    d1 = color(75,50,100);
    d2 = color(50);
    
    wide = w;
    high = h;
    palette = new color[h];
    transition = new color[h];
    
  }
  
  void updateTime(float t){
    time = t;  
    
    //println(time/60);
  }
  void changePalette(color next1, color next2){
    setPalette(next1,next2,transition);
    float inter = map(time/60,0,.6,0,.1);
    if (inter > 1.0) inter -= int(inter);
    for(int i = 0; i < transition.length; i++){
      palette[i] = lerpColor(palette[i],transition[i],inter);
    }
    
  }
  
  //USE THIS FUNCTION IMMEDIATELY AFTER THE CLASS IS INSTANTIATED
  // ortherwise none of the other functions will work
  void setPalette(color c1, color c2, color[] myColors){
    for(int i = 0; i < myColors.length; i++){
      float inter = map(i,0,high,0,1);
      myColors[i]= lerpColor(c1, c2, inter);
    }
  }
  void display(){
    for(int i = 0; i < palette.length; i++){
      color now = palette[i];
        stroke(now);
        line(0,i,wide,i);
    }
    
  }
  
}


