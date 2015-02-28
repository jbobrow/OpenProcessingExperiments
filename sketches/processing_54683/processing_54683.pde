
int x = 1;
float b = 200;
PFont myfont;


void setup(){
 size(700,700);
myfont = loadFont("Cochin-BoldItalic-20.vlw");

background(150,0,90);
frameRate(4);
  
}

void draw(){
 
  textFont(myfont);
  textSize(30);
  fill(0,10,150);
  text("PAY",100,90);
  
  textFont(myfont);
  textSize(100);
  fill(0,10,150);
  text("WITH",100,200);
  
  
  textFont(myfont);
  textSize(50);
  fill(random(200),random(255),80);
  text("PAPER",100,400);
  
  textFont(myfont);
  textSize(20);
  fill(90,10,70);
  text("AXELOD",250+random(-500,500),250+random(-500,500),150,150);

  textFont(myfont);
  textSize(10);
  fill(random(200),random(200),190);
  text("GET LIVELY",250+random(-500,500),250+random(-500,500),100,100);
 
 textFont(myfont);
 textSize(20);
 fill(20,200,0);
 text("STABLE", 250+random(-500,500),250+random(-500,500),100,100);
  
 
 

}

void mousPressed(){
  b = b -100;

  
}

void keyPressed(){
  fill(random(250),100,60);
  
}

