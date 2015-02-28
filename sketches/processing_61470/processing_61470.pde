
int b = 20;
int b2 = 20;
PFont font;

void setup(){
  size(600,600);
  background(255,255,255);
   font = loadFont("Futura-CondensedExtraBold-20.vlw");
}

void draw(){
  if (mousePressed){
b +=20;
  fill(255,255,255);
  textFont(font);
    textSize(b);
    text("inside",0,400);
    
    b2 +=20;
  fill(random(20,40),30,30,random(100));
  textFont(font);
    textSize(b2);
    text("outside",0,600);
    
      b2 +=20;
  fill(random(20,40),30,30,random(100));
  textFont(font);
    textSize(b2);
    text("kick",0,600);
    
    
      b2 +=20;
  fill(random(20,40),30,30,random(100));
  textFont(font);
    textSize(b2);
    text("push",0,600);
    
  
}
}

void keyPressed(){
  fill(0,0,0);
  textFont(font);
    textSize(20);
    text("inside/outside",20,100);

fill(0,0,0);
  textFont(font);
    textSize(20);
    text("kick/push",20,160);
}

