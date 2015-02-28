
PFont font;

Square square0;
Square square1;
Square square2;
Square square3;
Square square4;
Square square5;

float[] squareArray;

void setup ()
{
  font = loadFont("AgencyFB-Reg-48.vlw");
  
  square0 = new Square();
  square1 = new Square();
  square2 = new Square();
  square3 = new Square();
  square4 = new Square();
  square5 = new Square();
  
  square0.initiate(50, 25, 0);
  square1.initiate(100, 25, 1);
  square2.initiate(150, 25, 2);
  square3.initiate(200, 25, 3);
  square4.initiate(250, 25, 4);
  square5.initiate(300, 25, 5);
  
  size(500, 500);
  squareArray = new float[6];
  
  for(int i = 0; i < 5; i++)
  {
    squareArray[i] = (int) random (10);
  }
}

void draw ()
{
  background(0);
  square0.display();
  square1.display();
  square2.display();
  square3.display();
  square4.display();
  square5.display();
}

void mousePressed()
{
  square0.check();
  square1.check();
  square2.check();
  square3.check();
  square4.check();
  square5.check();
}

class Square
{
  int squareX;
  int squareY;
  int matrix;

  void initiate (int tempPosX, int tempPosY, int tempMatrix)
  {
    squareX = tempPosX;
    squareY = tempPosY;
    matrix = tempMatrix;
  }

  void display ()
  {
    rect(squareX, squareY, 30, 30);
    text(squareArray[matrix], (squareX + 15), 70);
  }

  void check ()
  {
    if (mouseX > squareX && mouseX < (squareX + 30) && mouseY > squareY && mouseY < (squareY + 30))
    {
      squareArray[matrix] = squareArray[matrix] + 1;
          if (matrix < 5)
    {
      squareArray[(matrix+1)]++;
    }
        if (matrix > 0)
    {
      squareArray[(matrix-1)]++;
    }
    } 


  }
}
