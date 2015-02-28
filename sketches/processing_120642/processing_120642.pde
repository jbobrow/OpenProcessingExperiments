
Stock stocks[] = new Stock[4];
int timer;

void setup() {
  size(1275, 800);
  // passed in parameters: position x, position y, --and the rest are the hard coded data, like: obesity in 1960, obesity in 1961, obesity in 1962....add more
  //Blizzard (values are inflated from their raw numbers to make up for the weird yen and dollor difference)
  stocks[0] = new Stock(300, 150, 0, 0, 255, 145.5, 133.3, 150, 127.3, 151.5, 187.9, 203.5, 229.5, 355.6, 229.6, 266.7, 286.6, 284.8, 259.3);
  //Nintento                                                             ^ WoW Release               ^ Burning Crusade release
  stocks[1] = new Stock(1000, 600, 0, 0, 0, 169, 183, 171, 96, 86, 117, 131, 243, 596, 665, 226, 228, 125, 100);
  //Sony  (values in all JP stocks are changed to keep the circles reasonably sized) ^ Nintendo Wii release
  stocks[2] = new Stock(300, 600, 0, 255, 0, 4.9, 79, 670, 510, 436, 420, 480, 510, 400, 198, 258, 266, 170, 210);
    //Capcom                                           ^ PS2 Release
  stocks[3] = new Stock(1000, 150, 255, 0, 0, 372, 392, 246, 103, 138, 99, 138, 169, 340, 298, 176, 130, 181, 147);
    timer = 0;  //                              ^ Golden Years                        ^ SFIV Release
}

void draw() {
  background(255);
  timer++;
  if (timer % 75 == 0) {
    for (int i=0;i<stocks.length;i++) {
      stocks[i].changeAmount();
    }
  }
  for (int j=0;j<stocks.length;j++) {
    stocks[j].display();
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

  // x, y, ---and hard coded data.  You will have many more..
  Stock(int _x, int _y, int _r, int _g, int _b, float _0, float _1, float _2, float _3, float _4, float _5, float _6, float _7, float _8, float _9, float _10, float _11, float _12, float _13) {
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
  }
  void changeAmount() {
    currentIndex++;
    if (currentIndex >= amount.length) { // we've gone through all the index.  Start back at beginning
      currentIndex = 0;
      background(255, 0, 0); //flash red.  Just to let us know that we restarted
    }
  }
  void display() {
    fill(r, g, b);
    ellipse(x, y, int(amount[currentIndex]), int(amount[currentIndex]));
  }
}



