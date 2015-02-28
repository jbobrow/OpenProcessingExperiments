
// hw 8
// name: Peter Teguh Salim
// e-mail: psalim@andrew.cmu.edu
// Copyright: Â© Peter Teguh Salim August 2012  Pittsburgh, PA 15213  All Rights Reserved

/*
drag your mouse around the screen to display rotating nodes.
The further right you go, the faster the rotation, and vice versa.
Press: 
  b = black background
  w = white background
  z = stop
  x = go
*/

float x,y,d; // node variables
float t1,t2,t3; // rotation angle variables
float tv1,tv2,tv3; // rotation speed variables
float r,f; // color variables

void setup(){
  size(600 ,600);
  noCursor();
  smooth();
  
  tv1 = random(2*PI);
  tv2 = random(2*PI);
  tv3 = random(2*PI);
  
  r = 0;
  f = 255;
}

void draw(){
  initaite(); // start the screen
  locator(); // replace the mouse
  connect(mouseX,mouseY,100); // recurring rotating ellipses
}

void initaite(){
  background(r);
}

void locator(){
  ellipse(mouseX,mouseY,100,100);
  ellipse(mouseX,mouseY,10,10);
}

void connect(float x_, float y_, float d_){
  x = x_;
  y = y_;
  d = d_;
  
  t1 += tv1;
  t2 += tv2;
  t3 += tv3;
  
  float x1,y1,x2,y2,x3,y3; // new variables for the three smaller,rotating ellipses
  
  x1 = 1.7*d; // you can adjust the lengths of specific connections
  y1 = 1.7*d;
  x2 = 1.2*d;
  y2 = 1.2*d;
  x3 = 2*d;
  y3 = 2*d;
  
  fill(f,35);
  stroke(f,70);
    
  pushMatrix(); // translate center of rotation to mouse coords
  translate(x,y);
  rotate(t1);
  line(0,0,x1,y1);
  ellipse(x1,y1,d/2,d/2);
  ellipse(x1,y1,d/10,d/10);
  
  rotate(t2);
  line(0,0,x2,y2);
  ellipse(x2,y2,d/2,d/2);
  ellipse(x2,y2,d/10,d/10);
  
  rotate(t3);
  line(0,0,x3,y3);
  ellipse(x3,y3,d/2,d/2);
  ellipse(x3,y3,d/10,d/10);
  
  while(d>5){
    connect(x1,y1,d/2); // recursion using the while loop to connect, and connect, and connect
    //connect(x2,y2,d/2);
    //connect(x3,y3,d/2); // didn't work. how do you make it so that there are three different connect functions for each ball instead of just one?
  }
  
  if(mouseX - pmouseX <0){
    tv1 = radians(mouseX-100)/6000; // alterable to vary the rotation speed and direction
    tv2 = radians(mouseX-width)/4000;
    tv3 = radians(mouseX)/2000;
  }else if(mouseX-pmouseX>0){
    tv1 = radians(mouseX-100-width)/6000;
    tv2 = radians(mouseX)/4000;
    tv3 = radians(mouseX-width)/2000;
  }
  
  popMatrix();
}

void keyPressed(){
    if(key == 'b'){
      r = 0;
      f = 255;
    }else if (key == 'w'){
      r = 255;
      f = 0;
    }else if (key == 'z'){
      noLoop();
    }else if (key == 'x'){
      loop();
    }
}

