
int x = 20;
float b = 600;
PFont myfont;
PFont mfont;

void setup(){
  size(800,600);
  background(255,255,255);
  myfont = loadFont("BigCaslon-Medium-92.vlw");
  mfont = loadFont("ArialUnicodeMS-92.vlw");
}

void draw(){
  fill(80,b,230,b);
  textFont(myfont);
  textSize(b);
  text("major gales and hurricanes",5,b);
  
  fill(80,0,230,50);
  textFont(mfont);
  textSize(50);
  text("waterman",550,570);
}

void mousePressed(){
  b = b - 20;
}
