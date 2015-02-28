
int [] array = { 10, 30, 255, 150, 90};
int [] velocityX = {1, 2, 1, 2, 1};
int [] velocityY = {1, 2, 1, 2, 1};
int [] direction1 = {1, 1, 1, 1, 1};
int [] direction2 = {1, 1, 1, 1, 1};

void setup()
{
  size(300, 300);
  smooth();
  background(255);
  ellipseMode(CENTER);
 
 
}

void draw()
{
  background(255);
  shape1();
  shape2();
  shape3(); 
  shape4();
  shape5();
  
  if(mouseX <= 20 || mouseX >= height - 20 || mouseY >= height - 20)
  {
    for(int i = 0; i <= 4; i++)
    {
      array[i] = array[i] + 20;
      velocityX[i] = velocityX[i]/2 ;
      velocityY[i] = velocityY[i]/2;
      direction1[i] = direction1[i] * -1;
      direction2[i] = direction2[i] * -1;
    }
  }
  
  
  
  
}

void shape1()
{
  fill(array[2], array[3], array[4]);             
  array[0] = array[0] + (velocityX[0] * direction1[0]);
  if(array[0] + 5 >= width || array[0] - 5<= 0)
    direction1[0] = direction1[0] * -1;
  ellipse(array[0], width/2, 20, 20);
}

void shape2()
{
  fill(array[3], array[4], array[0]);
  array[1] = array[1] + (velocityY[0] * direction2[0]);
  if(array[1] + 30 >= height || array[1] <= 0)
    direction2[0] = direction2[0] *-1;
  rect(width/2, array[1], 30, 30);
}

void shape3()
{
  fill(array[4], array[1], array[2]);
  array[4] = array[4] + (velocityX[1] * direction1[1]);
  array[2] = array[2] + (velocityY[1] * direction1[1]);
  if(array[4] + 10 >= width || array[4]<= 0)
    direction1[1] = direction1[1] * -1;
  rect(array[4], height/2, 20, 20);
}

void shape4()
{
  fill(array[4], array[0], array[2]);
  array[3] = array[3] + (velocityX[2] * - direction1[2]);
  array[0] = array[0] + (velocityY[3] * direction2[1]);
  if(array[3] + 10 >= width || array[3]<= 0)
    direction1[2] = direction1[2] * -1;
  if(array[0] + 10 >= height || array[0]<= 0)
    direction2[1] = direction2[1] * -1;
   ellipse(array[3], array[0], 20, 20);
}

void shape5()
{
    fill(array[1], array[0], array[3]);
  array[0] = array[0] + (velocityX[3] * direction1[3]);
  array[4] = array[4] + (velocityY[4] * - direction2[2]);
  if(array[0] + 10 >= width || array[0]<= 0)
    direction1[3] = direction1[3] * -1;
  if(array[4] + 10 >= height || array[0]<= 0)
    direction2[2] = direction2[2] * -1;
   ellipse(array[0], array[4], 20, 20);
}
