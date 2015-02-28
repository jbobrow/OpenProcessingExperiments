
PImage bg;
int a;
import simpleML.*;

HTMLRequest source1;
HTMLRequest source2;
HTMLRequest source3;
HTMLRequest source4;

String htmlsource1="";
String htmlsource2="";
String htmlsource3="";
String htmlsource4="";

int s = second();

float startTime;

boolean gotnew = false;

float x = 0;
int interval = 2000;
//float jump = 1622/(10*interval/1000);

int w = 1622;
int h = 1080;

int jsize1 = 5;
int jsize2 = 5;
int jsize3 = 5;
int jsize4 = 5;

int ksize1 = 5;
int ksize2 = 5;
int ksize3 = 5;
int ksize4 = 5;

int csize1 = 5;
int csize2 = 5;
int csize3 = 5;
int csize4 = 5;

int tsize1 = 5;
int tsize2 = 5;
int tsize3 = 5;
int tsize4 = 5;


int japans_source1 = 0;
int japans_source2 = 0;
int japans_source3 = 0;
int japans_source4 = 0;

int koreas_source1 = 0;
int koreas_source2 = 0;
int koreas_source3 = 0;
int koreas_source4 = 0;


int chinas_source1 = 0;
int chinas_source2 = 0;
int chinas_source3 = 0;
int chinas_source4 = 0;

int taiwans_source1 = 0;
int taiwans_source2 = 0;
int taiwans_source3 = 0;
int taiwans_source4 = 0;




void setup() {
  size(1622, 1080);
  bg = loadImage("asiamap.png");
  source1 = new HTMLRequest(this, "http://www.cnn.com/WORLD/asiapcf/archive/");
  source2 = new HTMLRequest(this, "http://www.nytimes.com/pages/world/asia/index.html");
  source3 = new HTMLRequest(this, "http://www.bbc.co.uk/news/world/asia/");
  source4 = new HTMLRequest(this, "http://www.theonion.com/channels/asia/");
}

void draw() {

  noStroke();
  background(bg);

  fill(255, 0, 0);

  //tokyo
  ellipse(1258, 473, 5, 5);

  //tokyo1
  ellipse(629, 236.5, 5, 5);
  //tokyo2
  ellipse(629 + w/2, 236.5, 5, 5);
  //tokyo3
  ellipse(629, 236.5+h/2, 5, 5);
  //tokyo4
  ellipse(629 + w/2, 236.5+h/2, 5, 5);

  //taipei
  ellipse(691.2, 857, 5, 5);
  //taipei1
  ellipse(345.6, 428.5, 5, 5);
  //taipei2
  ellipse(345.6+w/2, 428.5, 5, 5);
  //taipei3
  ellipse(345.6, 428.5+h/2, 5, 5);
  //taipei4
  ellipse(345.6+w/2, 428.5+h/2, 5, 5);
  ;

  //beijing
  ellipse(531, 305.5, 5, 5);
  //beijing1
  ellipse(265.5, 152.75, 5, 5);
  //beijing2
  ellipse(265.5+w/2, 152.75, 5, 5);
  //beijing3
  ellipse(265.5, 152.75+h/2, 5, 5);
  //beijing4
  ellipse(265.5+w/2, 152.75+h/2, 5, 5);

  //korea
  ellipse(865, 370, 5, 5);
  //korea1
  ellipse(432.5, 185, 5, 5);
  //korea2
  ellipse(432.5+w/2, 185, 5, 5);
  //korea3
  ellipse(432.5, 185+h/2, 5, 5);  
  //korea4
  ellipse(432.5+w/2, 185+h/2, 5, 5);


  float now = millis();
  if (now > startTime + interval) {
    source1.makeRequest();
    source2.makeRequest();
    source3.makeRequest();
    source4.makeRequest();
    startTime = now;
  }

  if (gotnew) {
    gotnew = false;

    japans_source1 = getMatchCount("japan", htmlsource1);
    japans_source2 = getMatchCount("japan", htmlsource2);
    japans_source3 = getMatchCount("japan", htmlsource3);
    japans_source4 = getMatchCount("japan", htmlsource4);

    chinas_source1 = getMatchCount("china", htmlsource1);
    chinas_source2 = getMatchCount("china", htmlsource2);
    chinas_source3 = getMatchCount("china", htmlsource3);
    chinas_source4 = getMatchCount("china", htmlsource4);

    taiwans_source1 = getMatchCount("taiwan", htmlsource1);
    taiwans_source2 = getMatchCount("taiwan", htmlsource2);
    taiwans_source3 = getMatchCount("taiwan", htmlsource3);
    taiwans_source4 = getMatchCount("taiwan", htmlsource4);

    koreas_source1 = getMatchCount("korea", htmlsource1);
    koreas_source2 = getMatchCount("korea", htmlsource2);
    koreas_source3 = getMatchCount("korea", htmlsource3);
    koreas_source4 = getMatchCount("korea", htmlsource4);




    jsize1 = 10;
    jsize2 = 10;
    jsize3 = 10;
    jsize4 = 10;

    csize1 = 10;
    csize2 = 10;
    csize3 = 10;
    csize4 = 10;

    tsize1 = 10;
    tsize2 = 10;
    tsize3 = 10;
    tsize4 = 10;

    ksize1 = 10;
    ksize2 = 10;
    ksize3 = 10;
    ksize4 = 10;
  }

  drawjapan1();
  drawjapan2();
  drawjapan3();
  drawjapan4();

  drawchina1();
  drawchina2();
  drawchina3();
  drawchina4();

  drawtaiwan1();
  drawtaiwan2();
  drawtaiwan3();
  drawtaiwan4();

  drawkorea1();
  drawkorea2();
  drawkorea3();
  drawkorea4();
}


void drawjapan1() {
  if (japans_source1 > 0) {
    fill(255, 0, 0);
    ellipse(629, 236.5, jsize1, jsize1);
    jsize1+=3;
  }
  japans_source1--;
}
void drawjapan2() {
  if (japans_source2 > 0) {
    fill(0, 66, 125);
    ellipse(629 + w/2, 236.5, jsize2, jsize2);
    jsize2+=3;
  }
  japans_source2--;
}
void drawjapan3() {
  if (japans_source3 > 0) {
    fill(122, 0, 0);
    ellipse(629, 236.5+h/2, jsize3, jsize3);
    jsize3+=3;
  }
  japans_source3--;
}
void drawjapan4() {
  if (japans_source4 > 0) {
    fill(0, 100, 0);
    ellipse(629 + w/2, 236.5+h/2, jsize4, jsize4);
    jsize4+=3;
  }
  japans_source4--;
}

void drawchina1() {
  if (chinas_source1 > 0) {
    fill(255, 0, 0);
    ellipse(265.5, 152.75, csize1, csize1);
    csize1+=3;
  }
  chinas_source1--;
}

void drawchina2() {
  if (chinas_source2 > 0) {
    fill(0, 66, 125);
    ellipse(265.5+w/2, 152.75, csize2, csize2);
    csize2+=3;
  }
  chinas_source2--;
}

void drawchina3() {
  if (chinas_source3 > 0) {
    fill(122, 0, 0);
    ellipse(265.5, 152.75+h/2, csize3, csize3);
    csize3+=3;
  }
  chinas_source3--;
}

void drawchina4() {
  if (chinas_source4 > 0) {
    fill(0, 100, 0);
    ellipse(265.5+w/2, 152.75+h/2, csize4, csize4);
    csize4+=3;
  }
  chinas_source4--;
}

void drawtaiwan1() {
  if (taiwans_source1 > 0) {
    fill(255, 0, 0);
    ellipse(345.6, 428.5, tsize1, tsize1);
    tsize1+=3;
  }
  taiwans_source1--;
}

void drawtaiwan2() {
  if (taiwans_source2 > 0) {
    fill(0, 66, 125);
    ellipse(345.6+w/2, 428.5, tsize2, tsize2);
    tsize2+=3;
  }
  taiwans_source1--;
}
void drawtaiwan3() {
  if (taiwans_source3 > 0) {
    fill(122, 0, 0);
    ellipse(345.6, 428.5+h/2, tsize3, tsize3);
    tsize3+=3;
  }
  taiwans_source1--;
}
void drawtaiwan4() {
  if (taiwans_source4 > 0) {
    fill(0, 100, 0);
    ellipse(345.6+w/2, 428.5+h/2, tsize4, tsize4);
    tsize4+=3;
  }
  taiwans_source4--;
}

void drawkorea1() {
  if (koreas_source1 > 0) {
    fill(255, 0, 0);
    ellipse(432.5, 185, ksize1, ksize1);
    ksize1+=3;
  }
  koreas_source1--;
}

void drawkorea2() {
  if (koreas_source2 > 0) {
    fill(0, 66, 125);
    ellipse(432.5+w/2, 185, ksize2, ksize2);
    ksize2+=3;
  }
  koreas_source2--;
}
void drawkorea3() {
  if (koreas_source3 > 0) {
    fill(122, 0, 0);
    ellipse(432.5, 185+h/2, ksize3, ksize3);
    ksize3+=3;
  }
  koreas_source3--;
}
void drawkorea4() {
  if (koreas_source4 > 0) {
    fill(0, 100, 0);
    ellipse(432.5+w/2, 185+h/2, ksize4, ksize4);
    ksize4+=3;
  }
  koreas_source4--;
}

void netEvent(HTMLRequest r) {
  htmlsource1 = source1.readRawSource();
  htmlsource2 = source2.readRawSource();
  htmlsource3 = source3.readRawSource();
  htmlsource4 = source4.readRawSource();
  gotnew = true;
}

int getMatchCount(String find, String s) {
  int m = s.split(find).length;
  return m - 1;
}


