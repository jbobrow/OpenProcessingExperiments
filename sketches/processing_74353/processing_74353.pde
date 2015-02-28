
int d = 50;
int x = 200;
int y = 200;

float r = 0;
float g = 126;
float b = 30;

void setup(){
   size(400,400, P2D);
   smooth(8);
   background(255);
}

void draw(){

  fill(255, 50);
  rect(0, 0, width, height); 
  
  fill(r,g,b,20);
  ellipse(x, y, d, d);
  
  d = d+1;
  
  
  if(mousePressed) {
    
    //r = random(255);
    g = random(255);
    b = random(255);
    
    d = d = 50;
  }
  
  r = mouseY;
}
