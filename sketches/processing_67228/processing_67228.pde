
PFont font;

float hourX;
float minuteX;
float secondX;

void setup(){
  size(500,300);
  noStroke();
  font= loadFont("Ayuthaya-20.vlw");
}

void draw(){
  background(255);
  fill(0);
  textFont(font);
  
  hourX= map(hour(), 0,23,0,(height-60));
  minuteX= map(minute(), 0,59,0,(height-20));
  secondX= map(second(), 0,59,0,(height-5));
  
  
  
  fill(255,85,255,150);
  rect(0,0,width,hourX);
   text(hour(),70,hourX);
  fill(250,255,126,240);
  rect(0,minuteX,width,30);
   text(minute(),90,minuteX);
  fill(92,228,226,240);
    text(second(),130,secondX);
  rect(0,secondX,width,5);
  

}

