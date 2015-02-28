
int rando;
PImage[] img = new PImage[52];
int frame=0;
int card=0;
int loc[][] = new int[52][2];
boolean reseting;
void setup() {
  size(800, 800);
  frameRate(30);
  String suit = "";
  for (int i = 0; i < 4; i++) {
    switch (i) {
    case 0:
      suit="spades";
      break;
    case 1:
      suit="diamonds";
      break;
    case 2:
      suit="clubs";
      break;
    case 3:
      suit="hearts";
      break;
    }
    img[i*13] =loadImage("ace_of_"+suit+".png");
    for (int j = 2; j< 11; j++) {
      img[i*13+j-1] = loadImage(j+"_of_"+suit+".png");
    }
    img[i*13+10] =loadImage("jack_of_"+suit+"2.png");
    img[i*13+11] =loadImage("queen_of_"+suit+"2.png");
    img[i*13+12] =loadImage("king_of_"+suit+"2.png");
  }
  for (int i = 0; i<52; i++) {
    if (i<26) {
      loc[i][0]=225;
      loc[i][1]=26*26-i*26;
    }
    else {
      loc[i][0]=500;
      loc[i][1]=26*26*2-13-i*26;
    }
  }
}
void draw() {
  background(7, 99, 36);
  for (int i = 51; i>=26; i--) {
    image(img[i], loc[i][0], loc[i][1], 125/2, 182/2);
    image(img[i-26], loc[i-26][0], loc[i-26][1], 125/2, 182/2);
  }
  if (card==26&&frame==3&&!reseting) {
    frame=0;
    reseting=true;
    rando=(int)(Math.random()+.5);
    println(rando);
  }
  else if (frame==30) {
    changeNums();
  }
  else if (reseting) {
    reset();
  }
  else {
    move();
  }
}
void move() {
  int offset=0;
  //  if (card/2==card/2.) {
  //    offset=26;
  //  }
  //  else {
  //    card--;
  //  }
  if (frame<=2) {
    loc[card+offset][0]=loc[card+offset][0]+(400-loc[card+offset][0])/(3-frame);
    frame++;
  }
  else if (frame<=5) {
    offset=26;
    loc[card+offset][0]=loc[card+offset][0]+(400-loc[card+offset][0])/(6-frame);
    frame++;
  }
  if (frame==6) {
    card++;
    frame=0;
  }
}
void reset() {
  for (int i = 0;i<52;i++) {
    loc[i][0]=loc[i][0]+(400-loc[i][0]-(i<13||i>=26&&i<39?300:-300))/(60-frame);
    loc[i][1]=loc[i][1]+(26*26-i*2*26+(i<13&&rando==0?-13:0)+(i<26&&i>=13?2*26*13-(rando==1?-13:0):0)+(i>=26&&i<39?2*26*26-26-(rando==1?-13:0):0)+(i>=39?2*26*39-26-(rando==0?-13:0):0)-loc[i][1])/(30-frame);
  }
  frame++;
  if (frame==30) {
    reseting=false;
  }
}
void changeNums() {
  int[][] loctemp=new int[52][2];
  PImage[] imgtemp = new PImage[52];
  for (int i = 0; i<52;i++) {
    int num;
    if (i<13) {
      num=i*2+(rando==1?0:26);
    }
    else if (i<39&&i>=26) {
      num = (i-26)*2+1+(rando==1?0:26);
    }
    else if (i>=13&&i<26) {
      num =i*2-(rando==1?0:26);
    }
    else {
      num=(i-39)*2+26+1-(rando==1?0:26);
    }
    loctemp[num]=loc[i];
    imgtemp[num]=img[i];
  }
  loc=loctemp;
  img=imgtemp;
  frame=0;
  reseting=false;
  card=0;
}



