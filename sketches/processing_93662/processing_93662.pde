
int barWidth = 20;
int lastBar = -1;

void setup() 
{
  size(640, 360);
  colorMode(HSB, height, height, height);  
  noStroke();
  background(0);
}

void mouseDragged(){
  
     fill(mouseY, height, height);
    
     rect(mouseX, mouseY, 5, 5);
    
    
}

void draw() 
{

}
