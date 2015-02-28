
//Code based on Workshop4_FHNW by Roman Rast
 
int size=10;
float red = random(200,255);
float green = random(0,255);
float blue = 0;
float opacity=100;
 
void setup() {
  size(500,1000);
  background(0);
  noStroke();
  fill(red,green,blue);
}
 
void draw() {
  if(mousePressed){
    fill(red,green,blue,opacity);
    ellipse(mouseX,mouseY,size,size);
    
    size = size+2;
    opacity--;
  }
}

void mouseReleased(){
  size = 10;
  red = random(200,255);
  green = random(0,255);
  blue = blue;
  fill(red,green,blue);
  opacity = 100;
}
