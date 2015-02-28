
float x = 0.0;
  
void setup(){
  size(300,300); //canvas size
  background(0); //initial background colour
  noStroke();
  ellipseMode(CENTER); //ellips is drawn from center
   
}
 
void draw() {
  frameRate(40); //speed of the ellipse growing
  background (0,0,0); //background colour is black
   
   //red turning into black, blinking
   fill(random(155 - x),0,0); //red turning into black, blinking
  ellipse (150,150-x, 30 + x/2, 30 + x/2);  //north

   
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

                
                                                                
