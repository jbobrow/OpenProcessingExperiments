
float distance;
int i=0;
int x=1;
int speed=2;


void setup() {
  size(500, 500);
}

void draw () {
  strokeWeight (2);

  distance=dist(mouseX, mouseY, width/2, height/2);
  println("mouseX is " + mouseX + " and mouse Y is " + mouseY);

  background(73, 227, 159);

  fill(234, 43, 43);

  for (int i=0; i<5; i=i+1) {
    ellipse (125, 125*i, distance, distance);
  }
  
  drawSnowman();
}


void drawSnowman(){
  ellipse (250, 100, 50,50);
  ellipse (250, 200, 75,75);
  

}
