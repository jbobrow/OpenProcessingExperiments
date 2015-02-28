
float x; 
float y;
float previousX;  
float previousY; 


void setup(){
  size(600,600);
  x=width/2;
  y=height/2;
  background(255);
}

void draw(){
  drawLine();
}

void drawLine(){
  previousX = x;
  previousY = y;
  x = x+random(-10,10);
  y = y+random(-10,10);
  line(x,y,previousX,previousY);
}


