
  float fade = 50;


void setup() {
  size(800,800);
  
  background(0);
  smooth();
  stroke(random(360),0,360,500);
  noFill();
  colorMode(HSB);

}
 
void draw() {
 
  fill(0,fade);
  rect(-1,-1, width+1, height+1);
  line(mouseY,height/2,width/2,mouseX);
}
void keyPressed() {
 
  if(key != CODED)
    switch(key)
    {
     
      case 'd': fade = 0; break;
     
    }
}
void keyReleased() {
 
  if(key != CODED)
    switch(key)
    {
      
      case 'd': fade = 50;
     
    }
}
 
void clearBoard()
{
  background(0);
}

void mouseReleased(){
  stroke(random(360),random(500),360,500);
}
void mouseDragged() {
  stroke(random(360),random(500),360,500);
}



