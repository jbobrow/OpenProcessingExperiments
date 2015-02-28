
//Murtaza Tunio
//4/11/2012
//Patched up and commented: 9/2/2012
//Monty Hall Problem
//A simulated statistical analysis
//
//
//I was watching the show Numb3rs the other day and the Monty Hall Problem Came up. 
//I researched a little and found that I could try out the problem experimentally
//with a nearly infinite sample size.
//
//Wikipedia: 
//" Suppose you're on a game show, and you're given the choice of three doors:
//Behind one door is a car; behind the others, goats. You pick a door, say No. 1 
//[but the door is not opened], and the host, who knows what's behind the doors, 
//opens another door, say No. 3, which has a goat. He then says to you, "Do you
//want to pick door No. 2?" Is it to your advantage to switch your choice?"
//
//Using the following code I am attempting to demonstrate the increase in 'success rate'
//achieved by switching the choice of door, after one door is taken out of the equation
//by the game show host.
//
//Hypothesis:
//Before the choice is switched a 33% success rate is expected, once a door is removed and 
//the choice is switched I expect the rate to increase above 33.33%.
//
//Conclusion:
//Ones chances would actually improve twofold if one switched the choice of door after one 
//was removed out of the equation.
//
//Closing Note: I actually worked this out on paper, calculating probability of success with
//either choice and found the solution of 2/3 success rate slightly intangible. I then wanted
//to repeats the experiment with random choices and then manually calculating the success rates.
//I then decided to use Processing to run the experiment instead because I could never reach the 
//sample size that a computer could.

int host;
int choice;
int reChoice;
int DoorRemove;
int Removed; 

float iterations = 1; 
float correctA = 0;
float correctB = 0;

void setup() {
  frameRate(9001); // OVER 9000!
  size(150, 150);
}

void draw() {
  //calling all functions calling all functions
  background(200);

  ChooseCarDoor();
  Contestant();

  Stats(choice,0, "Keep ");
  Stats(0,reChoice, "Switch ");

  iterations++;
}



void ChooseCarDoor() {
  host = int(random(1, 4));
}


void Contestant() {
  choice = int(random(1, 4));
  Removed = removeDoor(choice, host);
  reChoice = 6 - choice - Removed;
}

int removeDoor(int DoorChosen, int DoorCar) {

  if (DoorChosen != DoorCar) {
    DoorRemove = 6 -DoorChosen -DoorCar;
  }
  else if (DoorChosen == 1) {
    DoorRemove = int(random(2, 4));
  }
  else if (DoorChosen == 2) {
    if (int(random(1, 3))==1) {
      DoorRemove = 1;
    }
    else {
      DoorRemove = 3;
    }
  }
  else if (DoorChosen == 3) {
    DoorRemove =  int(random(1, 3));
  }

  return DoorRemove;
}



void Stats(int StatsInA, int StatsInB, String strategy) {

  if (StatsInA==host) {
    correctA++;
  }
  if (StatsInB==host) {
    correctB++;
  }



  float rateA = (correctA/iterations)*100;
  float rateB = (correctB/iterations)*100;

  fill(0);
  text("Iterations: " + iterations, 5, 15);
  text("Code Speed: " + millis()/iterations, 5, 30); //In milliseconds per loop
  
  if(StatsInB == 0){
  text(strategy + "Rate: " + rateA + "%", 5, 45);
  }else{
  text(strategy + "Rate: " + rateB + "%", 5, 60);
  }
}



