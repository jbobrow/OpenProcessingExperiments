

Bubble [ ] bubbleArray;
final int MAX = 1000;
String [] flowData;
int [ ] flowNumbers;
float speed;

void setup() {

  size(500, 500);
  background(185, 201, 206);

  flowData = loadStrings("riverdata flowonly.txt");
  flowNumbers = new int [flowData.length];
  for (int i = 0; i < flowData.length; i++) {
    flowNumbers[i] = Integer.parseInt(flowData[i]);
  }

  bubbleArray = new Bubble [MAX];
  initializeBubbleArray();
}

void draw() {
  background(185, 201, 206);
  fill(100, 134, 112);
  rect(0, height/2, width, height);

  speed = flowNumbers[int(millis()/1000)%flowNumbers.length]/10000.0;

  for (int i = 0; i < bubbleArray.length; i++) {
    bubbleArray[i].speed = speed;
    bubbleArray[i].drawBubble();
  }
}

void initializeBubbleArray() {
  for (int i = 0; i < bubbleArray.length; i++) {
    bubbleArray[i] = new Bubble(int(random(0-width/2, width+width/2)), int(random(height/2, height)), int(random(4, 9)));
  }
}

void updateSpeed(int flowNumberIndex) {
  
}




class Bubble {
  
  float x;
  int y;
  float speed;
  int diam;
  
  Bubble(int tempx, int tempy, int tempdiam) {
    x = tempx;
    y = tempy;
    diam = tempdiam;
  }
  
  void drawBubble() {
    noStroke();
    fill(180, 198, 187, 10);
    x = x+speed;
    ellipse(x, y, diam, diam);
    
    if(x > width+width/2) {
      x = 0-width/2;
    }
  }
}


