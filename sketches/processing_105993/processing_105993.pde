
int x =1;
int y=1;

float mouthX; 
float mouthY;

float foodX = 100;
float foodY = 50;

float foodDist;


void setup() {
  size(500,500);
}  

void draw() {
  background(255);
  mouthX= x+60;
  mouthY = y+50;
  
  foodDist = dist(mouthX, mouthY, foodX, foodY);
  
  println(foodDist);



  //Body
  fill(0,274,239);
  rect(x, y, 80, 80);
  rect(x, y, 10, 150);
  noStroke();
  rect(x+40, y, 10, 150);


  //Eyes
  fill(0);
  noStroke();
  ellipse(x+30, y+20, 50, 50);
  fill (255);
  ellipse(x+20, y+20, 10, 10);
  fill(0);
  ellipse(x+80, y+20, 35, 35);
  fill(255);
  ellipse(x+90, y+20, 10, 10);

  //Mouth

  fill(random(255));
  stroke(255);
  rect(x+60, y+50, 10, 10);

  //food
  fill (0);
  rect(foodX, foodY, 10, 10); 



  if ((keyPressed) && (key == CODED)) {
    if (keyCode == LEFT) {
      fill(random(255),random(255),random(255));
      x-=5;
    }
    if (keyCode == RIGHT) {
      x+=5;
    }
    if (keyCode == UP) {
      y-=5;
    }
    if (keyCode == DOWN) {
      y+=5;
    }
  }
  if ((keyCode == DOWN) && (keyCode == LEFT)) {
    y+=5;
    x-=5;
  }
  if (x == 0) {
    x = width;
  }
  if (x == width + 1) {
    x = 0;
  }
  if (y == height) {
    y = 0;
  }
  if (y == -1) {
    y = height;
  }
  
 if (foodDist <10) {foodX = random (width-200);
 foodY = random (height-200);
   
 }
 
}
