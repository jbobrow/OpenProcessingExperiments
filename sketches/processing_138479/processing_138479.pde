
int xPos = 200; // Person starting x pos.
int yPos = 232; // Person starting y pos.
Speaker speaker1 = new Speaker();
TV tv1;

PFont f;


void setup(){
  size (400,400);
  tv1 = new TV();
  f = loadFont("Numbers.vlw");
}

void draw(){
  background(255);
  drawWall();
  drawFloor();
  speaker1.drawSpeakers();
  tv1.drawTv();
  drawTvStand();
  drawPerson();
  drawCouch();
  
}

void mouseClicked(){
  tv1.tvOnOff();
}

void keyPressed(){
  tv1.changeChannel();
}

void drawWall(){
  fill(139, 126, 103); // wall
  rect(0, 0, width, 187);
  }
  
void drawFloor(){
  for(int i = 0; i < 10; i++) { //left floor
    line(200-20*i, 190, 200-(20+i)*i, 400);
  }
  for(int i = 1; i < 10; i++) { // right floor
    line(200+20*i, 190, 200+(20+i)*i, 400);
  } 
}

void drawTvStand(){
  fill(134, 122, 83);
  rect(100, 130, 200, 70, 0); // tv stand
}

void drawPerson(){
  fill(255);
  ellipse(xPos, yPos, 45, 45);// person  
}

void drawCouch(){
  fill(67, 55,44);
  rect(80, 250, 240, 110);// couch 
}
class Channel {
  int R; 
  int G;
  int B;
  
  PImage img;
  
  int num;
  
  //PFont f;
  
  Channel(int tempR, int tempG, int tempB, int number) {
    R = tempR;
    G = tempG;
    B = tempB;
    num = number;
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
    //fill(R, G, B);
    rect(117, 37, 165, 75, 5); //screen
    image(img, 117, 37);
    if (num != 0){
    fill (75);
    rect (120, 40, 15, 15);
    fill (252);
    text (num, 124, 52);
    }
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
  Channel[] listOfChannels = new Channel[6];
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
    Channel off = new Channel(75, 75, 75, 0);
    listOfChannels[0] = off;
    listOfChannels[0].img = loadImage("Channel0.jpg");


    for (int i = 1; i < listOfChannels.length; i++) {
      Channel temp = new Channel((int)random(255), (int)random(255), (int)random(255), i);
      temp.img = loadImage("Channel" + i + ".jpg");
      listOfChannels[i] = temp;
    }

  }

  void changeChannel() {
    if (currentChannel != 0) {
      if (key == CODED) {
        if (keyCode == LEFT) {
          if (currentChannel > 1)
            currentChannel--;
        }
        if (keyCode == RIGHT) {
          if (currentChannel < 5)
            currentChannel++;
        }
      }
    }
  }
}



