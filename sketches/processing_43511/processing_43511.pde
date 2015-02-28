

//////////////// HOW TO PLAY ////////////////
/* 
press a number 1 - 0 for how hard to hit the ball, 1 is lowest 0 is hardest
press keys q,w,e,a,d,z,x, or c for the direction you want to hit the ball
hold the key and click the mouse
when ball stops, repeat
sand slows you down
red circle launches you faster
press r to restart game
*/



//make a class for the golf ball
Ball b;

//load all images
PImage layouttop;
PImage ppfast;
PImage pphorz;
PImage ppvert;
PImage ppsand;
PImage pphole;


void setup() {
  size(800, 350);
  smooth();
  layouttop = loadImage("layouttop.jpg");
  background (layouttop);
  //layout.loadPixels();
  pphorz = loadImage("pphorz.jpg");
  pphorz.loadPixels();
  ppvert = loadImage("ppvert.jpg");
  ppvert.loadPixels();
  ppsand = loadImage("ppsand.jpg");
  ppsand.loadPixels();
  pphole = loadImage("pphole.jpg");
  pphole.loadPixels();
  ppfast = loadImage("ppfast.jpg");
  ppfast.loadPixels();
  b = new Ball (75,50,0,0,0,7.5);
  
}
  
  void draw(){
  // Background
  background (layouttop);
  noStroke();
  b.update();
  b.display();
}


class Ball {
  float x, y; // The x- and y-coordinates
  float vx, vy; //
  float r = 7.5; // ball radius
  float directionx, directiony; 
  float s; // speed
  float p; // power of hit
  float f = .995; //friction

   Ball (int xpos, int ypos, float dirx, float diry, float speed, float r) {
    x = xpos;
    y = ypos;
    directionx = dirx;
    directiony = diry;
    s = speed;
   }  
  void update(){
    s = s*f;  // sets friction on ball
    vx = directionx * s; // sets vectors
    vy = directiony * s; 
    y += vy;   // moves the ball
    x += vx; 
       
    
    
   // create a restart button
    if (keyPressed){
      if(key == 'r') {
        if  (s<.19) {
        x = 75;
          y = 50;}}}
        
        
    
    // stop the ball from infinitely rolling
     if (s < 0.2){
    s = 0;
   }
   
   
   // press nembuers for 'power', how hard you hit the ball
   if (keyPressed){
      if(key == '1') {
        p = 1;}
      if(key == '2') {
        p = 2;}
      if(key == '3') {
        p = 3;}
      if(key == '4') {
        p = 4;}
      if(key == '5') {
        p = 5;}
      if(key == '6') {
        p = 6;}
      if(key == '7') {
        p = 7;}
      if(key == '8') {
        p = 8;}
      if(key == '9') {
        p = 9;}
      if(key == '0') {
        p = 10;}}
       
  
    
    //reflection by image detection
    // reflect off vertical surfaces
    if (ppvert.get(int(x), int(y)) != color(255)) {
      directionx = -directionx;
    }
    
    //reflect off horizontal surfaces
    if (pphorz.get(int(x), int(y)) != color(255)) {
      directiony = -directiony;
    }
    
     //slow down ball at sand
    if (ppsand.get(int(x), int(y)) != color(255)) {
      f = .95;
    }
    
    // set friction back to regular
    if(ppsand.get(int(x), int(y)) != color(0)){
      f = .995;
    }
      
      //speed up ball at conveyor belt
    if (ppfast.get(int(x), int(y)) != color(255)) {
      s = 15 ;}

    //stop ball at hole
    if (pphole.get(int(x), int(y)) != color(255)) {
      s = 0;
      x = 700; // center of hole
      y = 175;
    }
    
     
    
    // click to hit ball
    if (mousePressed){
      if (s<.19) { // so you cant hit the ball while its rolling
        if (keyPressed){
      s = p;
   }}}
   
  // turn angle of hit by key
    if (keyPressed){
     if (s<.19){ // so you cant turn while ball rolling
      if(key == 'q') {
        directionx = - .5;
        directiony = - .5;
        putterqc (mouseX,mouseY);
   }
      if(key == 'w') { 
        directionx = 0;
        directiony = - sqrt(.5);
        putterwx (mouseX,mouseY);
   }
      if(key == 'e') {
        directionx = .5;
        directiony = -.5;
        putterez (mouseX,mouseY);
   }
      if(key == 'd') {
        directionx = sqrt(.5);
        directiony = 0;
        putterad (mouseX,mouseY);  
   }  
      if(key == 'c') {
        directionx = .5;
        directiony = .5;
        putterqc (mouseX,mouseY);
   }
      if(key == 'x') {
        directionx = 0;
        directiony = sqrt(.5);
       putterwx (mouseX,mouseY);
   }
      if(key == 'z') {
        directionx = -.5;
        directiony = .5;
        putterez (mouseX,mouseY);
   }
      if(key == 'a') {
        directionx = - sqrt(.5);
        directiony = 0;
        putterad (mouseX,mouseY);
   }
 }
 }
 }
  
  void display () {
    fill(0,0,255);
    ellipse(x, y, r*2, r*2);
  }
 }








void putterad (float x, float y) {
  fill(126,59,17);
  strokeWeight(10);
  rectMode (CENTER);
  rect (mouseX, mouseY, 10,36);
}
  
  void putterwx (float x, float y) {
  fill(126,59,17);
  rectMode (CENTER);
  rect (mouseX , mouseY , 36,10);
}
  
  void putterqc (float x, float y) {
  fill(126,59,17);
  quad (mouseX-16.26346,mouseY+9.19239,mouseX+9.19239,mouseY-16.26346,mouseX+16.26346,mouseY-9.19239,mouseX-9.19239,mouseY+16.26346);
  }
   
  void putterez (float x, float y) {
  fill(126,59,17);
  quad (mouseX+16.26346,mouseY+9.19239,mouseX+9.19239,mouseY+16.26346,mouseX-16.26346,mouseY-9.19239,mouseX-9.19239,mouseY-16.26346);
  }
 

