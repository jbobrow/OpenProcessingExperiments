
// hw 5
// name: Peter Teguh Salim
// e-mail: psalim@andrew.cmu.edu
// Copyright: Â© Peter Teguh Salim August 2012  Pittsburgh, PA 15213  All Rights Reserved

/*
Controls
space-bar = randomize pattern
z = stop
x = start
c = clear screen
*/


float a,r,g,b,n,f;

void setup(){
  size(700,400);
  a = random(50,200);
  r = random(100,255);
  g = random(100,255);
  b = random(100,255);
  n = random(1.5,2);
  f = random(1.5,2);
  background(0);
  
  // frameRate(200);
}

void draw(){
  fill(0,2);
  rect(0,0,width,height); 
  
  // pattern(width/2, height/2, a); // turn this on to generate patterns from the center of the screen
  
  pattern(mouseX, mouseY, a); // turn this on to generate patterns from the mouse coordinates
}

void pattern(float x, float y, float d){
  stroke(r,g,b,7);
  ellipseMode(CENTER);
  ellipse(x, y, d, d);
  if(d<400){
    pattern(x+f*d, y, d*n);
    pattern(x-f*d, y, d*n);
    pattern(x, y+f*d, d*n);
    pattern(x, y-f*d, d*n);
  }    
}

void keyPressed(){
  if(key == ' '){
    a = random(50,200);
    r = random(100,255);
    g = random(100,255);
    b = random(100,255);
    f = random(1.5,2);
    n = random(1.5,2);
  }
  if(key == 'z'){
    noLoop();
  }
  if(key == 'x'){
    loop();
  }
  if(key == 'c'){
    fill(0);
    rect(0,0,width,height);
  }
}



