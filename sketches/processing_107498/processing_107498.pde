
PImage button;
PImage cross;
void setup()
{
  button = loadImage("button.jpg");  
  cross = loadImage("cross.jpg");
  size (300,300);
  background(255,255,255);
  strokeWeight(2);
}

boolean Xs_turn = true;

int centerX;
int centerY;

void draw()
{
  drawGrid();
}


void mousePressed()
{
  int centerX = ( mouseX / 100 ) * 100 + 50;
  int centerY = ( mouseY / 100 ) * 100 + 50;
  
  if (Xs_turn)
    drawX(centerX, centerY);
  else  
    drawO(centerX, centerY);
   
   Xs_turn = !Xs_turn;
}


void drawGrid()
{
  line(0,100, 300,100);
  line(0,200, 300,200);
  line(100,0, 100,300);
  line(200,0, 200,300);
} 


void drawO(int x, int y)
{
 image( button, x-50, y-50 );
  // ellipse( x, y, 50,50);
}
 
  
void drawX(int x, int y)
{
  image( cross, x-50 ,y-50 );
  //line(x - 25, y +25, x +25, y -25);
  //line(x - 25, y -25, x +25, y +25);
}  

