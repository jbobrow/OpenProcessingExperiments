
PFont font;
int interval = 3000;
int time1 = 0;
int time2 = time1 + interval;
int counter = 0;
float x = 0;
int phraseCount =138; //change with new lines
String[] Phrase;



void setup() {
  size(640, 480);
  smooth();
  font = loadFont("TimesNewRomanPSMT-248.vlw");
  textFont(font);
  textSize(38);
  textAlign(CENTER);
  textMode(MODEL);

  Phrase = new String[phraseCount]; //setup phrases, we moved to the setup() section because th code would not run otherwise.
  Phrase[0]="I’m going"; 
  Phrase[1]="to take something from you.";
  Phrase[2]="What I'm giong to take,";
  Phrase[3]="you can never get back.";
  Phrase[4]="Every second you watch me";
  Phrase[5]="I am stealing";
  Phrase[6]="from you.";
  Phrase[7]="The";
  Phrase[8]="time you give me";
  Phrase[9]="I can't give";
  Phrase[10]="back to you.";
  Phrase[11]="Each second";
  Phrase[12]="you give to me.";
  Phrase[13]="Is"; 
  Phrase[14]="mine"; 
  Phrase[15]="forever.";
  Phrase[16]="Your"; 
  Phrase[17]="time is fixed.";
  Phrase[18]="It's coming"; 
  Phrase[19]="closer"; 
  Phrase[20]="and closer.";
  Phrase[21]="The";
  Phrase[22]="more";
  Phrase[23]="you";
  Phrase[24]="think about it.";
  Phrase[25]="The faster";
  Phrase[26]="it";
  Phrase[27]="comes.";
  Phrase[28]="What";
  Phrase[29]="I took";
  Phrase[30]="from"; 
  Phrase[31]="you"; 
  Phrase[32]="I"; 
  Phrase[33]="will"; 
  Phrase[34]="never give back.";
  Phrase[35]="You"; 
  Phrase[36]="can never"; 
  Phrase[37]="buy it or take it"; 
  Phrase[38]="for yourself.";
  Phrase[39]="When"; 
  Phrase[40]="you"; 
  Phrase[41]="run"; 
  Phrase[42]="out"; 
  Phrase[43]="of what I have taken.";
  Phrase[44]="You will";
  Phrase[45]="..........";
  Phrase[46]="Time"; 
  Phrase[47]="is inevitable.";
  Phrase[48]="You can't"; 
  Phrase[49]="avoid it.";
  Phrase[50]="You";
  Phrase[51]="Are";
  Phrase[52]="Moving closer to";
  Phrase[53]="It"; 
  Phrase[54]="Right";
  Phrase[55]="Now"; 
  Phrase[56]="…";
  Phrase[57]=",.,,,";
  Phrase[58]=",,,";
  Phrase[59]="now";
  Phrase[60]="move closer";
  Phrase[61]="to";
  Phrase[62]="it, this journey";
  Phrase[63]="…";
  Phrase[64]="as"; 
  Phrase[65]="long"; 
  Phrase[66]="as";
  Phrase[67]="you";
  Phrase[68]="..";
  Phrase[69]="be";
  Phrase[70]="…";
  Phrase[71]="trip";
  Phrase[72]="….";
  Phrase[73]="We,";
  Phrase[74]="Here,";
  Phrase[75]="TOGETHER NOW,";
  Phrase[76]="Move";
  Phrase[77]="closer";
  Phrase[78]="to it.";
  Phrase[79]="You";
  Phrase[80]="Can join me.";
  Phrase[81]="You";
  Phrase[82]="Can join us.";
  Phrase[83]="We";
  Phrase[84]="can lay";
  Phrase[85]="underneath";
  Phrase[86]="the world.";
  Phrase[87]="Or";
  Phrase[88]="you";
  Phrase[89]="can";
  Phrase[90]="step";
  Phrase[91]="on it.";
  Phrase[92]="What";
  Phrase[93]="ever";
  Phrase[94]="you decide.";
  Phrase[95]="Don’t worrie";
  Phrase[96]="about"; 
  Phrase[97]="what I’m taking.";
  Phrase[98]="You have enough of it.";
  Phrase[99]="Don’t"; 
  Phrase[100]="you.";
  Phrase[101]="Too much"; 
  Phrase[102]="of a good"; 
  Phrase[103]="thing"; 
  Phrase[104]="can be bad.";
  Phrase[105]="Right,"; 
  Phrase[106]="friend.";
  Phrase[107]="Remember";
  Phrase[108]="that"; 
  Phrase[109]="I am your guide.";
  Phrase[110]="“”””";
  Phrase[111]="Captain";
  Phrase[112]="“”””””";
  Phrase[113]="Without"; 
  Phrase[114]="me…";
  Phrase[115]="You can never be without me.";
  Phrase[116]="Leisure"; 
  Phrase[117]="has become destruction.";
  Phrase[118]="Lions"; 
  Phrase[119]="….";
  Phrase[120]="fat heads.";
  Phrase[121]="Do";
  Phrase[122]="you know?";
  Phrase[123]="Am"; 
  Phrase[124]="Does life"; 
  Phrase[125]="satisfy you?";
  Phrase[126]="How"; 
  Phrase[127]="long will you"; 
  Phrase[128]="watch me?";
  Phrase[129]="How"; 
  Phrase[130]="long do you"; 
  Phrase[131]="have.";
  Phrase[132]="It is through repetition";
  Phrase[133]="that we are taught";
  Phrase[134]="instant gratification.";
  Phrase[135]="Isn’t"; 
  Phrase[136]="too much";
  Phrase[137]="the perfect amount.";
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
    if (counter <137) counter++;
    else counter=0;
  }
}


