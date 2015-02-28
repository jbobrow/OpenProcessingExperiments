
bullet[] bullet = new bullet[100];
PImage b;


 
void setup(){
  size(400,400);
  background (0);
  
    b = loadImage("armyman.gif");
    
    
  for (int i = 0; i < bullet.length; i++) {
    bullet[i] = new bullet(#FFD400,0,random(height),i/2);
  }
}

 
void draw(){
  background(255);
  
  for (int i = 0; i < bullet.length;i++) {
    bullet[i] .move();
    bullet[i].display();
  }
}
  
  
  
class bullet {
//bullet variables  
    color c;
    float xpos;
    float ypos;
    float xspeed;
    
  //bullet constructor 
bullet (color c_, float xpos_, float ypos_, float xspeed_) {
      c = c_;
      xpos = xpos_;
      ypos = ypos_;
      xspeed = xspeed_;
    }
  // display bullet  
    void display () {
      rectMode(CENTER);
      ellipseMode(CENTER);
      stroke (0);
      fill (c);
      ellipse (xpos+10,ypos,10,10);
      rect (xpos,ypos,20,10);
      rect (xpos-12,ypos,2,10);
      
    }
    
    //move bullet
    void move() {
      xpos = xpos + xspeed;
      if (xpos > width) {
        xpos = 0;
      }
       image(b,150,150);
    }
   
  }    



