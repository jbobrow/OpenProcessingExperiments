
int x = 5;
float s1= 50;
float s2= 100;
float b = 300;
PFont myfont;
PFont myfont2;

void setup(){
size(800,800);
myfont = loadFont("BRODY-48.vlw");
myfont2 = loadFont("BlairMdITCTT-Medium-48.vlw");
}

void draw(){
  background(30,0,70);
  fill(250,b,10,20);
  textFont(myfont2);
  textSize(s2);
  text("SAKIS",10,b);
  
   textFont(myfont);
   
  textSize(s1);
  fill(200,5,80);
  text("COCA-COLA",b,b+200);
}

void mousePressed(){
 b = b - 10;
 s1= s1+3;
 s2= s2-3;

 
}

void keyPressed(){

  fill(random(255),0,0);
 
  
}

