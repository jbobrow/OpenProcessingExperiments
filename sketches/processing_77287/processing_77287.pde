
public class Food {
  
  int x, y; 
  int distance;
  int checkTime, pCheckTime; // use to see if the time has been exceeded between phases

  //METHODs

  void initPosFood(int xposFood, int yposFood, int sizeFood) {
    x = (int)random(sizeFood, xposFood); 
    y = (int)random(sizeFood, yposFood);
  }

  void displayFood (int xposFood, int yposFood, int sizeFood) {

    checkTime+=stopwatch.isFinished();

    //    if (checkTime != pCheckTime)//this is called only if the time limit has been crossed (see TIMER CLASS)
    //    {
    //      //println("check"); // to check if the timer is working correct
    //
    //      x = (int)random(sizeFood, xposFood); // generating the position for the food to appear in the X axis
    //      y = (int)random(sizeFood, yposFood); //// generating the position for the food to appear in the Y axis
    //    }
    
    noStroke();
    fill(103, 205, 99);
    rectMode(CENTER);
    rect(x, y, sizeFood, sizeFood); // drawing the actual food
    fill(255);
    rect(x, y, sizeFood - 5, sizeFood - 5);//drawing the actual food

    pCheckTime = checkTime;
  }

  int intersection() {// int to check if intersection between food and snake is occuring based on distance calculation. 
    distance = (int)dist(headX, headY, x, y);
    if (distance < siz) {
      return 1;
    }
    else {
      return 0;
    }
  }
}


