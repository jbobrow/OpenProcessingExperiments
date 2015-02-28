


int UserNum; 
int CurrentUser=0;
int CharLimit =70;

import beads.*;

AudioContext ac;
float UserFreq;

//User database01
String[] Names;
PVector[] Pos,Des;
int[] R,G,B;
int[] D;
String[]Message;


//User database02
boolean Composing;

//User chatting history


float[] Wl;
String[] s;


String TemMemKey= " ";
int CountKey, MessageCount;

//control variable
boolean Con;
int t,CNumForNames,CNumForMidPoint;
//PVector[] MidPoint;

float Scale;

void setup() {
  size(900,600);
  smooth();
  frameRate(20);

  PFont font = loadFont("AngsanaNew-Bold-24.vlw");
  textFont(font);
  fill(210);

  stroke(100);
  textAlign(CENTER);

  //load user data
  String lines[] = loadStrings ("database01.txt");
  // String lines02[] = loadStrings ("database02.txt");

  int Len = lines.length;
  UserNum = Len;

  Names = new String[UserNum];
  Pos = new PVector[UserNum];
  R = new int[UserNum];
  G = new int[UserNum];
  B = new int[UserNum];
  D = new int[UserNum];
  Message = new String[UserNum];
  MessageAdded = new boolean[UserNum];
  Des= new PVector[UserNum];

  Tones= new int[UserNum][CharLimit];
  PlayingTones = new int[CharLimit];

  Wl = new float[UserNum];
  s = new String[UserNum];

  for (int i=0; i<UserNum; i++) {
    String[] DataList = split (lines[i], ',');

    //int Len = DataList.length;
    Names[i]=DataList[0];
    Pos[i]= new PVector(float(DataList[1]),float(DataList[2]));
    Des[i]= new PVector(float(DataList[1]),float(DataList[2]));
    //may be problem 
    R[i] = int(DataList[3]);
    G[i] = int(DataList[4]);
    B[i] = int(DataList[5]);
    D[i] = int(DataList[6]);
    Message[i] = DataList[7];
    Wl[i] = textWidth(Names[i]);

    //music part
    ac = new AudioContext();
    Clock clock = new Clock(ac, 500);
    clock.addMessageListener(
    //this is the on-the-fly bead
    new Bead() {
      //this is the method that we override to make the Bead do something
      public void messageReceived(Bead message) {
        Clock c = (Clock)message;
        if(c.isBeat()) {
          WavePlayer wp = new WavePlayer(ac, (float)UserFreq + 100, Buffer.SINE);
          Gain g = new Gain(ac, 1, new Envelope(ac, 0.1));
          ((Envelope)g.getGainEnvelope()).addSegment(0, 1000, new KillTrigger(g));
          g.addInput(wp);
          ac.out.addInput(g);
        }
      }
    }
    );
    ac.out.addDependent(clock);
    ac.start();

  }

}

void draw() {
  //delay(500);
  //background(255);
  fill(255,40);
  rect(0,0, width,height);
  noStroke();
  for( int i =0; i<UserNum; i++) {
    fill(R[i],G[i],B[i],20);
    ellipse(Pos[i].x,Pos[i].y,D[i],D[i]);
  }

  textAlign(CENTER);
  for( int i =0; i<UserNum; i++) {
    fill(R[i],G[i],B[i],80);
    text( Names[i], Pos[i].x,Pos[i].y+8);
  }

  //////////////////////////////////////////////////////////////
  Move();
  Push();

  Compose();
  Mix();

  //  println (Message[CurrentUser]);
  println (PlayingMessage);
}


void Move() {
  stroke(0,30);
  noFill();
  line(Des[CurrentUser].x, Des[CurrentUser].y, Pos[CurrentUser].x,Pos[CurrentUser].y);
  ellipse(Des[CurrentUser].x, Des[CurrentUser].y, 6,6);

  for (int i = 0; i<UserNum; i++) {
    Pos[i].x +=(Des[i].x-Pos[i].x)/200;
    Pos[i].y +=(Des[i].y-Pos[i].y)/200;
  }
  //println(Des[CurrentUser].x+"   "+ Des[CurrentUser].y);
  //println(Pos[CurrentUser].x+"   "+ Pos[CurrentUser].y);
} 


void Push() {
  for (int i = 0; i<UserNum; i++) {
    for (int g = i+1; g<UserNum; g++) {
      if (Pos[i].dist(Pos[g])<100) {
        Pos[g].x -=(Pos[i].x-Pos[g].x)/600;
        Pos[g].y -=(Pos[i].y-Pos[g].y)/600;
        Pos[i].x +=(Pos[i].x-Pos[g].x)/600;
        Pos[i].y +=(Pos[i].y-Pos[g].y)/600; 

      }
    }
  }
}

void Compose() {
  if (Composing) {
    fill(255);
    stroke(100);
    rect(10,height-30, width-20,20);

    if (keyPressed) {
      //delay(30);
      if (key != BACKSPACE && CountKey <CharLimit) {
        TemMemKey +=key;
        CountKey++;
      }
      if (key == BACKSPACE && CountKey>1) {
        CountKey--;
        TemMemKey = TemMemKey.substring(0,CountKey-1);
      }
      println(CountKey);
    }
    fill(150); 
    textAlign(LEFT);
    text(TemMemKey, 15,height-15);

    if (Composing && keyPressed && (key ==ENTER ||key ==RETURN)) {
      Composing=false;
      Message[CurrentUser] =TemMemKey;
      TemMemKey = " ";
      CountKey=0;
    }
  }
}

int Counter,LettersLen;
char[] Letters;
String PlayingMessage= " ";
boolean[] MessageAdded;
int[][] Tones;
int[] PlayingTones;
float Tone;

void Mix() {

  for (int i = 0; i<UserNum; i++) {
    float DMix= Pos[i].dist(Pos[CurrentUser]);
    if (DMix<(D[i]+D[CurrentUser])/2) {
      if (!MessageAdded[i]) {
        MessageAdded[i] =true;
      } 
    }
      else {
        MessageAdded[i]=false;
      }
    }

  
for (int i =0; i<CharLimit; i++) {
  PlayingTones[i]=0;
}


  for (int i=0; i<UserNum; i++) {
    if  (MessageAdded[i]) {
      Letters = Message[i].toCharArray();
      int l =Letters.length;
      for (int g=0; g<CharLimit; g++) {
        if (g<l){ 
          Tones[i][g] = int(Letters[g]);
          if (int(Letters[g])==32) Tones[i][g] =0;
        } 
        else { 
          Tones[i][g] = 0;
        }
        if (PlayingTones[g]==0) {
          Tone = Tones[i][g];
        }else {
          Tone = round(PlayingTones[g]/5.0+Tones[i][g]/4.0);
      }
      if (Tone ==0) {
       PlayingTones[g] = 0;
      } else {
PlayingTones[g] = constrain(int(440*pow(2,(Tone-75.0)/12.0)),50, 8080);
       //PlayingTones[g] = int(Tone);
      }
    }
  }
  }

  Counter++;
  if (Counter==CharLimit*10) Counter=0;
  if (Counter%10==0) {
  UserFreq = PlayingTones[Counter/10];
  }
  println(UserFreq);
}

void mouseClicked() {
  float dx= mouseX-Pos[CurrentUser].x;
  float dy =mouseY-Pos[CurrentUser].y;
  if ((abs(dx) <(Wl[CurrentUser]/2))&& (abs(dy)<8)) {
    Composing = true;
  } 
  else {
    Des[CurrentUser].x = mouseX;
    Des[CurrentUser].y = mouseY;
  }
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) D[CurrentUser]++;  
    if (keyCode == LEFT) R[CurrentUser] ++;  
    if (keyCode == DOWN) G[CurrentUser] ++;
    if (keyCode == RIGHT) B[CurrentUser] ++;
    if (R[CurrentUser]>255) R[CurrentUser]=0;
    if (G[CurrentUser]>255) G[CurrentUser]=0;
    if (B[CurrentUser]>255) B[CurrentUser]=0;
    if (D[CurrentUser]>200) D[CurrentUser]=0;
  }
}



