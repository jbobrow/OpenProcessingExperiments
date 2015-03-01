
void setup(){
  size(400,400);
  frameRate(20);
}

void draw(){
   drawShape((random(width)),(random(height)), color(random(255),random(255),random(255)));
}

void drawShape(int x, int y, color c){
  fill(c);
  rect(x,y,50,50); 
  ellipse(x+25,y+25,40,49); 
  line(x+45,y+25,x+5,y+25); 
}
