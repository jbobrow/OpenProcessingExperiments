
void setup(){
  size(500,500);
  background(0);
  smooth();
  fill(255);
  stroke(255);
  for (int y=20; y<=height-20; y+=50) {
  for (int x=20; x<=width-20; x+=50) {
    ellipse(x,y,10,10);
    line(x,y,250,250);
  }
  }  
} 


                
                
