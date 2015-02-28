


int hours;
int minutes;
int seconds;





void setup() {
  size(800, 800);
  colorMode(HSB, 100);
  background(0);
  strokeCap(ROUND);
  smooth();
}

void draw() {
 
   // get system variables
 hours = hour();
 minutes = minute();
 seconds = second();

 
 println(hours + " " + minutes + " " + seconds);
    
    // fix for 24 hour clock
  if(hours > 12) {
   hours -= 12; 
  }
 

    

 // center sketch
  translate(400,400);
  rotate(radians(90));
  noFill();
  
   
 background(0);
 
 if( seconds > 30) {
     
      fill(85);
      ellipse(0,0,500,500); 
   } else {                               
      fill(10);
      ellipse(0,0,500,500);      
     }
  

  
  
    
   
  

  
    // hour hand
  pushMatrix();
  rotate(radians(30 * hours));  // 30 * 12 = 360 degrees 
  strokeWeight(30);
  stroke(50, 100, 100, 50);
  line(0,0, -70,0);
  popMatrix();
  
   // hour hand rect 
  translate(0, 0);
  rotate(radians(45));
  rect(0,0, 0,0);
  
  noStroke();
  fill(50, 100, 100, 50);
  pushMatrix();
  rotate(radians(30 * hours));
  rect(0, 0, -50, 50);
  popMatrix();

  
    // minute hand
  pushMatrix();
  rotate(radians(6 * minutes));
  strokeWeight(20);
  stroke(100, 100, 100, 50);
  line(0,0, -140,0);
  popMatrix();
  
  
   // minute hand rect 
  translate(0, 0);
 rotate(radians(45));
  rect(0,0, 0,0);
  
  noStroke();
  fill(100, 100, 100, 50);
  pushMatrix();
  rotate(radians(6 * minutes));
  rect(0,0, -100,100);
  popMatrix();
  
  

  
  
  
  
    // second hand
  pushMatrix();
  rotate(radians(6 * seconds));
  strokeWeight(10);
  stroke(20, 50, 100, 50);
  line(0,0, -215,0);
  popMatrix();
  
  
  // second hand rect
  translate(0, 0);
 rotate(radians(45));
  rect(0,0, 0,0);
  
  noStroke();
  fill(20, 50, 100, 50);
  pushMatrix();
  rotate(radians(6 * seconds));
  rect(0,0, -150,150);
  popMatrix();
  

  
}

