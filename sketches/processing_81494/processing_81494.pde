
int hours;
int minutes;
int seconds;
 
 
void setup() {
  size(500, 500);
 
  smooth();
}
 
void draw() {
  
   // get system variables
 hours = hour();
 minutes = minute();
 seconds = second();
  

     
    
  if(hours > 12) {
   hours -= 12;
  }
  
 background(#edf0a1);
  
    // center sketch
  translate(250,250);
  rotate(radians(90));

  noStroke();
 
  noFill();
    // hour hand
    float blah;
blah=radians(30*hours);
      for (int i = 0; i < 360; i++) {
    rotate(radians(30));
  noStroke();
  fill(#99B898);
  rect(-50, 0, 15, 15);
   
}
  strokeWeight(4);
  noFill();
  stroke(0,0,100);
   if(blah==radians(30)||
   blah==radians(60)||
   blah==radians(90)||blah==radians(120)||
   blah==radians(150)||blah==radians(180)||
   blah==radians(210)||blah==radians(240)||
   blah==radians(270)||blah==radians(300)||
   blah==radians(330)||blah==radians(0) )
  {fill(60,100,100);
  }
  else {noFill();}
    
  pushMatrix();
  rotate(blah); 
  rect(-50,0, 15,15);
  popMatrix();
   
    // minute hand
    float blahh;
blahh=radians(6*minutes);
      for (int i = 0; i < 360; i++) {
    rotate(radians(30));
  noStroke();
  fill(#DAD8A7);
  ellipse(-100, 0, 50, 50);
   
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
  ellipse(-100,0, 50,50);
  popMatrix();
   
    // second hand
float blahhh;
blahhh=radians(6*seconds);
    for (int i = 0; i < 360; i++) {
    rotate(radians(30));
  noStroke();
  fill(#E84A5F);
  rect(-200, 0, 60, 10);
   
}strokeWeight(4);
  stroke(0,0,100);
  if(blahhh==radians(30)||blahhh==radians(60)||blahhh==radians(90)||blahhh==radians(120)||blahhh==radians(150)||blahhh==radians(180)||blahhh==radians(210)||blahhh==radians(240)||blahhh==radians(270)||blahhh==radians(300)||blahhh==radians(330)||blahhh==radians(0) )
  {fill(#E84A5F);
  }
  else {noFill();}
  pushMatrix();
  rotate(blahhh);
  rect(-200,0,60,10);
  popMatrix();
}



