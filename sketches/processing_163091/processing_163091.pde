
void setup()
{
  size(600,600);
  frameRate(30);
}

void draw(){
  
  int x = mouseX;
  int y = height;
  
  if(mousePressed){
  background(32);
  line(x,y,x/1.5,0);
  stroke(255,228,10);
  strokeWeight(20);
  
  }
    
  }

