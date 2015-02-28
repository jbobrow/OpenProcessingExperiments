
//Sara Humel hmwk3
//copyright 2012


void setup( ) {
  size(400,400);
 background(0,0,0);
}

void draw( ) {
  float x= random(mouseX-width/10,mouseX+width/10);
  float y= random(mouseY-width/10,mouseY+width/10);
  fill(0,y,x);
  strokeWeight(2);
  stroke(255,255,0);
  float d= random(20);
  ellipse(x,y,d,d);
  noStroke();
  fill(255,255,255); 
}               
             
                
                
