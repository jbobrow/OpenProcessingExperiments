
int hours;
int minutes;
int seconds;

void setup() {
  size(600, 600);
  colorMode(HSB, 100);
  background(0,0,10);
  smooth();
}

void draw() {
  println(hours + " " + minutes + " " + seconds);

 
 hours = hour();
 minutes = minute();
 seconds = second();
    
  if(hours > 12) {
   hours -= 12; 
  }
  
   //seconds
 for (int k = 0; k < 60; k++) { 
  strokeWeight(1); 
  stroke(50,92,91);
  line(30,30+(seconds*9), 570, 30+(seconds*9));
      
}
   
    // center sketch
  translate(300,300);
  rotate(radians(90));
  
   
   // minutes
for (int j=0; j < 60; j++)  {
  strokeWeight(8);
  stroke(82,91,92);
  fill (292,29,95);
  pushMatrix();
  rotate(radians(6 * minutes));
  line(0,0, -160,0);
  popMatrix();
   if (seconds == 59 ) {
     background (0,0,10);
    }
 
}

  
    // hours
for (int i=0;i < 12;i++) {    
  strokeWeight(10);
  stroke(29,91,92);
  fill(260,63,95);
  pushMatrix();
  rotate(radians(30 * hours));  
  line(0,0, -80,0);
  popMatrix();
}
   
}

