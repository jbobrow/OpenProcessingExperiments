
int x = 20;
float b = 400;
PFont myfont;
PFont mfont;

void setup(){
  size(550,450);
  background(255,255,255);
  myfont = loadFont("Georgia-48.vlw");
  mfont = loadFont("Geneva-48.vlw");

}

void draw(){

background(255,255,255);


fill(0,0,0);
  textFont(myfont);
  textSize(50);
  text("nostalgia",b,300);
  
  textFont(mfont);
  textSize(20);
  text("me hardly knew me",30,b);
  
  noStroke();
  fill(0,0,0,10);
rect (250,200,50,50);

noStroke();
  fill(0,0,0,30);
rect (230,180,90,90);

noStroke();
  fill(0,0,0,50);
rect (210,160,130,130);

noStroke();
  fill(0,0,0,80);
rect (190,140,170,170);

noStroke();
  fill(0,0,0,100);
rect (170,120,210,210);


noStroke();
  fill(0,0,0,120);
rect (150,100,250,250);

noStroke();
  fill(0,0,0,140);
rect (130,80,290,290);

noStroke();
  fill(0,0,0,5);
rect (110,60,330,330);


  
}

void mousePressed(){
  b = b - 10;
}

void keyPressed(){
  
}

