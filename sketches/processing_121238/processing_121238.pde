
Stock stocks[] = new Stock[4];
Agent agents[] = new Agent[1];
int timer;

void setup() {
  frameRate(5);
  size(975, 500);
  // passed in parameters: position x, position y, --and the rest are the hard coded data, like: obesity in 1960, obesity in 1961, obesity in 1962....add more
  //Blizzard (values are inflated from their raw numbers to make up for the weird yen and dollor difference)
  stocks[0] = new Stock(300, 150, 0, 0, 255, 145.5, 133.3, 150, 127.3, 151.5, 187.9, 203.5, 229.5, 355.6, 229.6, 266.7, 286.6, 284.8, 259.3, 0);//
  //Nintento                                                             ^ WoW Release               ^ Burning Crusade release
 // stocks[1] = new Stock(1000, 600, 0, 0, 0, 169, 183, 171, 96, 86, 117, 131, 243, 596, 665, 226, 228, 125, 100, 1);
  //Sony  (values in all JP stocks are changed to keep the circles reasonably sized) ^ Nintendo Wii release
 // stocks[2] = new Stock(300, 600, 0, 255, 0, 4.9, 79, 670, 510, 436, 420, 480, 510, 400, 198, 258, 266, 170, 210, 2);
    //Capcom                                           ^ PS2 Release
  //stocks[3] = new Stock(1000, 150, 255, 0, 0, 372, 392, 246, 103, 138, 99, 138, 169, 340, 298, 176, 130, 181, 147, 3);
    timer = 0;  //                              ^ Golden Years                        ^ SFIV Release
  //bliz1
  agents[0] = new Agent(int(random(-10,0)), int(random(-10,0)), int(random(600)), int(random(350)));
}

void draw() {
  background(150);
  timer++;
  if (timer % 10 == 0) {
    //for (int i=0;i<stocks.length;i++) {
    //  stocks[i].changeAmount();
    //}
    stocks[0].changeAmount();
  }
 // for (int j=0;j<stocks.length;j++) {
  //  stocks[j].display();
  //}
  stocks[0].display();   
  agents[0].displayBliz1();

  //bliz1
}

// create agents with thresholds that that go when the value is small and then others only go when the value is large
// put the agents in a location that are stored in an array
// agents appear next to node and change color based on whether they are "active" or not
// each company has an array of agents
// Agents constantly chase a target (the company node) or they are chasing the corner of the screen
// "put sloppiness into the chase" to emulate swarming
// google "LERP" for chasing code
// All agents want to go to a different point
// Agents is a third tab; a second class
// Agents functions are defined in agents tab; called in stock tab
// use int(amount[currentIndex]) to test the agent's threshold

//NEW NOTES
//pass in 2 positions "swarm and not swarm" positions

class Agent {
  int threshold;  //the threshold for appearance 
  int startX;  //the corner point
  int startY; //the corner point
  float destX; //the company node
  float destY; //the company node
  int r = 0;
  int g = 0;
  int b = 0;
  float agentThreshold;

  Agent(int _startX, int _startY, int _destX, int _destY) {
    startX = _startX;
    startY = _startY;
    destX = _destX;
    destY = _destY;
  }
  void displayBliz1 () {
    for (int i = 0; i < 300; i+=1) {
      if (i < agentThreshold) { // agentThreshold
        destX = random(200,400);
        destY = random(150,250);
      }
      else {
        destX = random(-10, 0);
        destY = random(-10, 0);
      }
      fill(r, g, b);
      ellipse(destX, destY, 5, 5);
      if (agentThreshold > 300) {
        r = 255;
        g = 255;
        b = 255;
      } else {
        r = 0;
        g = 0;
        b = 0;
      }
    }
  }
  void changeAgentThreshold(float val) {
    agentThreshold = val;
    println(val);
  }

  void swarm () {
    r = 255;
    g = 255;
    b = 255;
  }
  void abandon () {
    r = 0;
    g = 0;
    b = 0;
  }
}


class Stock {
  int x;
  int y;
  int r;
  int g;
  int b;
  float amount[] = new float[14];
  int currentIndex = 0;
  int num;

  // x, y, ---and hard coded data.  You will have many more..
  Stock(int _x, int _y, int _r, int _g, int _b, float _0, float _1, float _2, float _3, float _4, float _5, float _6, float _7, float _8, float _9, float _10, float _11, float _12, float _13, int _num) {
    x = _x;
    y = _y;
    r = _r;
    g = _g;
    b = _b;
    amount[0] = _0;
    amount[1] = _1;
    amount[2] = _2;
    amount[3] = _3;
    amount[4] = _4;
    amount[5] = _5;
    amount[6] = _6;
    amount[7] = _7;
    amount[8] = _8;
    amount[9] = _9;
    amount[10] = _10;
    amount[11] = _11;
    amount[12] = _12;
    amount[13] = _13;
    num = _num;
  }
  void changeAmount() {
    currentIndex++;
    if (currentIndex >= amount.length) { // we've gone through all the index.  Start back at beginning
      currentIndex = 0;
      background(255, 0, 0); //flash red.  Just to let us know that we restarted
    }
    ///
    int threshold = 200;
    //println(amount[currentIndex] + " " +  threshold);

    agents[num].changeAgentThreshold(amount[currentIndex]/1.180);
   // println(amount[currentIndex]/1.180);
    // pass a percentage.  threhold divided by something.  amount[currentIndex] divided by the highest thereshold, like 355


  ///
}
void display() {
  fill(r, g, b);
  rectMode(CENTER);
  rect(x, y, 700, 450);
  // println(amount);
}
}


