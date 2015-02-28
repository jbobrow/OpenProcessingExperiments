
PImage coffee;
PImage computer;
PImage home;
PImage food;
PImage sleep;

PFont font;

int coffeeCount=0;
int computerHourCount=0;
int homeworkCount=0;
int foodCount=0;
int sleepHourCount=0;

int commonhourCount=80;

int numberOfDays=18;
int dayCount=1;
int hourCount=1;
int yCount=2;


int totalCoffeeCount=0;
int totalComputerHours=0;
int totalHomeWorkHours=0;
int totalSleepHours=0;
int totalNumberOfMeals=0;




//add colour...designing the page..stuff like that

boolean coffeeCompletion=false;

int[] a_coffee= {
  2, 2, 2, 2, 2, 2, 2, 4, 4, 4, 4, 5, 5, 5, 5, 5, 5, 7
};
int[] a_computer= {
  4, 4, 6, 6, 6, 6, 6, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9
};
int[] a_homework= {
  2, 2, 3, 3, 4, 4, 4, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 7
};
int[] a_food= {
  3, 3, 3, 3, 3, 3, 3, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1
};
int[] a_sleep= {
  6, 6, 4, 4, 4, 4, 4, 3, 3, 3, 3, 3, 2, 2, 2, 2, 2, 2
};

void setup() {

  background(255);
  size(screen.width, screen.height);
  smooth();
  coffee=loadImage("coffee.png");
  computer=loadImage("computer.png");
  home=loadImage("home.png");
  food=loadImage("food.png");
  sleep=loadImage("sleep.png");
  noStroke();
  frameRate(5);
}

void draw()
{

  font = loadFont("CenturyGothic-Bold-15.vlw"); 
  textFont(font); 
  textAlign(LEFT, CENTER);

  fill(255, 135, 0);
  rectMode(CORNER);
  rect(80, 20, 220, 40);
  image(coffee, 80, 20, 40, 40);
  fill(0);
  text("ONE COFFEE CUP", 125, 37);
  text(totalCoffeeCount, 270, 37);




  rectMode(CORNER);
  fill(229, 216, 67);
  rect(310, 20, 330, 40);
  image(computer, 310, 20, 40, 40);
  fill(0);
  text("ONE COMPUTER HOUR IN CLASS", 355, 37);
  text(totalComputerHours, 600, 37);



  rectMode(CORNER);
  fill(128, 191, 52);
  rect(660, 20, 270, 40);
  image(home, 660, 20, 40, 40);
  fill(0);
  text("ONE HOMEWORK HOUR", 705, 37);
  text(totalHomeWorkHours, 900, 37);



  rectMode(CORNER);
  fill(56, 166, 96);
  rect(950, 20, 210, 40);
  image(food, 950, 20, 40, 40);
  fill(0);
  text("ONE MEAL", 1005, 37);
  text(totalNumberOfMeals, 1130, 37);



  rectMode(CORNER);
  fill(0, 77, 92);
  rect(1180, 20, 225, 40);
  image(sleep, 1180, 20, 40, 40);
  fill(0);
  text("ONE SLEEP HOUR", 1230, 37);
  text(totalSleepHours, 1375, 37);



  if (dayCount<=numberOfDays)
  {

    fill(0);
    text("DAY "+dayCount, 10, yCount*40+20); 
    if (coffeeCount < a_coffee[dayCount-1]*40)
    {
      image(coffee, commonhourCount, yCount*40, 40, 40);
      totalCoffeeCount+=1;
      coffeeCount+=40;
      commonhourCount+=40;
    }
    else if (computerHourCount<a_computer[dayCount-1]*40)
    {

      image(computer, commonhourCount, yCount*40, 40, 40);
      totalComputerHours+=1;
      computerHourCount+=40;
      commonhourCount+=40;
    }

    else if (homeworkCount<a_homework[dayCount-1]*40)
    {
      image(home, commonhourCount, yCount*40, 40, 40);
      totalHomeWorkHours+=1;
      homeworkCount+=40;
      commonhourCount+=40;
    }
    else if (foodCount<a_food[dayCount-1]*40)
    {
      image(food, commonhourCount, yCount*40, 40, 40);
      totalNumberOfMeals+=1;
      foodCount+=40;
      commonhourCount+=40;
    }
    else if (sleepHourCount<a_sleep[dayCount-1]*40)
    {
      image(sleep, commonhourCount, yCount*40, 40, 40);
      totalSleepHours+=1;
      sleepHourCount+=40;
      commonhourCount+=40;
    }
    else if (sleepHourCount==a_sleep[dayCount-1]*40)
    {
      dayCount++;
      yCount++;
      commonhourCount=80;
      coffeeCount=0;
      computerHourCount=0;
      homeworkCount=0;
      foodCount=0;
      sleepHourCount=0;
    }
  }
}


void mouseClicked()
{
  if ((mouseX<=300 && mouseX>=80) && (mouseY>=20 && mouseY<=60))
  {
    background(255);
    yCount=1;
    coffeeCount=0;
    dayCount=20;
    totalCoffeeCount=0;
    totalComputerHours=0;
    totalHomeWorkHours=0;
    totalSleepHours=0;
    totalNumberOfMeals=0;


    for (int i=1;i<=18;i++)
    { 
      fill(0);
      text("DAY "+i, 10, (yCount+1)*40+20);   
      commonhourCount=80;
      coffeeCount=0;
      yCount++;
      for (int j=0;j<a_coffee[i-1];j++)
      {
        if (coffeeCount< a_coffee[i-1]*40)
        {
          image(coffee, commonhourCount, yCount*40, 40, 40);
          totalCoffeeCount+=1;
          coffeeCount+=40;
          commonhourCount+=40;
        }
      }
    }
  }
  else if ((mouseX<=640 && mouseX>=310) && (mouseY>=20 && mouseY<=60))
  {
    background(255);
    yCount=1;
    computerHourCount=0;
    totalCoffeeCount=0;
    totalComputerHours=0;
    totalHomeWorkHours=0;
    totalSleepHours=0;
    totalNumberOfMeals=0;

    dayCount=20;

    for (int i=1;i<=18;i++)
    {   
      fill(0);
      text("DAY "+i, 10, (yCount+1)*40+20); 
      commonhourCount=310;
      computerHourCount=0;
      yCount++;
      for (int j=0;j<a_computer[i-1];j++)
      {
        if (computerHourCount< a_computer[i-1]*40)
        {
          image(computer, commonhourCount, yCount*40, 40, 40);
          totalComputerHours+=1;
          computerHourCount+=40;
          commonhourCount+=40;
        }
      }
    }
  }

  else  if ((mouseX<=930 && mouseX>=660) && (mouseY>=20 && mouseY<=60))
  {
    background(255);
    yCount=1;
    homeworkCount=0;
    dayCount=20;
    totalCoffeeCount=0;
    totalComputerHours=0;
    totalHomeWorkHours=0;
    totalSleepHours=0;
    totalNumberOfMeals=0;

    for (int i=1;i<=18;i++)
    {    
      fill(0);
      text("DAY "+i, 10, (yCount+1)*40+20); 
      commonhourCount=660;
      homeworkCount=0;
      yCount++;
      for (int j=0;j<a_homework[i-1];j++)
      {
        if (homeworkCount < a_homework[i-1]*40)
        {
          image(home, commonhourCount, yCount*40, 40, 40);
          totalHomeWorkHours+=1;
          homeworkCount+=40;
          commonhourCount+=40;
        }
      }
    }
  }

  else if ((mouseX<=1160 && mouseX>=950) && (mouseY>=20 && mouseY<=60))
  {
    background(255);
    yCount=1;
    foodCount=0;
    dayCount=20;
    totalCoffeeCount=0;
    totalComputerHours=0;
    totalHomeWorkHours=0;
    totalSleepHours=0;
    totalNumberOfMeals=0;

    for (int i=1;i<=18;i++)
    {    
      fill(0);
      text("DAY "+i, 10, (yCount+1)*40+20); 
      commonhourCount=950;
      foodCount=0;
      yCount++;
      for (int j=0;j<a_food[i-1];j++)
      {
        if (foodCount < a_food[i-1]*40)
        {
          image(food, commonhourCount, yCount*40, 40, 40);
          totalNumberOfMeals+=1;
          foodCount+=40;
          commonhourCount+=40;
        }
      }
    }
  }

  else if ((mouseX<=1405 && mouseX>=1180) && (mouseY>=20 && mouseY<=60))
  {
    background(255);
    yCount=1;
    sleepHourCount=0;
    dayCount=20;
    totalCoffeeCount=0;
    totalComputerHours=0;
    totalHomeWorkHours=0;
    totalSleepHours=0;
    totalNumberOfMeals=0;

    for (int i=1;i<=18;i++)
    {    
      fill(0);
      text("DAY "+i, 10, (yCount+1)*40+20); 
      commonhourCount=1180;
      sleepHourCount=0;
      yCount++;
      for (int j=0;j<a_sleep[i-1];j++)
      {
        if (sleepHourCount < a_sleep[i-1]*40)
        {
          image(sleep, commonhourCount, yCount*40, 40, 40);
          totalSleepHours+=1;
          sleepHourCount+=40;
          commonhourCount+=40;
        }
      }
    }
  }
  else
  {

    background(255);
    yCount=1;
    dayCount=20;
    totalSleepHours=59;
    totalNumberOfMeals=42;
    totalHomeWorkHours=89;
    totalComputerHours=137;
    totalCoffeeCount=67;

    for (int i=1;i<=numberOfDays;i++)
    {    
      fill(0);
      text("DAY "+i, 10, (yCount+1)*40+20); 
      commonhourCount=80;
      sleepHourCount=0;
      homeworkCount=0;
      computerHourCount=0;
      coffeeCount=0;
      foodCount=0;
      yCount++;

      for (int j=0;j<a_coffee[i-1];j++)
      {
        if (coffeeCount < a_coffee[i-1]*40)
        {
          image(coffee, commonhourCount, yCount*40, 40, 40);
          coffeeCount+=40;
          commonhourCount+=40;
        }
      }

      for (int j=0;j<a_computer[i-1];j++)
      {
        if (computerHourCount < a_computer[i-1]*40)
        {
          image(computer, commonhourCount, yCount*40, 40, 40);
          computerHourCount+=40;
          commonhourCount+=40;
        }
      }

      for (int j=0;j<a_homework[i-1];j++)
      {
        if (homeworkCount < a_homework[i-1]*40)
        {
          image(home, commonhourCount, yCount*40, 40, 40);
          homeworkCount+=40;
          commonhourCount+=40;
        }
      }

      for (int j=0;j<a_food[i-1];j++)
      {
        if (foodCount < a_food[i-1]*40)
        {
          image(food, commonhourCount, yCount*40, 40, 40);
          foodCount+=40;
          commonhourCount+=40;
        }
      }

      for (int j=0;j<a_sleep[i-1];j++)
      {
        if (sleepHourCount < a_sleep[i-1]*40)
        {
          image(sleep, commonhourCount, yCount*40, 40, 40);
          sleepHourCount+=40;
          commonhourCount+=40;
        }
      }
    }
  }
}


