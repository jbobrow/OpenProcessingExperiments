
import processing.video.*; 
Movie myMovie; 
 
 
 
void setup() { 
  stroke(400); 
  smooth(); 
  myMovie=new Movie(this, "sofiacloudsforclock.mov"); 
  myMovie.loop(); 
  size(500,300); 
 
} 
void movieEvent(Movie myMovie) { 
  myMovie.read(); 
} 
void draw() { 
 
  background(200); 
  fill(200); 
  noStroke(); 
  image(myMovie,0,0,width,height); 
 
  fill(240,233,31); 
  if (hour()<6) 
  { 
    fill(39,37,10); 
  } 
  if (hour() >= 6 && hour()<18) 
  { 
    fill(240,233,31); 
  } 
  if (hour() >18) 
  { 
    fill(39,37,10); 
  } 
  ellipse(100, 100, 160, 160); 
  float s = map(second(), 0, 60, 0, TWO_PI) - HALF_PI; 
  float m = map(minute() + norm(second(), 0, 60), 0, 60, 0, TWO_PI) - HALF_PI;  
  float h = map(hour() + norm(minute(), 0, 60), 0, 24, 0, TWO_PI * 2) - HALF_PI; 
  stroke(255); 
  strokeWeight(1); 
  line(100, 100, cos(s) * 72 + 100, sin(s) * 72 + 100); 
  strokeWeight(2); 
  line(100, 100, cos(m) * 60 + 100, sin(m) * 60 + 100); 
  strokeWeight(4); 
  line(100, 100, cos(h) * 50 + 100, sin(h) * 50 + 100); 
 
  // Minute 
  strokeWeight(2); 
  for (int a = 0; a < 360; a+=6) { 
    float x = 100 + ( cos(radians(a)) * 72 ); 
    float y = 100 + ( sin(radians(a)) * 72 ); 
    point(x, y); 
  } 
} 

