
class card {
   
  int num, row, card;
  float X=332, Y=-150, Xend, Yend, Xhover, Yhover;
  String rank;
  boolean flipped = false, dealt = false, hover = false;
  String[] sentences ={
"There they stood,\nfacing oblivion,\nwith their backs\nagainst the wall.",
"She bit directly\ninto his jugular.",
"He could turn any\nsituation on its\nhead.",
"He threw his arms\naround her.",
"After all, there\nwas a feeling that\nthings were going\nto turn out\njust fine.",
"He jabbed the\njagged metal\ninto her temple.",
"At long last,\nthe situation\nhad made itself\napparent.",
"When the sun\nfinally came out,\nit turned out there\nwasn’t much\nto see.",
"They would have\nto share this fate.",
"If one suspected\nthat the other\ndisagreed, they\nwould disagree\nas well.",
"A stalemate, of\nsorts, prevented\nfurther actions.",
"They agreed to\ndo nothing more.",
"They waited for\n20 minutes.",
"Too many times\nhad this happened.",
"\"When in Rome,\"\nthey thought.",
"There was\nnothing\nhe could do to\nkeep from smiling.",
"There was\nnothing\nshe could do to\nkeep from glaring.",
"All at once,\nthere was a great\ndeal of tension.",
"All at once,\nthere was a great\ndeal of sadness.",
"When the coin\nlanded, they knew\nwhat they had\n to do.",
"Arguing, they\ndecided to leave\nit up to chance.",
"He thought about\nwhat he had left\nbehind.",
"She thought about\nwhat she would\nnever\nget to see.",
"It turned out\nthere was an owl\nin the nearby\ntree.",
"There was actually\na microphone\nhidden under\nthe patch\nof grass.",
"The best way\nto start is often\nwith the\nconnection,\nwhich follows:",
"Help was on\nthe way.",
"He told her\nthat he loved her.",
"She told him\nthat she was\npregnant.",
"Their children\nwould be\nwondering\nwhere they’d gone.",
"His parents were\nprobably going to\nmake their weekly\ncall soon.",
"She was very\nexcited.",
"He couldn’t stop\ntapping his foot.",
"There was a song\nstuck in her head.",
"He had gambled\nall of his money\non this; he even\nsold the house.",
"When she got\nback, she was\nplanning to\nsurprise him.",
"Now, of all times,\nhis shoes were\nchafing his ankles.",
"She picked up the\nbubbles, and\nblew some\ninto the breeze.",
"He started to sing.",
"Finally, they\ncould go.",
"He stood up, and\noffered his hand.",
"She took his hand\nand pulled him\ndown.",
"She stood up.",
"They were going\nto miss this\nlittle spot.",
"He was going to\nwrite about this\nday in his journal.",
"She was going to\nmake sure he\nnever forgot.",
"Since then, the\nplace has\nchanged.",
"Nobody talks\nabout them\nanymore.",
"He climbed into\nthe helicopter.",
"She climbed into\nthe helicopter.",
"They rose up off\nthe ground,\nlooking\ninto the eyes\nof one another.",
"The sun was\nblotted out."};
  color RorB;
  String[] backWords = new String[6];
  PFont theFont = loadFont("DejaVuSansMono-Bold-20.vlw");
  PFont theFont2 = loadFont("DejaVuSansCondensed-Oblique-12.vlw");
  PFont theFont3 = loadFont("URWBookmanL-DemiBoldItal-26.vlw");
   
  card(int _num, int _card) {
    num=_num;
    card=_card;
    if(card>=26) RorB = color(255,0,0);
    else RorB = color(0);
    switch(card%13){
      case 1: rank = "A"; break;
      case 11: rank = "J"; break;
      case 12: rank = "Q"; break;
      case 0: rank = "K"; break;
      default: rank = ""+card%13;
    }
    if(num>5)row=1;
    else row=0;
    Xend=(20+125*(float(num)%6));
    Yend=(20+175*float(row));
    for(int i=0;i<6;i++){
      backWords[i]=sentences[(1+card+i)%52];
    }
  }
   
  void display() {
    if(hover) {
      X-=2;
      Y-=2;
    }
    textAlign(LEFT);
    stroke(50,50,130);
    fill(255);
    rect(X,Y,110,150);
    noStroke();
    if(flipped) {
      fill(RorB);
      textFont(theFont);
      text(rank,6+X,20+Y);
      if(card<13)this.suit(0);
      else if(card<26)this.suit(1);
      else if(card<39)this.suit(2);
      else if(card<52)this.suit(3);
      fill(0);
      textFont(theFont2);
      text(sentences[card],6+X,65+Y);
    } else {
      fill(100,100,255);
      rect(X+10,Y+10,90,130);
      fill(255);
      textFont(theFont3,40);
      pushMatrix();
      translate(X,Y);
      rotate(1.570796);
      for(int i=0;i<6;i++){
      text(backWords[i],3,i*10-110,120,50);
      }
      popMatrix();
    }
    if(hover||!dealt) {
      stroke(0,0,0,150);
      strokeWeight(2);
      line(X+111,Y+1,X+111,Y+151);
      line(X+1,Y+151,X+111,Y+151);
    }
    if(hover){
      X+=2;
      Y+=2;
      strokeWeight(1);
      noStroke();
    }
    X = .75*X+.25*Xend;
    Y = .75*Y+.25*Yend;
    if(X>=Xend-1&&Y>=Yend-1)dealt=true;
  }
   
  void flip() {
    flipped=!flipped;
  }
  
  boolean dealt() {
    return dealt;
  }
   
  boolean contains(int mX, int mY) {
    if(X<mX&&mX<X+110
          &&Y<mY&&mY<Y+150)
    return true;
    else return false;
  }
  
  void hover() {
    hover=true;
  }
  void dehover() {
    hover=false;
  }
   
  void suit(int suit) {
    noStroke();
    pushMatrix();
    translate(X+46,Y+10);
    switch (suit) {
      case 0: beginShape();
              vertex(15,0);
              vertex(29,15);
              vertex(30,20);
              vertex(25,25);
              vertex(18,20);
              vertex(18,27);
              vertex(20,30);
              vertex(10,30);
              vertex(12,27);
              vertex(12,20);
              vertex(5,25);
              vertex(0,20);
              vertex(1,15);
              endShape(CLOSE);
              break;
      case 1: ellipse(15,7,15,15);
              ellipse(6,17,15,15);
              ellipse(24,17,15,15);
              beginShape();
              vertex(18,10);
              vertex(18,27);
              vertex(20,30);
              vertex(10,30);
              vertex(12,27);
              vertex(12,10);
              endShape(CLOSE);
              break;
      case 2: beginShape();
              vertex(15,0);
              vertex(30,15);
              vertex(15,30);
              vertex(0,15);
              endShape(CLOSE);
              break;
      case 3: beginShape();
              vertex(1,15);
              vertex(0,7);
              vertex(6,0);
              vertex(13,2);
              vertex(15,10);
              vertex(17,2);
              vertex(24,0);
              vertex(30,7);
              vertex(29,15);
              vertex(15,30);
              endShape(CLOSE);
              break;
    }
    popMatrix();
  }
}

