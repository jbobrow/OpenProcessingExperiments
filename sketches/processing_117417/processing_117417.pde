
/*@pjs preload="earthfinal2.jpg", "monster.png", "monster2.png", "monster3.png";*/

PImage bg;

PImage [] monsterList = new PImage [5]; //declared and created array 

int sphereDiameter = 300;
boolean shoot = false;

int [] sphereXCoords = { 0, 0, 0, 0, 0 };

int[] sphereYCoords = { 0, 0, 0, 0, 0 };

void setup() {
  
  size(580, 580);
  //background(255);
  
  for (int i =0; i<sphereXCoords.length; i++) {
  int tempRandom = customRandom();
  sphereXCoords[i] = tempRandom;
  }
  
  bg=loadImage("earthfinal2.jpg");
  monsterList[0] = loadImage("monster.png");  //assigning iys value
  monsterList[1] = loadImage("monster3.png");
  monsterList[2] = loadImage("monster2.png");
  monsterList[3] = loadImage("monster3.png");
  monsterList[4] = loadImage("monster.png");
  
  //image (bg, 0, 0);
}

void draw()
{
  background(bg);
  fill(color(0, 255, 0));
  stroke(color(0, 255, 0));
  triangle(mouseX+10, 580, mouseX-10, 580, mouseX, 555);

  if (shoot==true)
  {
    monsterKiller(mouseX);
    shoot = false;
  }
  monsterDropper();
} 

void mousePressed() //means if you want to shoot, then mouse needs to be clicked,no shoot. 
{
  shoot = true;
}

void monsterDropper() //forlooop for falling monsters 
{  
  stroke(255);
  fill(255);
  for (int i=0; i<5; i++) //i is less than 5, so the test evaluates as true. At the end of each loop, i is incremented by one.
  {
    image(monsterList[i], sphereXCoords[i], sphereYCoords[i]++, 
    sphereDiameter, sphereDiameter); //(mosterlist[i] is the array of monsters falling, x coordinates, y coordinates+1)
  }
}

void monsterKiller(int shotX) //forloop for hitting creature
{
  boolean hit = false;
  for (int i = 0; i < 5; i++) //i is less than 5, so the test evaluates as true. At the end of each loop, i is incremented by one.
  {
    if ((shotX >= (sphereXCoords[i]-sphereDiameter/2)) && //assigning that the shot has to within the diameter of the monsters + any value of the x cordinates
      (shotX <= (sphereXCoords[i]+sphereDiameter/2)))
    {
      hit = true;
      line(mouseX, 565, mouseX, sphereYCoords[i]); //shooting line
      ellipse( sphereXCoords[i], sphereYCoords[i], sphereDiameter+25, sphereDiameter+25);//shooting diameter
      sphereXCoords[i] = customRandom();
      sphereYCoords[i] = 0;
    }
  }

  if (hit == false)
  {
    line(mouseX, 565, mouseX, 0);
  }
}

int customRandom()
{
  return int(random(600));
}


