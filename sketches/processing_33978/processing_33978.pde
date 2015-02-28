
//variables//
 
PImage bg_mtns;
PImage bg_mtns_moon;
PImage bear;


//time//
int timeOff = 3000;
int timeOn = 2000;

//this is the data for the switch//
int lastTime;
boolean lightOn= false;


int bearSpeed=2;
int bearX=0;
int bearY=400;

boolean bearMove = false;



//execute once, at program launch// 
void setup(){
  size(800,400);
  background(255);
  frameRate(60);
  smooth();
  
  lastTime = millis();
   
  
  bg_mtns = loadImage("bg_mtns.gif");
  bg_mtns_moon = loadImage("bg_mtns_moon.gif");
  bear = loadImage("bear.gif");
  
  image(bg_mtns, 0, 0);
  
}



// over and over and over //


void draw(){
   
  dayLight_draw();
  image(bear, bearX, 270);
 
  if(bearMove == true){
  bear_loop();
  }
  
}

//day and night//

void dayLight_draw(){
  
  //defines light as on or off//
 if(lightOn == true){
   
  
  if(timeOn < millis() - lastTime){
    lightOn = false;
    lastTime = millis();
    background(255);
    image(bg_mtns_moon, 0,0);
    
    println("night_time");
    
    
  } 
 
 }else{
  
 
  if(timeOff < millis() - lastTime){
    lightOn = true; 
    lastTime = millis(); //storing the current time to use one next loop//
    background(255);
    image(bg_mtns, 0, 0);
    
    println("day_time");
    
  }
 
 
 
 }
}

//moving bear//

void bear_loop(){
  
 
  bearX = bearX + bearSpeed;
  image(bear, bearX, bearY);
  
  if(bearX >= width){
    bearX = 0;
    }

}

void mousePressed(){
 bearMove = !bearMove;
  
  
}





