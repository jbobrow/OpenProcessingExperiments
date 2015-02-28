
int hours;
int minutes;
int seconds;
int i;

void setup() {
  size(800, 400);
  PFont font = loadFont("Garamond-30.vlw");
  textFont(font);
  frameRate(1);
  strokeCap(ROUND);
  smooth();

}

void draw() {
  
  hours = hour();
  minutes = minute();
  seconds = second();
  
 println(hours + " hours " + minutes + " minutes " + seconds + " seconds");
  
  if(hours > 12) {
   hours -= 12; 
  }
 
 
  background(#BCDEFF); 
  
  
  
  strokeWeight(1);
  stroke(#000000);
  fill(#FFAC46);
  ellipse(400, 200, 300, 300);
  
  PFont font;
  font = loadFont("Garamond-30.vlw"); 
  textFont(font); 
  fill(#FFFFFF);
    text("12", 390, 77); 
    text("1", 457, 94);
    text("2", 505, 143);    
    text("3", 525, 210);
    text("4", 505, 280);    
    text("5", 457, 323); 
    text("6", 395, 340); 
    text("7", 334, 323);   
    text("8", 286, 280);        
    text("9", 260, 210); 
    text("10", 280, 143);        
    text("11", 334, 94);    

  
  translate(400,200);
  rotate(radians(90));
  noFill();
  
  strokeWeight(6);
  stroke(#000000);
  pushMatrix();
  rotate(radians(30 * hours)); 
  line(0,0, -40,0);
  popMatrix();  
  
  
  strokeWeight(4);
  stroke(#000000);
  pushMatrix();
  rotate(radians(6 * minutes));
  line(0,0, -70,0);
  popMatrix();
  

  strokeWeight(2);
  stroke(#C12323);
  pushMatrix();
  rotate(radians(6 * seconds));
  line(0,0, -110,0);
  popMatrix();
  
}

