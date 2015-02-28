
int y;
int x;
//int rColor;
//int gColor;
//int bColor;



void setup() {
  size(500, 500);
  smooth();
  ellipseMode(CENTER);
  background(255);
  
}

void draw(){
  smooth();
  for(int y = 0; y <= height; y+=30){
    ourFirstFunction(x, y);
      for(int x = 0; x <= width; x+=30){
        ourFirstFunction(x, y);
    }
  }
  fill(random(255), random(200), random(200), 20);
}

void ourFirstFunction(int xPos, int yPos){
  noStroke();
 // fill(100, 0, 50, 10);
 // fill(rColor, gColor, bColor, 20);
  ellipse(xPos, yPos, 20, 20);
}

