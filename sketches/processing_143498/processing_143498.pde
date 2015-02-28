
void setup() {
 size(200,200);
 stroke(255);
 strokeWeight(1);
 frameRate(120);
}

void draw() {
 background(20); 
  
  // second:
  stroke(200);  
  float sec = map(second(), 0, 60, 0, width );
  line(sec, 0, sec, height);
  
   // minute
  stroke(150); 
  float  min = map(minute(), 0, 60, 0, width );
  line(min, 0, min, height);
   
   // hour 
  stroke(100); 
  float  hr = map(hour(), 0, 24, 0, width );
  line(hr, 0, hr, height);
  
  //millisecond  
  stroke(255); 
  float milli = map(millis()%1000, 0, 1000, 0, width );
  line(milli, 0, milli, height);
 
  }
