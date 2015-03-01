
int c=255;
float diameter=75;

void setup() {
  size(600, 600);
}

void draw() {
  float sinOfTime = sin( millis() * 0.007 );
  float sinMappedX = map( sinOfTime, -1.0, 1.0, 5, 25 );
  float sinMappedY = map( sinOfTime, -1.0, 1.0, 5, 25 );
  background(255,mouseX,mouseY);
  for (int y=height/8; y<height; y+=height/24) {
    for (int i=width/8; i<width; i+=width/8) {

      if (dist(mouseX, mouseY, i+y, y)<diameter/2) {
        fill ( int(random(255)), int(random(112)), 255);
      } 
     else{
     fill(115,355,78);}
      stroke(0);
      
      ellipse(i+y, y, height/16-y/10,height/16-y/10);
     
    } 
  }
    for (int y=height/24; y<height; y+=height/24) {
    for (int i=width/24; i<width; i+=width/8) {

      if (dist(mouseX, mouseY, i+y, y)<diameter/2) {
        
        
        fill ( int(random(255)), 255, int(random(112)));
        
      } 
     else{
     fill(#36A6FF);
   }
     

     
      
      ellipse(i+y, y, height/16-y/10,height/16-y/10);
     
    } 
  }



}




