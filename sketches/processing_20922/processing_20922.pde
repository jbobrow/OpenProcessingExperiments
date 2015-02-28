
int hours;
int minutes;
int seconds;


void setup() {
  size(500, 500);
  colorMode(HSB, 100);
  background(100,120,70);
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
 
 background(50,10,100);
 

    // center sketch
  translate(250,250);
  rotate(radians(90));
  noFill();
  
  fill(0);        
 noStroke();
 ellipse(0,0,490,490);
 
 
  
   fill(0);        
 noStroke();
 ellipse(0,0,105,105);
 
    // hour hand
  strokeWeight(7);
  stroke(90,70,50);
  pushMatrix();
  rotate(radians(30 * hours));  // 30 * 12 = 360 degrees
  line(0,0,-50,0);
  popMatrix();
  
    // hour hand
  strokeWeight(6);
  stroke(90,70,50);
  pushMatrix();
  rotate(radians(30 * hours));  // 30 * 12 = 360 degrees
  line(0,-10,-30,-10);
  popMatrix();
  
    // hour hand
  strokeWeight(6);
  stroke(90,70,50);
  pushMatrix();
  rotate(radians(30 * hours));  // 30 * 12 = 360 degrees
  line(0,10,-30,10);
  popMatrix();
  
  
  
    // minute hand
  strokeWeight(5);
  stroke(50,50,50);
  pushMatrix();
  rotate(radians(6 * minutes));
  line(-150,0,-60,0);
  popMatrix();
  
    // minute hand
  strokeWeight(4);
  stroke(50,50,50);
  pushMatrix();
  rotate(radians(6 * minutes));
  line(-130,-10,-80,-10);
  popMatrix();
  
    // minute hand
  strokeWeight(4);
  stroke(50,50,50);
  pushMatrix();
  rotate(radians(6 * minutes));
  line(-130,10,-80,10);
  popMatrix();
  
    // minute hand
  strokeWeight(3.5);
  stroke(50,50,50);
  pushMatrix();
  rotate(radians(6 * minutes));
  line(-120,-20,-90,-20);
  popMatrix();
  
    // minute hand
  strokeWeight(3.5);
  stroke(50,50,50);
  pushMatrix();
  rotate(radians(6 * minutes));
  line(-120,20,-90,20);
  popMatrix();
 
  
     // second hand grey
  strokeWeight(3.5);
  stroke(50,10,100);
  pushMatrix();
  rotate(radians(6 * seconds));
  line(246,0,160,0);
  popMatrix();
  
       // second hand grey left
  strokeWeight(3.25);
  stroke(50,10,100);
  pushMatrix();
  rotate(radians(6 * seconds));
  line(245,-10,160,-10);
  popMatrix();
  
         // second hand grey left
  strokeWeight(3);
  stroke(50,10,100);
  pushMatrix();
  rotate(radians(6 * seconds));
  line(245,-20,180,-20);
  popMatrix();
  
          // second hand grey left
  strokeWeight(2.75);
  stroke(50,10,100);
  pushMatrix();
  rotate(radians(6 * seconds));
  line(245,-30,200,-30);
  popMatrix();
  
           // second hand grey left
  strokeWeight(2.5);
  stroke(50,10,100);
  pushMatrix();
  rotate(radians(6 * seconds));
  line(245,-40,220,-40);
  popMatrix();
  
         // second hand grey right
  strokeWeight(3.25);
  stroke(50,10,100);
  pushMatrix();
  rotate(radians(6 * seconds));
  line(245,10,160,10);
  popMatrix();
  
         // second hand grey right
  strokeWeight(3);
  stroke(50,10,100);
  pushMatrix();
  rotate(radians(6 * seconds));
  line(245,20,180,20);
  popMatrix();
  
          // second hand grey right
  strokeWeight(2.75);
  stroke(50,10,100);
  pushMatrix();
  rotate(radians(6 * seconds));
  line(245,30,200,30);
  popMatrix();
  
           // second hand grey right
  strokeWeight(2.5);
  stroke(50,10,100);
  pushMatrix();
  rotate(radians(6 * seconds));
  line(245,40,220,40);
  popMatrix();
  
  
  
      // second hand green
  strokeWeight(3.5);
  stroke(50,10,100);
  pushMatrix();
  rotate(radians(6 * seconds));
  line(-246,0,-160,0);
  popMatrix();
  
      // second hand green left
  strokeWeight(3.25);
  stroke(50,10,100);
  pushMatrix();
  rotate(radians(6 * seconds));
  line(-245,10,-160,10);
  popMatrix();
  
     // second hand green left
  strokeWeight(3);
  stroke(50,10,100);
  pushMatrix();
  rotate(radians(6 * seconds));
  line(-245,20,-180,20);
  popMatrix();
  
       // second hand green left
  strokeWeight(2.75);
  stroke(50,10,100);
  pushMatrix();
  rotate(radians(6 * seconds));
  line(-245,30,-200,30);
  popMatrix();
  
       // second hand green left
  strokeWeight(2.5);
  stroke(50,10,100);
  pushMatrix();
  rotate(radians(6 * seconds));
  line(-245,40,-220,40);
  popMatrix();
  
    // second hand green right
  strokeWeight(3.25);
  stroke(50,10,100);
  pushMatrix();
  rotate(radians(6 * seconds));
  line(-245,-10,-160,-10);
  popMatrix();
  
     // second hand green right
  strokeWeight(3);
  stroke(50,10,100);
  pushMatrix();
  rotate(radians(6 * seconds));
  line(-245,-20,-180,-20);
  popMatrix();
  
       // second hand green right
  strokeWeight(2.75);
  stroke(50,10,100);
  pushMatrix();
  rotate(radians(6 * seconds));
  line(-245,-30,-200,-30);
  popMatrix();
  
       // second hand green right
  strokeWeight(2.5);
  stroke(50,10,100);
  pushMatrix();
  rotate(radians(6 * seconds));
  line(-245,-40,-220,-40);
  popMatrix();
  
    // second hand purple
  strokeWeight(3.5);
  stroke(50,10,100);
  pushMatrix();
  rotate(radians(6 * seconds));
  line(0,245,0,160);
  popMatrix();
  
    // second hand purple left
  strokeWeight(3.25);
  stroke(50,10,100);
  pushMatrix();
  rotate(radians(6 * seconds));
  line(10,245,10,160);
  popMatrix();
  
   // second hand purple left
  strokeWeight(3);
  stroke(50,10,100);
  pushMatrix();
  rotate(radians(6 * seconds));
  line(20,245,20,180);
  popMatrix();
  
   // second hand purple left
  strokeWeight(2.75);
  stroke(50,10,100);
  pushMatrix();
  rotate(radians(6 * seconds));
  line(30,245,30,200);
  popMatrix();
  
     // second hand purple left
  strokeWeight(2.5);
  stroke(50,10,100);
  pushMatrix();
  rotate(radians(6 * seconds));
  line(40,245,40,220);
  popMatrix();
  
    // second hand purple right
  strokeWeight(3.25);
  stroke(50,10,100);
  pushMatrix();
  rotate(radians(6 * seconds));
  line(-10,245,-10,160);
  popMatrix();
  
   // second hand purple right
  strokeWeight(3);
  stroke(50,10,100);
  pushMatrix();
  rotate(radians(6 * seconds));
  line(-20,245,-20,180);
  popMatrix();
  
   // second hand purple right
  strokeWeight(2.75);
  stroke(50,10,100);
  pushMatrix();
  rotate(radians(6 * seconds));
  line(-30,245,-30,200);
  popMatrix();
  
     // second hand purple right
  strokeWeight(2.5);
  stroke(50,10,100);
  pushMatrix();
  rotate(radians(6 * seconds));
  line(-40,245,-40,220);
  popMatrix();
  
  
  
    // second hand maroon
  strokeWeight(3.5);
  stroke(50,10,100);
  pushMatrix();
  rotate(radians(6 * seconds));
  line(0,-245,0,-160);
  popMatrix();
  
  
    // second hand maroon left
  strokeWeight(3.25);
  stroke(50,10,100);
  pushMatrix();
  rotate(radians(6 * seconds));
  line(-10,-245,-10,-160);
  popMatrix();
  
     // second hand maroon left
  strokeWeight(3);
  stroke(50,10,100);
  pushMatrix();
  rotate(radians(6 * seconds));
  line(-20,-245,-20,-180);
  popMatrix();
  
      // second hand maroon left
  strokeWeight(2.75);
  stroke(50,10,100);
  pushMatrix();
  rotate(radians(6 * seconds));
  line(-30,-245,-30,-200);
  popMatrix();
  
     // second hand maroon left
  strokeWeight(2.5);
  stroke(50,10,100);
  pushMatrix();
  rotate(radians(6 * seconds));
  line(-40,-245,-40,-220);
  popMatrix();
  
   // second hand maroon right
  strokeWeight(3.25);
  stroke(50,10,100);
  pushMatrix();
  rotate(radians(6 * seconds));
  line(10,-245,10,-160);
  popMatrix();
  
     // second hand maroon right
  strokeWeight(3);
  stroke(50,10,100);
  pushMatrix();
  rotate(radians(6 * seconds));
  line(20,-245,20,-180);
  popMatrix();
  
      // second hand maroon right
  strokeWeight(2.75);
  stroke(50,10,100);
  pushMatrix();
  rotate(radians(6 * seconds));
  line(30,-245,30,-200);
  popMatrix();
  
     // second hand maroon right
  strokeWeight(2.5);
  stroke(50,10,100);
  pushMatrix();
  rotate(radians(6 * seconds));
  line(40,-245,40,-220);
  popMatrix();
  
  
}

