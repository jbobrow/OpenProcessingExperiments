
//////////////////////////////////////////////
/////25 Squares by Vera Molna Simulation /////
/////by Quintus //////////////////////////////
//////////////////////////////////////////////

int num = 5; // number of rows/cols
void setup() {
  size(600, 600);
  background(203, 224, 229);
  rectMode(CORNER);
  noStroke();
  randomSeed(hour() + minute() + second() + millis());
  frameRate(1);
}

int decideColor(int percent)
{
  if (percent >= random(1, 101))
  {
    return 1; //red
  }
  return 2; //brown
}

int decideIntersect(int percent)
{
  if( percent >= random(1, 101))
  {
    return 1; //shift the box
  }
  return 2; //don't shift the box
}

void draw()
{
  //16% chance of there being a red box
  //there will only be four red boxes
  //24% chance of there being an intersection between boxes
  
  background(203, 224, 229);

  int gap = (int) random(5, 10);
  float cellsize = (width - (num+1)*gap) / (float)num;
  for (int i=0;i<num;i++) //Column
  {
    for (int j=0; j<num; j++) //Row
    {
      int colorDecide = decideColor(16); //16% chance for red box
      int intersectDecide = decideIntersect(24); //24% chance for box to shift
      float interDegX = random(10,19);
      float interDegY = random(10,19);
      
      switch(colorDecide)
      {

      case 1:
        fill(120, 20, 56, 250); //Red
        println("("+i+","+j+")"+" is red.");
        break;

      case 2:
        fill(72, 44, 31, 250); //Brown
        println("("+i+","+j+")"+" is brown.");
        break;
      }
      if(intersectDecide == 1){
      rect(gap * (i+1) + cellsize * i, gap * (j+1) + cellsize * j, cellsize, cellsize);
      println("Box was shifted!");
      }else{
      rect(gap * (i+1) + cellsize * i +interDegX, gap * (j+1) + cellsize * j +interDegY, cellsize, cellsize);
      println("Box wasn't shifted.");  
    }
    }
  }
}



