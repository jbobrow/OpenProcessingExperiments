
PFont font;
String s[] = new String[5];
int howLong = 5, cnt =0;

void setup() {

  size(600, 600);
  background(0);
  colorMode(HSB, 360, 100, 100);

  font = loadFont("TimesNewRomanPS-BoldMT-48.vlw"); 
  textFont(font);

  s[0] = "Art";
  s[1] = "&";
  s[2] = "Humanity";
  s[3] = "Tech";  
  s[4] = "FA";
}


void draw() {
  if(cnt++>300)
     return;
   
  int kind = (int)random(0, howLong);
  int sz = (int)random(20, 72);
  float x= random(0, width);
  float y = random(0, height);
  
  textSize(sz);
  fill(kind*360/howLong, map(x, 0, width, 0, 100), map(y, 0, height, 0, 100));
  text(s[kind], x, y);
}

void mousePressed(){
  
    background(0);
    cnt = 0;
}
