
Stock stocks[] = new Stock[4];
Agent agents[] = new Agent[4];
int timer;
int year = 2000;
PFont f;    

void setup() {
  f = createFont("Arial", 16, true);
  frameRate(5);
  size(1274, 800);
  // Paramaters: x, y, red, blue, green, stock values..., num for agents
  //Blizzard (values are inflated from their raw numbers to make up for the weird yen and dollor difference)
  stocks[0] = new Stock(300, 150, 0, 0, 255, 145.5, 133.3, 150, 127.3, 151.5, 187.9, 203.5, 229.5, 355.6, 229.6, 266.7, 286.6, 284.8, 259.3, 0);//
  //Nintento                                                             ^ WoW Release               ^ Burning Crusade release
  stocks[1] = new Stock(1000, 600, 150, 0, 150, 169, 183, 171, 96, 86, 117, 131, 243, 596, 665, 226, 228, 125, 100, 1);
  //Sony  (values in all JP stocks are changed to keep the circles reasonably sized)   ^ Nintendo Wii release
  stocks[2] = new Stock(300, 600, 0, 255, 0, 4.9, 79, 670, 510, 436, 420, 480, 510, 400, 198, 258, 266, 170, 210, 2);
  //Capcom                                              ^ PS2 Release
  stocks[3] = new Stock(1000, 150, 255, 0, 0, 372, 392, 246, 103, 138, 99, 138, 169, 340, 298, 176, 130, 181, 147, 3);
  timer = 0;  //                               ^ Golden Years                         ^ SFIV Release
  //bliz1
  agents[0] = new Agent(0, 0);
  agents[1] = new Agent(637, 400);
  agents[2] = new Agent(0, 400);
  agents[3] = new Agent(637, 0);
}

void draw() {
  timer++;
  if (timer % 10 == 0) {
    year++;  //changes the year text with each tick.
    for (int i=0;i<stocks.length;i++) {
      stocks[i].changeAmount();  
    }
  }
  for (int j=0;j<stocks.length;j++) { //displays rectangle quadrants and circles inside them
    stocks[j].display();
    agents[j].display();
  }
    textFont(f, 40);                 
    fill(0);
    if(year == 2014) {  //if it goes past 2013, make it 2000.
      year = 2000;
    }    
    text(year, 605, 390);
}

class Agent {
  int threshold;  //the threshold for appearance
  int startX;  //top left corner of quadrant
  int startY; //top left corner of quadrant
  float destX = 0;
  float destY = 0;
  int r = 0;
  int g = 0;
  int b = 0;
  float agentThreshold;
 
  Agent(int _startX, int _startY) {
    startX = _startX;
    startY = _startY;
  }
  void display () {
    for (int i = 0; i < 1000; i+=1) {
      if (i < agentThreshold) {
        destX = startX + random(50,600);
        destY = startY + random(75,325);
      }
      else {
        destX = random(-10, 0);
        destY = random(-10, 0);
      }
      fill(r, g, b);
      ellipse(destX, destY, 10, 10);
    }
  }
  void changeAgentThreshold(float val) {
    agentThreshold = val;
    println(val);
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
  // x, y, colors, stock values
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
    if (currentIndex >= amount.length) { //We're at the end of 2013.  Go back to 2000.
      currentIndex = 0;
      background(255, 0, 0); //flash red on restart to 2000.
    }
    int threshold = 200;
    agents[num].changeAgentThreshold(amount[currentIndex]/2);
  }
  void display() {
    fill(r, g, b);
    rectMode(CENTER);
    rect(x, y, 700, 450);
  }
}



