
int x = 5;
float b = 400;
float a = 400;

PFont myfont;

void setup(){
  size(800,800);
  background (0,0,0);
  myfont = loadFont("Impact-48.vlw");
}

void draw(){
  if(frameCount < 1) return;
  fill(0,0,0,10);
  rect(0,0,800,800);
  noStroke();
  
  textFont(myfont);
  textSize(b);
  fill(255,255,255,90);
  text("STARBUCKS",0,400);
  
  textFont(myfont);
  textSize(b);
  fill(118,118,118,80);
  text("CREPERIE",0,600);
  
  textFont(myfont);
  textSize(b);
  fill(118,118,118,80);
  text("JOHNNY ROCKETS",0,200);
    
  textFont(myfont);
  textSize(a);
  fill(47,72,95,50);
  text("KABOB AND CURRY",0,100);
    
  textFont(myfont);
  textSize(a);
  fill(47,72,95,50);
  text("NICE SLICE",0,700);
  
}

void keyPressed(){
  b = b - 10;
  a = a + 10;
}

void keyReleased(){
  b = b + 100;
  a = a - 100;
}

