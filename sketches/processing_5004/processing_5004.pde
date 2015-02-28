
/*
Butterflies
adalau85@gmail.com
October 5, 2009
*/
int butterflyNum = 50;
Butterfly [] bList = new Butterfly[butterflyNum];


void setup() {
  size(500,500);
  background(0);
  smooth();

  //create the balloons & insert them into the list
  for (int i=0; i<butterflyNum; i++) {
    Butterfly newButterfly = new Butterfly();
    bList[i] = newButterfly;
    //move to the center of the screen
    newButterfly.x = 250;
    newButterfly.y = 250;
  };
};

void draw() {
  background(0);
  for (int i=0; i<butterflyNum; i++) {
    bList[i].flow();
  };
};  





