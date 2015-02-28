
int topX;
int topY;

void setup() {  //setup function called initially, only once
  size(500, 500);
  topX = 100;
  topY = height/2;  
}

void draw() {  //draw function loops 
  background(255);  //set background white
 triangle(topX, topY, topX + 25, topY + 25, topX - 25, topY +25);

    //move down
 topY++;
}
