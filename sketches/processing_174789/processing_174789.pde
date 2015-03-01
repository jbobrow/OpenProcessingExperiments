
PFont font;
int interval = 3000;
int time1 = 0;
int time2 = time1 + interval;
int counter = 0;
float x = 0;
int phraseCount =61; //change with new lines
String[] Phrase;
 
 
 
void setup() {
  size(640, 480);
  smooth();
  
 
  textSize(38);
  textAlign(CENTER);
  textMode(MODEL);
 
  Phrase = new String[phraseCount]; //setup phrases, we moved to the setup() section because th code would not run otherwise.
  Phrase[0]="Hey";
  Phrase[1]="this will only take";
  Phrase[2]="60 seconds";
  Phrase[3]="I promise!";
  Phrase[4]="I really like";
  Phrase[5]="the fact that we get to";
  Phrase[6]="meet each other,";
  Phrase[7]="I really like ";
  Phrase[8]="the fact that I am";
  Phrase[9]="able to get to know";
  Phrase[10]="you more,";
  Phrase[11]="I don't want to overexagerate, ";
  Phrase[12]="but you make my heart go wild.";
  Phrase[13]="Anyways,";
  Phrase[14]="my point";
  Phrase[15]="is very direct";
  Phrase[16]="I want you";
  Phrase[17]="and I want to ";
  Phrase[18]="have a life with you";
  Phrase[19]="feeling the way how you";
  Phrase[20]="make me feel is amazin.....,";
  Phrase[21]="I Cannot think of ";
  Phrase[22]="anyone else,";
  Phrase[23]="you took over my whole";
  Phrase[24]="SELF;";
  Phrase[25]="my body, my mind, my days";
  Phrase[26]="are yours.";
  Phrase[27]="In other words";
  Phrase[28]="You are all I ever wanted";
  Phrase[29]="and more.";
  Phrase[30]="The way how you are";
  Phrase[31]="is enchanting,";
  Phrase[32]="you look beatiful";
  Phrase[33]="even when you are not";
  Phrase[34]="trying too.";
  Phrase[35]="sorry if I am";
  Phrase[36]="annoying, boring or an";
  Phrase[37]="asshole sometimes,";
  Phrase[38]="I do not want to lose you";
  Phrase[39]="If there was a dragon";
  Phrase[40]="on my way to your heart,";
  Phrase[41]="I would not mind, fighting him";
  Phrase[42]="just to be next to your";
  Phrase[43]="warm and precious love.";
  Phrase[44]="The time that we are sharing";
  Phrase[45]="increases my love for you";
  Phrase[46]="as we kiss.";
  Phrase[47]="To make all my thoughts";
  Phrase[48]="more clear,";
  Phrase[49]="I would say:";
  Phrase[50]="I LOVE YOU,";
  Phrase[51]="thank you for being";
  Phrase[52]="part of my life and fulfill me";
  Phrase[53]="with different colors everyday.";
  Phrase[54]="In this day I have one more question";
Phrase[55]="would you be my ";
  Phrase[56]="GIRLFRIEND?";
  Phrase[57]="if it is on me I would";
  Phrase[58]="never mind asking you out,";
  Phrase[59]="million times, why?";
  Phrase[60]="because I LOVE YOU!";
}
 void draw() {
  int currentTime = millis();
  background(0);
 
  if (currentTime > time1 && currentTime <= time2) {
    text(Phrase[counter], 320,240);
  }
  else {
    time1 =currentTime;
    time2 =currentTime +interval;
    if (counter <60) counter++;
    else counter=0;
  }
}

