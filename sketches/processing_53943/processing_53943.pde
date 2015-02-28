
float x = 0.0;
 
void setup(){
  size(500,500); //canvas size
  background(0); //initial background colour
  noStroke();
  ellipseMode(CENTER); //ellipses are drawn from center
  
}

void draw() {
  frameRate(40); //speed of the ellipse growing
  background (0,0,0); //background colour is black
  
  fill(random(255 - x), 0, 0); //red turning into black, blinking
  ellipse (250+x,250, 30 + x/2,  30 + x/2);  //east
  
  fill(random(255 - x), 0, 0); //red turning into black, blinking
  ellipse (250-x,250, 30 + x/2, 30 + x/2);  //west
  
  fill(random(255 - x), 0, 0); //red turning into black, blinking
  ellipse (250,250+x,30 + x/2,  30 + x/2);  //south
  
  fill(random(255 - x),0,0); //red turning into black, blinking
  ellipse (250,250-x, 30 + x/2, 30 + x/2);  //north
  
  fill(random(255 - x),0,0); //red turning into black, blinking
  ellipse (250+x, 250-x, 30 + x/2, 30 + x/2);  //northeast
  
  fill(random(255 - x),0,0); //red turning into black, blinking
  ellipse (250-x, 250-x, 30 + x/2, 30 + x/2);  //northwest
  
  fill(random(255 - x),0,0); //red turning into black, blinking
  ellipse (250+x,250+x, 30 + x/2, 30 + x/2);  //southeast
  
    fill(random(255 - x),0,0); //red turning into black, blinking
  ellipse (250-x, 250+x, 30 + x/2, 30 + x/2);  //southwest
  
  //radius
  if(x < 250) //if x is smaller than 250
  {
     x += 2; //increases value by 2
  }
  else
  {
     x = 0; //if x is bigger, returns to 0
  }
}                           
