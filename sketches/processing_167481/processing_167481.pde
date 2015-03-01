
Bubble[] allBubbles;
Button[] allButtons;
int[] margins = {
  20, 100, 80, 120, 5
};  
int[] bbHues= {
  70, 110, 205, 225, 20, 30
};
int[] btHues= {
  95, 215, 25
};

float timer, interval;

void setup () {
  size(1000, 600);
  interval = 1000;
  timer = interval;
  colorMode(HSB);
  //buttons
  String[] originalData=loadStrings("three_buttons_with_commentary_2.txt");
  allButtons=new Button[originalData.length];
  for (int i=0; i<allButtons.length; i++) {
    String[]columns=split(originalData[i], '\t');
    allButtons[i]=new Button(columns[0], columns[1], columns[2], i);
  }

  //bubbles
  originalData=loadStrings("Assessment Data_Averages_9.txt");
  allBubbles=new Bubble[originalData.length];

  float[] preAverage=new float[originalData.length];
  float[] postAverage=new float[originalData.length];

  for (int r=0; r<originalData.length; r++) {
    String[]columns=split(originalData[r], '\t');
    allBubbles[r]=new Bubble(columns[0], parseFloat(columns[1]), parseFloat(columns[2]), columns[3], columns[4]);
    preAverage[r]=parseFloat(columns[1]);
    postAverage[r]=parseFloat(columns[2]);
  }

  //set positions
  for (int i=0; i<allBubbles.length; i++) {
    allBubbles[i].setPosition(i);
  }

  //set color
  for (int i=0; i<allBubbles.length; i++) {
    //    println(i%6);
    allBubbles[i].setColor(i%6);
  }

  for (int i=0; i<allButtons.length; i++) {
    allButtons[i].setColor(i);
  }

  allButtons[0].isOn=true;
  for (int i=0; i<allBubbles.length; i++) {
    if (allButtons[0].label.equals(allBubbles[i].audience)) {
      allBubbles[i].isOn=!allBubbles[i].isOn;
    }
  }
}

void draw () {
  background(255);
  fill(0);
  textAlign(CENTER, TOP);
  textSize(14);
  text("Assessment Scores Pre- and Post-Program", width/2, 5);

  for (int i=0; i<allBubbles.length; i++) {
    allBubbles[i].display(i);
  }
  for (int i=0; i<allButtons.length; i++) {
    allButtons[i].display();
  }
}

void mouseMoved() {
  for (int i=0; i<allButtons.length; i++) {
    allButtons[i].checkMouse();
  }
}

void mouseReleased() {
  for (int i=0; i<allButtons.length; i++) {
    allButtons[i].switchBt();
    timer = millis() + interval;
  }
}

class Bubble {
  float x1, x2, y, diameter;
  float preAverage, postAverage;
  int bbHue;
  String topic, category, audience;
  boolean isOn;
  int duration = 3000;

  Bubble(String _topic, float _preAverage, float _postAverage, String _category, String _audience) {
    topic = _topic;
    preAverage = _preAverage;
    postAverage = _postAverage;
    category= _category;
    audience=_audience;
    diameter = 20;
    isOn=false;
  }
  void setColor(int _i) {
    bbHue=bbHues[_i];
  }

  void setPosition(int _i) {
    x1 = map(preAverage, 6, 9, 250, width - margins[3]);
    x2 = map(postAverage, 6, 9, 300, width - margins[3]-40);
    y = map(_i, 0, allBubbles.length, margins[0]*2, height-margins[0]);
  }

  void display(int _i) {
    //topics
    fill(0);
    textSize(12);
    textAlign(LEFT, CENTER);
    if (_i%6==3) {
      text(topic, 10, y-diameter/2);
    }
    if (_i%6==0&&_i>0) {
      stroke(200);
      strokeWeight(1);
      line(10, y-diameter/2-2, 780, y-diameter/2-2);
    }
    if (isOn) {

      float _x1 = x1;
      float _x2 = x2;
      if (timer > millis()) {
        _x1 = map(timer - millis(), interval, 0, (_x1 + _x2)/2, _x1);
        _x2 = map(timer - millis(), interval, 0, (_x1 + _x2)/2, _x2);
      }   


      //line
      stroke(220);
      strokeWeight(diameter);
      line(_x1, y, _x2, y);
      //dots
      fill(bbHue, 255, 255);
      noStroke();
      ellipse(_x1, y, diameter, diameter);
      ellipse(_x2, y, diameter, diameter);
      //dot text
      textSize(9);
      fill(0);
      textAlign(CENTER, CENTER);
      text(nf(preAverage, 0, 1), _x1, y);
      text(nf(postAverage, 0, 1), _x2, y);
      //bar text
      fill(0);
      textSize(10);
      text(category, ((_x2-_x1)/2)+_x1, y);
    }
  }
}

class Button {
  int btX, btY, btWidth, btHeight, btHue, btSaturation, btBrightness, btText, btNumber;
  int commentsX, commentsY, commentsWidth, commentsHeight;
  String label, commentaryOne, commentaryTwo;
  boolean isMouseOver, isOn;

  Button(String _label, String _commentaryOne, String _commentaryTwo, int _i) {
    btWidth=70;
    btHeight=20;
    btX=width-margins[1];
    btY=margins[0]+_i*(btHeight+margins[4]);
    label=_label;
    commentaryOne=_commentaryOne;
    commentaryTwo=_commentaryTwo;
    commentsX=810;
    commentsY=200;
    commentsWidth=150;
    commentsHeight=115;
    isMouseOver=false;
    isOn=false;
    btNumber=_i;
  }
  void checkMouse() {
    if (mouseX >= btX && mouseX <= btX + btWidth &&
      mouseY >= btY && mouseY <= btY + btHeight) {
      isMouseOver = true;
    } else {
      isMouseOver = false;
    }
  }

  void switchBt() {

    if (isMouseOver) {
      for (int i=0; i<allButtons.length; i++) {
        allButtons[i].isOn = false;
      }  
      isOn=!isOn;

      for (int i=0; i<allBubbles.length; i++) {
        allBubbles[i].isOn = false;
      }  
      for (int i=0; i<allBubbles.length; i++) {
        if (label.equals(allBubbles[i].audience)) {
          allBubbles[i].isOn=!allBubbles[i].isOn;
        }
      }
    }
  }

  void setColor(int _i) {
    btHue=btHues[_i];
  }

  void display() {
    if (isMouseOver) {
      btBrightness = 255;
    } else {
      btBrightness = 200;
    }
    if (isOn) {
      btSaturation=255;
      btText=0;
      fill(0);
      textSize(14);
      textAlign(CENTER);
      text("Comments", commentsX+parseFloat(commentsWidth)/2, commentsY-margins[0]);
      textSize(12);
      textAlign(LEFT, TOP);
      text(commentaryOne, commentsX, commentsY, commentsWidth, commentsHeight);
      text(commentaryTwo, commentsX, commentsY+commentsHeight+margins[0], commentsWidth, commentsHeight);
    } else {
      btSaturation=50;
      btText=255;
    }

    noStroke();
    fill(btHue, btSaturation, btBrightness);
    rect(btX, btY, btWidth, btHeight, 10);
    fill(btText);
    textSize(12);
    textAlign(CENTER, CENTER);
    text(label, btX, btY, btWidth, btHeight);
  }
}



