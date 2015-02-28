
Human humans[] = new Human[3];
int timer;

void setup() {
  size(800, 600);
  // passed in parameters: position x, position y, --and the rest are the hard coded data, like: obesity in 1960, obesity in 1961, obesity in 1962....add more
  humans[0] = new Human(200, height/2, 0.5, 0.5, .5, 1, .5, .5, 1, 1, 1, 1, 1, 1, 1.7, 1.7, 1.7, 1.7); //california
  humans[1] = new Human(400, height/2, 0, 0, 1, .5, 1, 1, 1, 1, 1, 1.7, 1.7, 1.7, 1.7, 1.7, 2.3, 2.3); //texas
  humans[2] = new Human(600, height/2, 0.5, 0.5, .5, .5, .5, .5, 1, 1, 1, 1, 1, 1, 1.7, 1.7, 1.7, 1.7); //new york
  timer = 0;
}

void draw() {
  background(255);
  timer++;
  if (timer % 20 == 0) {
    for (int i=0;i<humans.length;i++) {
      humans[i].changeAmount();
    }
  }
  for (int j=0;j<humans.length;j++) {
    humans[j].display();
  }
}

class Human {
  int x;
  int y;
  float amount[] = new float[16];
  int currentIndex = 0;

  // x, y, ---and hard coded data.  You will have many more..
  Human(int _x, int _y, float _0, float _1, float _2, float _3, float _4, float _5, float _6, float _7, float _8, float _9, float _10, float _11,  float _12,  float _13,  float _14, float _15) {
    x = _x;
    y = _y;
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
    amount[14] = _14;
    amount[15] = _15;

}
  void changeAmount() {
    currentIndex++;
    if (currentIndex >= amount.length) { // we've gone through all the index.  Start back at beginning
      currentIndex = 0;
      background(255,0,0); //flash red.  Just to let us know that we restarted
    }
  }
  void display() {
    float tall = int(amount[currentIndex]* 40); // access the array.  What is the current value to present?  Also multiply it, to make it bigger
    color fillColor = color(30,30,255); // if it is positive, make it blue...
    
  if(x==200){fillColor = color(255, 30,30);} // if negative, make it red.
  if(x==400){fillColor = color(0, 30,255);}
  if(x==600){fillColor = color(0, 255,30);}
    
    fill(fillColor);
    noStroke();
    ellipse(x, y, tall, 50);
    ellipse(x, y-38, 25, 25);
  }
}


