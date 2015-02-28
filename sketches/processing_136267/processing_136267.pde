
void setup() {
  size (400, 400);
}
int time = 0;
int totalTime = 50;

int xPos = 200; // Person starting x pos.
int yPos = 232; // Person starting y pos.
Speaker speaker1 = new Speaker();
TV tv1 = new TV();

void draw() {
  background(255);
  drawWall();
  drawFloor();
  speaker1.drawSpeakers();
  tv1.drawTv();
  drawTvStand();
  drawPerson();
  drawCouch();
  drawTime();
}

void drawTime() {
  time++;
  if (time > totalTime) {
   tv1.changeChannel(); 
    time = 0; 
  }
}

void mouseClicked() {
  tv1.tvOnOff();
}

void keyPressed() {
}

void drawWall() {
  fill(139, 126, 103); // wall
  rect(0, 0, width, 187);
}

void drawFloor() {
  for (int i = 0; i < 10; i++) { //left floor
    line(200-20*i, 190, 200-(20+i)*i, 400);
  }
  for (int i = 1; i < 10; i++) { // right floor
    line(200+20*i, 190, 200+(20+i)*i, 400);
  }
}

void drawTvStand() {
  fill(134, 122, 83);
  rect(100, 130, 200, 70, 0); // tv stand
}

void drawPerson() {
  fill(255);
  ellipse(xPos, yPos, 45, 45);// person
}

void drawCouch() {
  fill(67, 55, 44);
  rect(80, 250, 240, 110);// couch
}

class Channel {
  int R; 
  int G;
  int B;
  
  Channel(int tempR, int tempG, int tempB) {
    R = tempR;
    G = tempG;
    B = tempB;
  }

  void setR(int inputR) {
    R = inputR;
  }
  void setG(int inputG) {
    G = inputG;
  }
  void setB(int inputB) {
    B = inputB;
  }
  void drawScreen() {
    fill(R, G, B); 
    rect(117, 37, 165, 75, 5); //screen
  }
}

class Speaker {
  void drawSpeakers() {
    fill(45);
    rect(20, 40, 60, 160, 5); //left speaker
    fill(216, 216, 216);
    ellipse(50, 80, 20, 20); // Tweeter
    ellipse(50, 145, 35, 35); //Woofer
    fill(20);
    ellipse(50, 145, 10, 10); // small woofer
    ellipse(50, 80, 5, 5); // small tweeter

    fill(45);
    rect(320, 40, 60, 160, 5); //right speaker
    fill(216, 216, 216);
    ellipse(350, 80, 20, 20); // tweeter
    ellipse(350, 145, 35, 35); //woofer
    fill(20);
    ellipse(350, 145, 10, 10); //small woofer
    ellipse(350, 80, 5, 5); // small tweeter
  }
}  

class TV {
  Channel[] listOfChannels = new Channel[10];
  int currentChannel = 0;

  TV() {
    createChannels();
  }



  void drawTv() {
    fill(30);
    rect(110, 30, 180, 90, 15); // tv
    listOfChannels[currentChannel].drawScreen();
  }

  void tvOnOff() { 
    if (currentChannel == 0) {
      currentChannel = 1;
    } 
    else {
      currentChannel = 0;
    }
  }
  void createChannels() {
    Channel off = new Channel(75, 75, 75);
    listOfChannels[0] = off;


    for (int i = 1; i < listOfChannels.length; i++) {
      Channel temp = new Channel((int)random(255), (int)random(255), (int)random(255));

      listOfChannels[i] = temp;
    }

  }

  void changeChannel() {
    if (currentChannel != 0) {
      currentChannel++;
      if(currentChannel == 10) {
        currentChannel = 1;
      }
    }
  }
}



