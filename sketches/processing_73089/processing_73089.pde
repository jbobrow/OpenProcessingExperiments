
int hours;
int minutes;
int seconds;


void setup() {
  size(500, 500);
  colorMode(HSB, 100);
  background(0,0,0);
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
 
 background(0,0,0);
 
    // center sketch
  translate(250,250);
  rotate(radians(90));
  ellipseMode(CENTER);
  noStroke();
  fill(0,0,0);
  ellipse(0,0,3,3);
  noFill();
    // hour hand
    float blah;
blah=radians(30*hours);
      for (int i = 0; i < 360; i++) {
    rotate(radians(30));
  noStroke();
  fill(50,100,100);
  ellipse(-50, 0, 11, 11);
  
}
  strokeWeight(4);
  noFill();
  stroke(0,0,100);
   if(blah==radians(30)||blah==radians(60)||blah==radians(90)||blah==radians(120)||blah==radians(150)||blah==radians(180)||blah==radians(210)||blah==radians(240)||blah==radians(270)||blah==radians(300)||blah==radians(330)||blah==radians(0) )
  {fill(60,100,100);
  }
  else {noFill();}
   
  pushMatrix();
  rotate(blah);  // 30 * 12 = 360 degrees
  ellipse(-50,0, 15,15);
  popMatrix();
  
    // minute hand
    float blahh;
blahh=radians(6*minutes);
      for (int i = 0; i < 360; i++) {
    rotate(radians(30));
  noStroke();
  fill(50,100,100);
  ellipse(-100, 0, 11, 11);
  
}
  strokeWeight(4);
  noFill();
  stroke(0,0,100);
   if(blahh==radians(30)||blahh==radians(60)||blahh==radians(90)||blahh==radians(120)||blahh==radians(150)||blahh==radians(180)||blahh==radians(210)||blahh==radians(240)||blahh==radians(270)||blahh==radians(300)||blahh==radians(330)||blahh==radians(0) )
  {fill(60,100,100);
  }
  else {noFill();}
   pushMatrix();
  rotate(blahh);
  ellipse(-100,0, 15,15);
  popMatrix();
  
    // second hand
float blahhh;
blahhh=radians(6*seconds);
    for (int i = 0; i < 360; i++) {
    rotate(radians(30));
  noStroke();
  fill(50,100,100);
  ellipse(-150, 0, 11, 11);
  
}strokeWeight(4);
  stroke(0,0,100);
  if(blahhh==radians(30)||blahhh==radians(60)||blahhh==radians(90)||blahhh==radians(120)||blahhh==radians(150)||blahhh==radians(180)||blahhh==radians(210)||blahhh==radians(240)||blahhh==radians(270)||blahhh==radians(300)||blahhh==radians(330)||blahhh==radians(0) )
  {fill(60,100,100);
  }
  else {noFill();}
  pushMatrix();
  rotate(blahhh);
  ellipse(-150,0, 15,15);
  popMatrix();
}
