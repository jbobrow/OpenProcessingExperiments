
void setup() {
  size(600, 600);
}
 
void draw() {
 if(200< mouseX & mouseX<400){
    background(50,mouseX-200,random(100));
   }
     
  else {
   background(50,10,10);
  }
 
  for (int x=10; x < width; x = x + 40) {
    for (int y=10; y<height; y=y+40) {
      stroke(60,180,random(255));
      strokeWeight(15);
      fill(0, 200, random(255));
      ellipse(x,y,12,100);
 
    }
  }
}

                
                                
