

void setup() {
  size(800, 600);  
  background(2,3,0);  
  noStroke();
  
}
void draw (){
  
  for (int x=0; x<=width; x= x+10){
    for (int y=0; y<=width; y= y+10){
    fill(random(0,255),random(0),random (0,255));
    
rect (x,y, 10, 10);
frameRate (8);


  }
}
  
  }

