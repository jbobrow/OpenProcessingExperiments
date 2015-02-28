
//Assignment #3
//Anna Perocchi
//aperocchi@brynmawr.edu	
//September 23, 2010

//set floats
float x = 250;
float y = 250;
float w = 60;
float h = 60;

//setup
void setup () {
  background (0);
   size (500, 500);
   smooth ();
   
}
// flower factors
void draw () {
  drawFlower (x, y, w, h);
  float factor = constrain (mouseX/10, 0, 5);
  jiggleFlower (factor);
}
//draw original flower
   void drawFlower (float x1, float y1, float w1, float h1) {
   
    ellipseMode (CENTER);
    noStroke ();
    fill (255, 0, 0, 150);
    ellipse (x1 + 30, y1 + 40, w1, h1);
    
    noStroke ();
    fill (0, 0, 255, 150);
    ellipse (x1 - 5, y1 + 50, w1, h1);
    
    noStroke ();
    fill (150, 0, 200, 150);
    ellipse (x1 - 40, y1 + 25, w1, h1);
    
    noStroke ();
    fill (0, 255, 255, 150);
    ellipse ( x1 - 45, y1 - 15, w1, h1);
    
    noStroke ();
    fill (150, 250, 150, 150);
    ellipse (x1 - 15, y1 - 45, w1, h1);
    
    noStroke ();
    fill (255, 0, 255, 150);
    ellipse (x1 + 30, y1 - 40, w1, h1);
    
    noStroke ();
    fill (255, 150);
    ellipse (x1 + 45, y1 + 5, w1, h1);
     
    noStroke ();
    fill (255, 255, 0);
    ellipse (x1, y1, w1, h1);
    
  }
  //jiggle flower code 
  void jiggleFlower (float speed) {
    x = x + random (-1, 1) * speed;
    y = y + random (-1, 1) * speed;
    
    x = constrain (x, 0, width);
    y = constrain (y, 0, height);
  }
  
  //mouse clicked yields new flower w/ random middle color
  void mouseClicked () {
    drawFlower (mouseX,mouseY,60,60);
    noStroke ();
    fill (random(255),random(255),random(255));
    ellipse (mouseX,mouseY,60,60);
    
  }


