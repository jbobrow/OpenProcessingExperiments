
class Bird {
  float x;
  float y;
  int w=40;
  int h= 60;
  color col;
  float armSize=10;
  float eyeSize=5;
  float eyeSizeWhite=15;
  int hairLength= 16;
  float bodySize=80;
  float bellySize=50;
  boolean hit = false;
  
  Bird (float x_, float y_, color col_) {
    col = col_;
    x= x_;
    y = y_;
  }
    
void display (float x_, float y_) {
      x = x_;
      y=y_;
      ellipseMode (CENTER);
      rectMode (CENTER);
 
        
      //hair
      fill(100);
      noStroke();
      
        
      //hair
      fill(100);
      noStroke();
      rect(x+2,y-50,1,hairLength);
      
      //hair
      fill(100);
      noStroke();
      rect(x-4,y-50,1,hairLength);
      
      //hair
      fill(100);
      noStroke();
      rect(x-6,y-50,1,hairLength);
      
      
      //body 
      smooth();
      fill(255);
      ellipseMode(CENTER);
      ellipse(x,y,bodySize,bodySize*1.3);
      
      //belly 
      
      fill(100);
      stroke(255);
      ellipse(x,y+20,bellySize,bellySize+5);
      
      //right arm 
      fill(100);
      noStroke();
      ellipse(x-38,y+10,armSize,armSize*4);
      
      //left arm 
      fill(100);
      noStroke();
      ellipse(x+38,y+10,armSize,armSize*4);
      
      
      //right eye 
      fill(255);
      stroke(0);
      ellipse(x-14,y-21,eyeSizeWhite,eyeSizeWhite+10);
      
      //left eye 
      fill(255);
      stroke(0);
      ellipse(x+14,y-21,eyeSizeWhite,eyeSizeWhite+10);
      
      //right eye ball
      fill(0);
      stroke(0);
      ellipse(x-14,y-18,eyeSize,eyeSize*1.5);
      
      //left eye ball
      fill(0);
      stroke(0);
      ellipse(x+14,y-18,eyeSize,eyeSize*1.5);
      
      //beak 
      fill(245,127,30);
      noStroke();
      triangle(x-10,y-5,x+10,y-5,x,y+15);
      
      //eyelid 
      fill(x,0,y);
      noStroke();
      arc(x-14,y-21,15,25,PI,TWO_PI);
      
      //eyelid 
      fill(x,0,y);
      noStroke();
      arc(x+14,y-21,15,25,PI,TWO_PI);

      if (hit) {
       //eyelid 
      fill(x,0,y);
      noStroke();
      ellipse(x-14,y-21,eyeSizeWhite,eyeSizeWhite+10);
      
      //eyelid 
      fill(x,0,y);
      noStroke();
      ellipse(x+14,y-21,eyeSizeWhite,eyeSizeWhite+10);
      }}
      
      void hitTest (Bird bird) {
        if (dist (x, y, bird.x, bird.y) <= 100) {
          bird.hit =true;
          hit=true;
        } else {
          bird.hit= false;
          hit = false;
          
      }}}

