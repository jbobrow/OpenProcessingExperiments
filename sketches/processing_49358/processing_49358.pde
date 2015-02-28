
class Robo {
  float r;
  float g;
  float b;
  float x;
  float y;
  int w = 40;
  int h = 30;
  
  boolean hit = false;
  
  Robo (float r_, float g_, float b_) {
    r = r_;
    g = g_;
    b = b_;
  }
   
  void display (float x_, float y_) {
    x = x_;
    y = y_;
    
    ellipseMode(CENTER);
    rectMode(CENTER);
  
    noStroke ();
    if (hit) {
      fill (r, g, b);
    }  else {
      fill (255);
    }
   //Draw Robo's body
  noStroke ();
  fill (r, g, b);
  rect (x,y,w,h);
  
  //Draw Robo's ears
  noStroke ();
  fill(150, 0, 120);
  
  //If Robo Hits
    if (hit) {
  //left ear
    rect (x-33, y-30, 12, 19);
  //right ear
    rect (x+33, y-30, 12, 19);
    
    }else{
    fill(255);
    //left ear
    rect (x-33, y-30, 12, 25);
    //right ear
    rect (x+33, y-30, 12, 25);
 
    }
      
  //Draw Robo's head
  noStroke ();
  fill (r, g, b);
  ellipse (x, y-37, 66, 75);
  
    //Draw Robo's eyes
  noStroke ();
  fill(255);
  ellipse (x-15, y-23, 15, 20);
  ellipse (x+15, y-23, 15, 20);
  noStroke ();
  fill(150, 0, 120); // purple
  ellipse (x-15, y-20, 8, 10);
  ellipse (x+15, y-20, 8, 10);
  
   //If Robo Hits
    if (hit) {
  //left eye
   noStroke ();
   fill(150, 0, 120); // purple
   ellipse (x-15, y-20, 8, 10);
  //right eye
   noStroke ();
   fill(150, 0, 120); // purple
   ellipse (x+15, y-20, 8, 10);
    
    }else{
     //left eye
   stroke (255);
   fill(255); 
   ellipse (x-15, y-20, 8, 10);
  //right eye
   stroke (255);
   fill(255); 
   ellipse (x+15, y-20, 8, 10);
 
    }
  
  //Draw Robo's atenna
  stroke(255);
  line(x, y-60, x-15, y-100);
  line(x, y-60, x+15, y-100);
  
  //Draw Robo's atenna balls
  noStroke ();
  fill (150, 0, 120); // purple
  ellipse(x+15, y-100, 15, 15);
  ellipse(x-15, y-100, 15, 15);
  
  }
  
  void hitTest(Robo robo) {
     
    if (dist(x, y, robo.x, robo.y) <= 100) { 
      robo.hit = true;
      hit = true;
    } else {
      robo.hit = false;
      hit = false;
    }
  }
}



