
void setup () {
  
  size (700,400);
  background(0);
  
  
  
}

int value = 255;

void draw() {
  fill(value);
  ellipse(350,200,200,100);
}

void mouseDragged() 
{
  value = value + 10;
  if (value > 255) {
    value = 0;
  }
} 
  
  
  
  
  


