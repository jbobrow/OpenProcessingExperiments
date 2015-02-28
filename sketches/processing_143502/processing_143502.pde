
// The next line is needed if running in JavaScript Mode with Processing.js
/* @pjs font="Arial-BoldMT.ttf"; */ 
 
color col1, col2, col3;

void setup() {
 size(200,200);
 background(100); 
 
 colorMode(HSB, 360, 100,100);

  // analogous colour composition:
  float baseAngle = 199;  
  col1 = color(baseAngle,      50, 70+random(50));
  col2 = color(baseAngle+50,   50, 70+random(50));
  col3 = color(baseAngle+100,  50, 70+random(50));

  
  noStroke();
  //textFont(createFont("Arial-BoldMT", 48));
}

void draw() {
  background(360,00,35); //  
  
  
  
   // hour:
  textSize(150); 
  fill(col1); 
  text(hour(),   hour(), 140);
  
  // minute:
   textSize(60); 
  fill(col2);
   text(minute(), minute(), 160); 

  // second:
  textSize(48);
  fill(col3);
  text(second(),  2.5*second(), 180 );
 
 
  

}

