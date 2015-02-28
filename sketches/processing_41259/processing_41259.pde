
//1
float moveX = 11;
float moveY = 50;
float mA = 1;
float mB = 1;
//2
float moveX2 = 11;
float moveY2 = 150;
float m2A = 1;
float m2B = 1;
//3
float moveX3 = 11;
float moveY3 = 250;
float m3A = 1;
float m3B = 1;
//4
float moveX4 = 11;
float moveY4 = 350;
float m4A = 1;
float m4B = 1;
//5
float moveX5 = 11;
float moveY5 = 450;
float m5A = 1;
float m5B = 1;
//6
float moveX6 = 11;
float moveY6 = 550;
float m6A = 1;
float m6B = 1;

void setup()
{
  size(600, 600);
}

void draw()
{
  fill(116,32,32, 15);
  rect(0, 0, width, height);

  noStroke();
  fill(22,200,11,200);
  
  /////////////////////////////////////////////1
  ellipse(moveX,moveY, 20, 20);
  if(moveX> width-10 || moveX < 10)
  {
    mA = mA * (-1);
  }
  moveX += mA*4;
  
  if(moveY> height-10 || moveY < 10)
  {
    mB = mB * (-1);
  }
  moveY += mB;
  /////////////////////////////////////////////2
  
  ellipse(moveX2,moveY2, 20, 20);
  if(moveX2> width-10 || moveX2 < 10)
  {
    m2A = m2A * (-1);
  }
  moveX2 += m2A*4;
  
  if(moveY2> height-10 || moveY2 < 10)
  {
    m2B = m2B * (-1);
  }
  moveY2 += m2B;
  ///////////////////////////////////////////////3
  
  ellipse(moveX3,moveY3, 20, 20);
  if(moveX3> width-10 || moveX3 < 10)
  {
    m3A = m3A * (-1);
  }
  moveX3 += m3A*4;
  
  if(moveY3> height-10 || moveY3 < 10)
  {
    m3B = m3B * (-1);
  }
  moveY3 += m3B;
  ///////////////////////////////////////////////4
  
  ellipse(moveX4,moveY4, 20, 20);
  if(moveX4> width-10 || moveX4 < 10)
  {
    m4A = m4A * (-1);
  }
  moveX4 += m4A*4;
  
  if(moveY4> height-10 || moveY4 < 10)
  {
    m4B = m4B * (-1);
  }
  moveY4 += m4B;
  ///////////////////////////////////////////////5
  
  ellipse(moveX5,moveY5, 20, 20);
  if(moveX5> width-10 || moveX5 < 10)
  {
    m5A = m5A * (-1);
  }
  moveX5 += m5A*4;
  
  if(moveY5> height-10 || moveY5 < 10)
  {
    m5B = m5B * (-1);
  }
  moveY5 += m5B;
  ///////////////////////////////////////////////6
  
  ellipse(moveX6,moveY6, 20, 20);
  if(moveX6> width-10 || moveX6 < 10)
  {
    m6A = m6A * (-1);
  }
  moveX6 += m6A*4;
  
  if(moveY6> height-10 || moveY6 < 10)
  {
    m6B = m6B * (-1);
  }
  moveY6 += m6B;
  /////////////////////////////////////////////// end of flying balls
  
  
  fill(random(255),0,100);
  noStroke();
  float x = random(width);
  float y = random(height);
  ellipse(x,y, 10, 10);
  
  star(random(width), random(height),random(255), random(50), random(255));
  star(random(width), random(height),random(255), random(50), random(255));
  star(random(width), random(height),random(255), random(50), random(255));
  star(random(width), random(height),random(50), random(50), random(255));
  star(random(width), random(height),random(50), random(50), random(255));
  star(random(width), random(height),random(50), random(50), random(255));

}

// star generator, to be called in main draw method
void star(float xloc, float yloc, float R, float G, float B)
{
  int mapValue = 1;
  noStroke();
  colorMode(RGB, 255);
  fill(R, G, B);
  triangle(xloc + 10, yloc + 8.65, xloc - 10, yloc + 8.65, xloc, yloc - 8.65);
  triangle(xloc, yloc + 8.65 + 6, xloc + 10, yloc - 8.65 + 6, xloc - 10, yloc - 8.65 + 6);
}

