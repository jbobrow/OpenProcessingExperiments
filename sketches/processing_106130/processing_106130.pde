
float hourX;
float minuteX;
float secondX;

void setup() {
  size(600, 600);
  
}

void draw() {
  background(120);
  noFill();
  hourX = map(hour(), 0, 23, 0, (width-10)); 
  minuteX = map(minute(), 0, 59, 0, (width-10)); 
  secondX = map(second(), 0, 59, 0, (width-10)); 
  text((hour() + ":" + minute() + ":"+second()), 10, 20);


  stroke(#68D32B);
  strokeWeight(5);
  ellipse(width/2, height/2, hourX, hourX); 
  stroke(#FF4C1F);
  strokeWeight(3);
  ellipse(width/2, height/2, minuteX, minuteX); 
  stroke(#1C38D3);
  strokeWeight(1);
  ellipse(width/2, height/2, secondX, secondX);
}
