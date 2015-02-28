
//set global list of rows to simulate varying strip lengths
int[] rowList = {10, 10, 8, 12, 8, 13, 10, 10, 11, 12 , 7, 10, 10, 10};

ArrayList<Boxel> boxels;
Effects effect = new Effects();
int frameIndex;

void setup() {
  size(400, 600);
  background(255);
  //noStroke();
  boxels = new ArrayList<Boxel>();
  for (int i = 0; i < rowList.length; i++) {
    for (int j = 0; j < rowList[i]; j++) {
      Boxel newBoxel = new Boxel(j, i);
      boxels.add(newBoxel);
    }
  //frameRate(1);
  }
}

void draw() {
  frameIndex = ((frameCount -1 ) % boxels.size());
  effect.doEffect(frameIndex % boxels.size());
  for (int i = 0; i < boxels.size(); i++) {
    Boxel b = boxels.get(i);
    render(b);
  }
}

void render(Boxel b) {
  fill(b.currentC);
  float ysize = height/rowList.length;
  float xsize = width/rowList[b.ypos];
  rect((xsize * b.xpos), (ysize * b.ypos), xsize, ysize);
}

class Boxel {
  color currentC;
  color lastC;
  int xpos;
  int ypos;

  Boxel(int tempXpos, int tempYpos) {
    currentC = color(0,0,0);
    lastC = color(0,0,0);
    xpos = tempXpos;
    ypos = tempYpos;
  }

  void setC(color newC) {
    lastC = currentC;
    currentC = newC;
  }
}

class Effects{
  //Effects class
  int curEffect; //index of currently running effect
  int lastEffect; //index of previous effect
  int bIndex;
  color currentC;
  color lastC;
  color newC;
  Boxel b;
  
  //Effects(color tempLastC, color tempCurrentC) {
  Effects() {
    curEffect = 0;
    lastEffect = 0;
    //bIndex = 0;
    lastC = color(0,0,0);
    currentC = color(0,0,0);
    newC = color(0,0,0);
  }

  void effectsChooser() {
    //maps number keys to individual effects
    //logic... checks for keypress; lastEffect = curEffect; curEffect = new keypress;
    curEffect = 0;
  }

  void doEffect(int tempbIndex) {
    bIndex = tempbIndex;
    effectsChooser();
    b = boxels.get(bIndex);
    currentC = b.currentC;
    lastC = b.lastC;
    switch(curEffect) {
      case 0:
        effect0();
        break;
      case 1:
        effect1();
        break;
    }
    if (color(newC) != color(currentC)) {
      b.setC(newC);
    }
  }

  void effect0() {
    if ((frameIndex % boxels.size()) == bIndex) {
      
      //if ((red(currentC) + 20) <= 255) {
      for (int i = 0; i < 10; i++) {
        Boxel tempB = boxels.get((bIndex + i) % boxels.size());
        color tempC = tempB.currentC;
        color newTempC = color(((red(tempC) + 20) % 255), green(tempC), blue(tempC));
        tempB.setC(newTempC);
      }
      newC = color((red((currentC) + 20) % 255), green(lastC), blue(lastC));
      //} else {
      //  newC = color(red(0), green(lastC), blue(lastC));
      //}
    }
  }

  void effect1() {
    //asdfaedfa
  }
}

