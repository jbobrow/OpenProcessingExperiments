
// Shannon Kraemer
// CTIN 101 - Fall 2014
// Time Assignment
// skraemer@usc.edu

// This program simulates the growth of a flower
// over time. Water drops gather every second and
// spill out every minute. The flower grows as a
// result.
  
  // FOR DROPS TIMER //
  int startingTime;
  int interval = 1000;
  int time = 0;
  int counter = 0;      // keeps track of seconds passed
  
  // FOR FILLCUP AND DROP // 
  color c = color(50,100,150);
  int h = -20;
  
  // FOR DROP //
  float r = 8;        // for styling
  float x = 150;      // ^^^
  float y = -r;       // ^^^
  float speed = 9;
  
  // FOR FLOWER //
  float stemHeight = -30;
  int flowerStartingTime;
  int flowerInterval = 60;
  int flowerTime = 0;
  int flowerCounter = 0;
  int state = 0;

void setup()
{
 size(800,600); 
 startingTime = millis();
 flowerStartingTime = second();
}

// Function: cup()
// Purpose: draws cup figure on screen
void cup()
{
 stroke(2);
 noFill();
 rect(100, 200, 100, 375);
}

// Function: flower()
// Purpose: draws flower figure on screen,
  // keeps track of seconds and minutes passed
void flower()
{
  if(second() < flowerStartingTime + flowerInterval)
 {
  flowerTime++;
  flowerStartingTime = second();
  
  if (flowerCounter < 60)
  {
   fill(15,122,24);
   noStroke();
   rect(575,575,30,stemHeight);  
  } else if (flowerCounter == 60)    // if a minute has passed
    { 
     flowerTime = 0;
     stemHeight -= 6.25;
     flowerCounter++;
     println(flowerCounter);
    }
 }
}

// Function: fillCup()
// Purpose: draws gathered water on screen
void fillCup()
{ 
  noStroke();
  fill(c);
  rect(100,575,100,h);
}

// Function: overflow()
// Purpose: draws animation of water tipping over,
  // resets water and changes state of flower
void overflow()
{
  if(millis() < startingTime + interval)
 {
  time++;
  startingTime = millis();
  
  if (time < 300)
  {
    background(237,223,185);
    stroke(2);
    noFill();
    rect(100, 475, 375, 100);
    
    fill(c);
    noStroke();
    rect(100,550,800,30);
    
    fill(15,122,24);
    noStroke();
    rect(575,575,30,stemHeight);
    stemHeight -= 0.3;              // flower grows by 0.3
    
  } else 
    {
     h = -20;            // reset water height, start over
     state++;            // increment state
    }
 }
}

// Function: stateMachine()
// Purpose: provides special developments in flower's
  //growth (leaves)
void stateMachine()
{
  if(state >= 1)
  {
   fill(15,122,24);
   noStroke();
   ellipse(570,550,20,20);
  }
  if (state >= 2)
  {
   ellipse(610,500,20,20); 
  }
  if (state >= 3)
  {
   ellipse(570,450,20,20);
  }
  if (state >= 4)
  {
   ellipse(610,400,20,20);
  }
  if(state >= 5)
  {
   ellipse(570,350,20,20);
  }
}

// Function: drop()
// Purpose: draws drops to screen, times them to fall
  // exactly every second
void drop()
{
  if(millis() < startingTime + interval)
 {
  time++;
  startingTime = millis();
  
  if (time < 60)
  {
      fill(c);
      noStroke();
      for (int i = 2; i < r; i++ )      // for styling
      {
        ellipse(x,y + i*4,i*2,i*2);    // ^^^
      }
      y += speed;
  } else 
    {
     y = -r;             // starts off-screen
     time = 0;
     counter++;
     h -= 6.25;
     //println(counter);
    }
 }
}

void draw()
{
  background(237,223,185);
  if(h >= -375)                  // as long as water height
  {                                // is still in the container
    drop();
    cup();
    fillCup();
    flower();
    stateMachine();
  } else {                      // otherwise, trigger overflow.
      overflow();
    }
}


