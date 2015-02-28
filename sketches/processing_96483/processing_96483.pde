
int hours;
int minutes;
int seconds;
 
 
void setup() {
  size(500, 500);
  colorMode(RGB, 100);
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
  
  background(#D8FFE9);
  
    // center sketch
  translate(250,250);
  rotate(radians(90));
  ellipseMode(CENTER);
  noStroke();
  fill(0,0,0);
  ellipse(0,0,10,10);
  noFill();
    // hour hand
    float forhour;
forhour=radians(30*hours);
      for (int i = 0; i < 360; i++) {
    rotate(radians(30));
  noStroke();
  fill(#467A06);
  ellipse(-50, 0, 11, 11);
   
}
  strokeWeight(4);
  noFill();
  stroke(#FF9CA0, 100);
   if(forhour==radians(30)||forhour==radians(60)||forhour==radians(90)||forhour==radians(120)||forhour==radians(150)||forhour==radians(180)||forhour==radians(210)||forhour==radians(240)||forhour==radians(270)||forhour==radians(300)||forhour==radians(330)||forhour==radians(0) )
  {fill(#1FF0FF, 100);
    noStroke();
  }
  else {fill(#FF9CA0, 100);}
    
  pushMatrix();
  rotate(forhour);  // 30 * 12 = 360 degrees
  ellipse(-50,0, 13, 13);
  popMatrix();
   
    // minute hand
    float forminute;
forminute=radians(6*minutes);
      for (int i = 0; i < 360; i++) {
    rotate(radians(30));
  noStroke();
  fill(#467A06);
  ellipse(-100, 0, 11, 11);
   
}
  strokeWeight(4);
  noFill();
  stroke(#FF9CA0, 100);
   if(forminute==radians(30)||forminute==radians(60)||forminute==radians(90)||forminute==radians(120)||forminute==radians(150)||forminute==radians(180)||forminute==radians(210)||forminute==radians(240)||forminute==radians(270)||forminute==radians(300)||forminute==radians(330)||forminute==radians(0) )
  {fill(#1FF0FF, 100);
  noStroke();
  }
  else {fill(#FF9CA0, 100);}
   pushMatrix();
  rotate(forminute);
  ellipse(-100,0, 11, 11);
  popMatrix();
   
    // second hand
float forsecond;
forsecond=radians(6*seconds);
    for (int i = 0; i < 360; i++) {
    rotate(radians(30));
  noStroke();
  fill(#467A06);
  ellipse(-150, 0, 11, 11);
   
}strokeWeight(4);
  noStroke();
  //stroke(#FF9CA0, 100);
  if(forsecond==radians(30)||forsecond==radians(60)||forsecond==radians(90)||forsecond==radians(120)||forsecond==radians(150)||forsecond==radians(180)||forsecond==radians(210)||forsecond==radians(240)||forsecond==radians(270)||forsecond==radians(300)||forsecond==radians(330)||forsecond==radians(0) )
  {fill(#1FF0FF, 100);
  noStroke();
  }
  else {
  fill(#FF9CA0, 100);}
  pushMatrix();
  rotate(forsecond);
  ellipse(-150,0, 13, 13);
  popMatrix();
}
