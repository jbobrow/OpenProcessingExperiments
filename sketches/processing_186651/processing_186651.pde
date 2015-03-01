
//----------------------//
//Balls
//By Brandon Messner
//----------------------//

void setup() { 
 background(0);
 size(500, 500); 
 frameRate(10);
 //noLoop(); 
} 
 
void draw() {

  for (float i=0; i<=width; i=i+random(10,50)) {
    for (float j=0; j<=height; j=j+random(10,50)) {
      ball(i,j);
    }
  }
  
}

void ball(float x, float y) {
  strokeWeight(3);
  fill(x/3,y/3,x/3);
  ellipse(x,y,30,30);
}


