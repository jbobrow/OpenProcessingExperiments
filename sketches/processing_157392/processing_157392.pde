
float car1Speed = random(1,11);
float car2Speed = random(1,11);
float car3Speed = random(1,11);
boolean car1_win = false;
boolean car2_win = false;
boolean car3_win = false;
boolean win = false;
float i = 0;
float x = 0;

void setup()
{
  size(600,400);
  smooth();
  textSize(300);
}

void draw()
{
  background(0);
  car1(x * car1Speed,100,#FF0000);
  car2(x * car2Speed,200,#00FF00);
  car3(x * car3Speed,300,#0000FF);
  fill(255);
  if(i <=100)
  {
    text("3",200,275);
  }
  if(i > 100 && i <=200)
  {
    text("2",200,275);
  }
  if(i > 200 && i <= 300)
  {
    text("1",200,275);
  }
  if(i > 300 && i <= 400)
  {
    text("Go!",50,275);
  }
  if(i > 400)
  {
    x += 1;
  }
  i += 1;
  if(car1_win == true)
  {
    textSize(50);
    win = true;
    fill(#FF0000);
    text("Red Wins!",185,225);
  }
  if(car3_win == true)
  {
    textSize(50);
    win = true;
    fill(#0000FF);
    text("Blue Wins!",185,225);
  }
  if(car2_win == true)
  {
    textSize(50);
    win = true;
    fill(#00FF00);
    text("Green Wins!",185,225);
  }
}

void car1(float x,float y,color carcolor)
{
  fill(carcolor);
  rect(x,y,15,10);
  if(x >= 600 && win == false)
  {
   car1_win = true;
  }
}

void car2(float x,float y,color carcolor)
{
  fill(carcolor);
  rect(x,y,15,10);
  if(x >= 600 && win == false)
  {
   car2_win = true;
  }
}

void car3(float x,float y,color carcolor)
{
  fill(carcolor);
  rect(x,y,15,10);
  if(x >= 600 && win == false)
  {
   car3_win = true;
  }
}


