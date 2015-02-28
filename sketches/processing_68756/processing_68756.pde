
// hw 3
// e-mail: psalim@andrew.cmu.edu
// Peter Teguh Salim
// Copyright: Â© Peter Teguh Salim August 2012  Pittsburgh, PA 15213  All Rights Reserved

float x, y, diam; // bubble variables
float r, g, b, a; // fill variables
float xAdd, yAdd, reachX, reachY; // other variables

void setup(){
  size(960,500);
  background(0);
  smooth();
  
  x = random(width);
  y = random(height);
  r = random(255);
  g = random(255);
  b = random(255);
  a = random(1,30);
  
  // frameRate(28); // control the frame rate
  
  println(" z = start, x = stop, r = change color, m (hold) = bubbles follow them mouse, t = restart(black), left-click mouse = restart(white)");
}

void draw(){
  
  // x = mouseX + xAdd; // turn these on if you want the bubbles to follow the mouse
  // y = mouseY + yAdd;
  
  /* noStroke();
  fill(0,1);
  rect(0,0,width,height);  */ // turn this on to create a fade away effect
  
  diam = random(14); // buffer of bubble size
  
  xAdd = random(-20,20); // buffer of random movements
  yAdd = random(-30,30);
  
  reachX = random(1);
  reachX = round(reachX);
  reachX = width * reachX;
  
  /*reachY = random(1);
  reachY = round(reachY);
  reachY = height * reachY;*/ // turn this on to make the lines go to all 4 corners
  
  reachY = height/2; // turn this on for two point perspectivel lines
  
  //noStroke();
  fill(r,g,b,a); 
  //noFill();
  stroke(r,g,b,a);
  strokeWeight(2);
  ellipseMode(CENTER);
  ellipse(x%width, y%height, diam, diam);
  
  stroke(r,g,b,21);
  line(x%width, y%height, reachX, reachY);
  
  strokeWeight(7);
  point(x,y);
  
  y = y + yAdd;
  x = x + xAdd;
  
  // println(frameRate);
}

void keyPressed(){
  if (key == 'r'){
    r = random(100,255); // randomize the colors
    g = random(100,255); // comment out one of the r,g,b to target a specific hue family
    b = random(100,255); 
    a = random(1,30);  
  }else if (key == 'z'){  
    noLoop();
  }else if (key == 'x'){
    loop();
  }else if (key == 't'){
    background(0); // to restart the window
    x = random(width); // to restart positions
    y = random(height);
  }else if (key == 'y'){
    fill(255);
    noStroke();
    rect(0,0,width,height); // helps clean the screen from the traces
  }
}

void mousePressed(){
  if (mousePressed == true){
    x = mouseX;
    y = mouseY;
  }
}
  

