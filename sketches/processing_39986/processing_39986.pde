

void setup() {
  size(600, 600);
}

void draw() {
 if(200< mouseX & mouseX<400){
    background(mouseX-200,100,random(100));
   }
    
  else {
   background(50,10,10);
  }

  for (int x=10; x < width; x = x + 40) {
    for (int y=10; y<height; y=y+40) {
      stroke(185,50,random(255));
      strokeWeight(10);
      fill(0, 200, random(255));
      rect(x,y,20,20);

    }
  }
}
   
