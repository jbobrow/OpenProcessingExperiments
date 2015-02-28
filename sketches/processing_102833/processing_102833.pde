
//init values
int cols, rows;
int margin = 10;
int initmargin = 50;
int videoScale = 20;
boolean doubles = false;
int[] slotx = new int[0];
int[] sloty = new int[0];
int waitspeed;
int column;
//IntList slotx = new IntList();
//IntList sloty = new IntList();

//Load music players
Maxim maxim;
AudioPlayer sound01;
AudioPlayer sound02;
AudioPlayer sound03;
AudioPlayer sound04;
AudioPlayer sound05;
AudioPlayer sound06;
AudioPlayer sound07;
AudioPlayer sound08;
AudioPlayer sound09;
AudioPlayer sound10;
AudioPlayer sound11;
AudioPlayer sound12;
AudioPlayer sound13;
AudioPlayer sound14;
AudioPlayer sound15;
int soundplayed = 0;

void setup() {
  maxim = new Maxim(this);
  //append(slotx, 0);
  //append(sloty, 0);
  //iPad portrait. Swap the numbers for landscape. 
  size(600, 600);
  rectMode(CENTER);
  colorMode(HSB);
  cols = width/videoScale;
  rows = height/videoScale;
  loadsound();
  waitmillis = millis();
  column = 0;
}

void loadsound() {
  sound01 = maxim.loadFile("sound01.wav");
  sound01.speed(0.5);
  sound01.volume(0.3);
  sound01.setLooping(false);
  sound02 = maxim.loadFile("sound02.wav");
  sound02.setLooping(false);
  sound03 = maxim.loadFile("sound03.wav");
  sound03.setLooping(false);
  sound04 = maxim.loadFile("sound04.wav");
  sound04.setLooping(false);
  sound05 = maxim.loadFile("sound05.wav");
  sound05.setLooping(false);
  sound06 = maxim.loadFile("sound06.wav");
  sound06.setLooping(false);
  sound07 = maxim.loadFile("sound07.wav");
  sound07.setLooping(false);
  sound08 = maxim.loadFile("sound08.wav");
  sound08.setLooping(false);
  sound09 = maxim.loadFile("sound09.wav");
  sound09.setLooping(false);
  sound10 = maxim.loadFile("sound10.wav");
  sound10.setLooping(false);
  sound11 = maxim.loadFile("sound11.wav");
  sound11.setLooping(false);
  sound12 = maxim.loadFile("sound12.wav");
  sound12.setLooping(false);
  sound13 = maxim.loadFile("sound13.wav");
  sound13.setLooping(false);
  sound14 = maxim.loadFile("sound14.wav");
  sound14.setLooping(false);
  sound15 = maxim.loadFile("sound15.wav");
  sound15.setLooping(false);
}


void draw() {
  background(0);
  slotDraw();

  //Draw header
  textSize(32);
  fill(0, 102, 153);
  text("8Bit Sound Matrix", 40, 30);
  
  //rect(535, 20, 100, 40);
  textSize(20);
  text("Clear screen", 485, 30);
  text("Testsong", 485, 70);
  //rect(x, y, videoScale, videoScale);
  
}

void slotDraw() {




  // Begin loop for columns
  for (int i = 0; i < 15; i++) {
    // Begin loop for rows
    for (int j = 0; j < 15; j++) {

      // Scaling up to draw a rectangle at (x,y)
      int x = (i*(videoScale+margin))+initmargin;
      int y = (j*(videoScale+margin))+initmargin;
      fill(0);
      stroke(255);
      // For every column and row, a rectangle is drawn at an (x,y) location scaled and sized by videoScale.
      rect(x, y, videoScale, videoScale);
    }
  }
  //Draw interacted rects
  for (int i = 0; i < slotx.length; i++) {
    // Begin loop for rows
    for (int j = 0; j < 15; j++) {
      if (slotx[i] == j) {
        Slotinteract(slotx[i], sloty[i]);
      }
    }
  }
  line(40+30*column, 40, 40+30*column, 480);
  if (millis() - waitmillis > 500) {
    waitmillis = millis();
    playmusic(column);




    column++;


    if (column == 15) {
      column = 0;
    }
  }

  //Show a timeline

  //timeline = millis()%8000;
  //float qq = (timeline*(440/7800))+40;


  //line(qq , 40, qq, 480);
}
void Slotinteract(int tempx, int tempy) {
  // Begin loop for columns

  // Scaling up to draw a rectangle at (x,y)
  int x = (tempx*(videoScale+margin))+initmargin;
  int y = (tempy*(videoScale+margin))+initmargin;
  fill(255);
  stroke(255);
  // For every column and row, a rectangle is drawn at an (x,y) location scaled and sized by videoScale.
  rect(x, y, videoScale, videoScale);
  //println("Activated slot: " + tempx + " , " + tempy);
}


void mousePressed() {

  if (mouseX > 480 && mouseY < 40) {
    slotx = new int[0];
    sloty = new int[0];
  }
  else if (mouseX > 480 && (mouseY > 40 && mouseY< 80)) {
    slotx.push(1);
    sloty.push(2);
    slotx.push(1);
    sloty.push(10);    
    slotx.push(2);
    sloty.push(11);
    slotx.push(3);
    sloty.push(12); 
    slotx.push(2);
    sloty.push(3);
    slotx.push(2);
    sloty.push(8);
    slotx.push(3);
    sloty.push(7);   
    slotx.push(4);
    sloty.push(2); 
    slotx.push(4);
    sloty.push(3);
    slotx.push(4);
    sloty.push(9);   
    slotx.push(5);
    sloty.push(7);
    slotx.push(5);
    sloty.push(10);
    slotx.push(6);
    sloty.push(0);
    slotx.push(6);
    sloty.push(6); 
    slotx.push(6);
    sloty.push(11);
    slotx.push(8);
    sloty.push(5); 
    slotx.push(8);
    sloty.push(10);
    slotx.push(9);
    sloty.push(6); 
    slotx.push(9);
    sloty.push(11);
    slotx.push(10);
    sloty.push(3);  
    slotx.push(11);
    sloty.push(2);
    slotx.push(12);
    sloty.push(1); 
    slotx.push(11);
    sloty.push(8);
    slotx.push(12);
    sloty.push(9); 
    slotx.push(13);
    sloty.push(10);
    slotx.push(14);
    sloty.push(11); 
    slotx.push(10);
    sloty.push(7);
    slotx.push(10);
    sloty.push(12); 
  }


  int yy = retriveCube(mouseY);
  int xx = retriveCube(mouseX);
  if ((xx != undefined)&&(yy != undefined)) {
    for (int i = 0; i < slotx.length; i++) {
      if ((slotx[i] == xx)&&(sloty[i] == yy)) {
        doubles = true;
        slotx.splice(i, 1);
        sloty.splice(i, 1);
        break;
      }
    }
    if (doubles == false) {
      append(slotx, xx);
      append(sloty, yy);
      playmusic();
    }
    else {
      doubles = false;
      removecube(xx, yy);
    }
  }
  //Slotinteract(xx, yy);
}

int retriveCube(int tempcord) {
  if (tempcord > 40 && tempcord < 480) {
    int cord = tempcord;
    float cordfloat = ((cord-initmargin)/(videoScale+margin))+0.7/2;
    int cordint = (int)(cordfloat+0.3); 
    if ((int)cordfloat==cordint) {
      return cordint;
    }
  }
}




void playmusic(int c) {

  int colum = c; 

  for (int i = 0; i < slotx.length; i++) {
    if (slotx[i] == colum) {
      int number = sloty[i];
      if (number == 0) {
        sound01.stop();
        sound01.cue(0);
        sound01.play();
      }
      else if (number == 1) {
        sound02.stop();
        sound02.cue(0);
        sound02.play();
      }
      else if (number == 2) {
        sound03.stop();
        sound03.cue(0);
        sound03.play();
      }
      else if (number == 3) {
        sound04.stop();
        sound04.cue(0);
        sound04.play();
      }
      else if (number == 4) {
        sound05.stop();
        sound05.cue(0);
        sound05.play();
      }
      else if (number == 5) {
        sound06.stop();
        sound06.cue(0);
        sound06.play();
      }
      else if (number == 6) {
        sound07.stop();
        sound07.cue(0);
        sound07.play();
      }
      else if (number == 7) {
        sound08.stop();
        sound08.cue(0);
        sound08.play();
      }
      else if (number == 8) {
        sound09.stop();
        sound09.cue(0);
        sound09.play();
      }
      else if (number == 9) {
        sound10.stop();
        sound10.cue(0);
        sound10.play();
      }
      else if (number == 10) {
        sound11.stop();
        sound11.cue(0);
        sound11.play();
      }
      else if (number == 11) {
        sound12.stop();
        sound12.cue(0);
        sound12.play();
      }
      else if (number == 12) {
        sound13.stop();
        sound13.cue(0);
        sound13.play();
      }
      else if (number == 13) {
        sound14.stop();
        sound14.cue(0);
        sound14.play();
      }
      else if (number == 14) {
        sound15.stop();
        sound15.cue(0);
        sound15.play();
      }
    }
  }
}



