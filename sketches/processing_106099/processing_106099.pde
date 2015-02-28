
float hourX;
float minuteX;
float secondX;


void setup(){
  size (360,360);
  noStroke();

}


void draw (){
  background(360);
  secondX = map(second(), 0, 59, 0, width);
  minuteX = map(minute(), 0, 59, 0, height);
  hourX = map(hour(), 0, 23, 0, width);
  
  colorMode(HSB, 360, 100,100);
  fill(58,97,83, 50);
  rect( 0, 0, hourX, height);
  
  colorMode(HSB, 360, 100,100);
  fill(181,97,83, 50);
  rect( 0, 360-minuteX, width, height);
  
  colorMode(HSB, 360, 100,100);
  fill(316,50,90);
  rect( 0, 360-minuteX, secondX, height);
  
  fill(360);
  rect(hourX,0,width-hourX,height-minuteX);
  
//  colorMode(HSB, 360, 100,100);
//  fill(300,97,83, 50);
//  rect( 0, 0, hourX + 6*(width/12), height);
//  
  
  
}
