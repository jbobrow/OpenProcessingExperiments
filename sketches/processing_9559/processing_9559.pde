
class Flower {
  int curPedCnt;
  float flowerX, flowerY;
  String words;
  float flowerHue;
  float flowerShade;
  float flowerBright;
  int flowerSize;
  float petalNum;
  
  Flower(float iX, float iY, String iString, int s, float pnum) {
    flowerX = iX;
    flowerY = iY;
    words = iString;
    flowerSize = s;
    petalNum = pnum;
    curPedCnt =0;
  }
  
  void setColor(float h,float s, float b) {
    flowerHue = h;
    flowerShade = s;
    flowerBright = b;
  }
  
  void draw() {
    for (int petalCount = 0; petalCount < curPedCnt; petalCount++) {
       fill(flowerHue,flowerShade,flowerBright,150); //color determined by certain letters (see flower function)
      ellipse(flowerX,flowerY,5*flowerSize,5*flowerSize);
      translate(flowerX,flowerY);
      // draw 5 petals, rotating after each one
      rotate(radians((360/(petalNum-.01))* petalCount));
      petal(0,-6*flowerSize,flowerSize);
      
      // draw text over each petal
      fill(39,100,362,200); //text blends in with background
      if (flowerSize >= 30) textFont(perpetua30);        //if the flower is bigger, make the text bigger
      else if (flowerSize >=17 && flowerSize < 30) textFont(perpetua20);
      else if (flowerSize >=10 && flowerSize < 17) textFont(perpetua16);
      else textFont(perpetua10);
      textAlign(CENTER);
      text(words, 0, -5.5*flowerSize, 7*flowerSize,8*flowerSize);
      
      rotate(radians((360/(petalNum-.01))* -petalCount));
      translate(-flowerX,-flowerY);
    }
    
    curPedCnt++;
    if(curPedCnt > petalNum) {
      curPedCnt = (int)petalNum;
    }
  }
  
}

