
PFont font;
float timeDelta=2*height;
String s[] = new String[2];
int howLong = 2;
boolean goUp = false;
void setup() {

  size(600, 600);
  background(0);
  colorMode(HSB, 360, 100, 100);

  font = loadFont("TimesNewRomanPS-BoldMT-48.vlw");
  textFont(font);

  s[0] = "Up";
  s[1] = "Down";
}


void draw() {
  if (timeDelta>height)
    goUp = false;
  else if (timeDelta<0)
    goUp = true;

  if (goUp)
    timeDelta++;
  else
    timeDelta--; 

  background(0);
  randomSeed(0);
  for (int i=0; i<200; i++) {
    int kind = goUp ? 0 : 1;
    int sz = (int)random(20, 72);
    float x= random(0, width);
    float y = random(-height, height);

    textSize(sz);
    fill(kind*360/howLong, map(y+timeDelta, 0, height, 0, 100), 100 , map(sz, 20,72,0,255) );
    text(s[kind], x, y+timeDelta);
  }
}


