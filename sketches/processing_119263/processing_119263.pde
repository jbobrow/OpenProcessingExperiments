
int x=0; 
int dx = 1;

void setup() {
  size(600,600);
}
 
void draw(){
  x=x+dx;
  
  if (x == 600 || x==0) {
    dx = dx * -1 ;
  } 
  
  
  translate(x,100);
  // erase last frame
  background(255,142,159);
  fill(200,0,0);
  ellipse(10,30,40,20);
  
  fill(35,25,180);
     
  // draw stick person
  ellipse(10,20,40,20);
  
    
}
