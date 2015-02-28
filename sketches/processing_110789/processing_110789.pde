
PShape square;  // The PShape object
PShape movingSquare;

float speed = 1.5;
int upOrDown = 1;
float moveY = 0;
boolean changeDirection = false;

int topLimit = -90;
int bottomLimit = 290;

void setup() {
  size(800, 800, P2D);
  square = createShape(RECT, 200,800,800,800);
  square.setFill(color(250,250,250));
  
  movingSquare = createShape(RECT, 200, 200, 200, 200);
  movingSquare.setFill(color(245,230,10));
}

void draw() {  
  fill (80,100,80) ;
  shape(square, 200,700);

  background(250);
  strokeWeight(20);  // Beastly;

  line (0,300, 300, 300);
  line (750,600,750,800);
  line (750, 698,800,698);

  // Dark red
  fill(127,0,0);
  rect(0,0,800,600);

  // changeDirection = false;
 
  if(moveY < topLimit){
    changeDirection = true;
  }

  if(moveY > bottomLimit){
    changeDirection = true;
  }

  if(changeDirection){
    upOrDown = upOrDown * -1;
    changeDirection = false;
  }

  moveY = moveY + upOrDown * speed;
  shape(movingSquare, 200, -100 + moveY);

  // Bright yellow
  fill(245,230,10);
  rect(750,698,800,600);

  // Dark blue
  fill(20,0,100);
  rect(0,600,150,300);
  
}
