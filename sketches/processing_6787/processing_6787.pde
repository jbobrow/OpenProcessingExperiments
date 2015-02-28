
class Clock{
  
  PFont f = createFont("Arial Bold",12,true);
  
  int x,y;
  
  float radio;
  
  Clock(){
    radio = height/2;
    x = width/2;
    y = height/2;
  }
  
  Clock(int x_, int y_, int radio_){
    x = x_;
    y = y_;
    radio = radio_;
  }
 
  void display(float theta){
    textFont(f,12);
    fill(255,255);
    textAlign(LEFT);
    text("Speed: " + speed ,5,12 );
    if (bubbles.length > 0 )text("Sound: " + (selected + 1) + "/" + bubbles.length ,5,height-5);
    textAlign(RIGHT);
    text(theta, width-5,height-5);
  
    float extremeX = radio * cos(theta);
    float extremeY = radio * sin(theta);
    
    stroke(255,255);
    strokeWeight(1);
    line(x, y, x + extremeX, y + extremeY);
    
    stroke(255,100);
    strokeWeight(3);
    line(x, y, x + extremeX, y + extremeY);
  }
  
  void displayCenter(float level_){
    noStroke();
    fill(255,50);
    ellipse(width/2,height/2,level_,level_);
    ellipse(width/2,height/2,level_-level_/4,level_-level_/4);
    ellipse(width/2,height/2,level_/2,level_/2);
    ellipse(width/2,height/2,level_/4,level_/4);
  }
}

