
void setup(){
size (450,450);
background (255);
smooth();
}

void draw(){
  stroke(random(256));
  float x1=random(width);
  float y1=random(height);
  float x2=random(width);
  float y2=random(height);
  line(x1,y1,x2,y2);
}

void reset(){
  fill(255)
  rect(0,0,450,450);
  }
        
void mousePressed() { 
  reset();
}        
