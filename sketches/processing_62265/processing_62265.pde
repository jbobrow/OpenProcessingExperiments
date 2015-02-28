
int number1;
int number2;
int number3;
void setup()
{
  number3=5;
  size(800, 600);
  background(0, 0, 0);
  smooth();
  textAlign(CENTER);
  number1=1;
  number2=3;
 }

void draw()
{  
  frameRate(number3);
  background(255, 255, 255);
  fill(random(255), random(255), random(255));
  text("Its Almost Summer", width/2, height/2);
  textSize(random(80));
  number1= int(random(1, 9));

  if (number1 == 1)
  {
    image( loadImage("one.jpg"), 0, 0);
    fill(random(255), random(255), random(255));
    text("Its Almost Summer", width/2, height/2);
    textSize(random(30, 80));
  }

  if (number1 == 2)
  {
    image( loadImage("two.jpg"), 0, 0);
    fill(random(255), random(255), random(255));
    text("Its Almost Summer", width/2, height/2);
    textSize(random(30, 80));
  }

  if (number1 == 3)
  {
    image( loadImage("three.jpg"), 0, 0);
    fill(random(255), random(255), random(255));
    text("Its Almost Summer", width/2, height/2);
    textSize(random(30, 80));
  }

  if (number1 == 4)
  {
    image( loadImage("four.jpg"), 0, 0);
    fill(random(255), random(255), random(255));
    text("Its Almost Summer", width/2, height/2);
    textSize(random(30, 80));
  }


  if (number1 == 5)
  {
    image( loadImage("five.jpg"), 0, 0);
    fill(random(255), random(255), random(255));
    text("Its Almost Summer", width/2, height/2);
    textSize(random(30, 80));
  }

  if (number1 == 6)
  {
    image( loadImage("six.jpg"), 0, 0);
    fill(random(255), random(255), random(255));
    text("Its Almost Summer", width/2, height/2);
    textSize(random(30, 80));
  }
  if (number1 == 7)
  {
    image( loadImage("seven.jpg"), 0, 0);
    fill(random(255), random(255), random(255));
    text("Its Almost Summer", width/2, height/2);
    textSize(random(30, 80));
  }
  if (number1 == 8)
  {
    image( loadImage("eight.jpg"), 0, 0);
    fill(random(255), random(255), random(255));
    text("Its Almost Summer", width/2, height/2);
    textSize(random(30, 80));
  }
  if (key=='f')
  {
    number3+=1; 
  }
  if (key=='s')
  {
    number3-=1; 
    if(number3<1)
    {
      number3=1;
    }
  }
  if (mousePressed)
  {
    number2= int(random(1, 8));
    if (number2 == 4)
    {
      background (0,0,0);
      textSize (65);
      fill(255,0,0);
      text("YOU STILL HAVE EXAMS!!", width/2, height/2);
      text("Haha!!", width/2, height/2+60);
      noLoop();
    }
  }
}


