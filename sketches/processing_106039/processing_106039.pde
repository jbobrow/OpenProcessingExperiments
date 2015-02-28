
PFont font;

float hourX;
float minuteX;
float secondX;

void setup() {
  size(300,300);
  noStroke();

}

void draw() {
  background(0);
  
  fill(0,255,0);
  

  hourX = map(hour(),-1,23,0,(width-10)); 
  minuteX = map(minute(),0,59,0,(width-10)); 
  secondX = map(second(),0,59,0,(width-10)); 

  fill(65,0,200);
  rect(hourX,0,15,400); 
  fill(200,135,200);
  ellipse(minuteX,width/2,65,65); 
  fill(164,220,240);
  ellipse(secondX, width/2,45,45); 
}
