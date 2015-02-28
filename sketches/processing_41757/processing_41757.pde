
int prevSec;
int millisRolloverTime;

void setup() {
  size(300, 300);
}

void draw() {
smooth();

  int H = hour();
  int M = minute();
  int S = second();

  if (prevSec != S) {
    millisRolloverTime = millis();
  } 
  prevSec = S;
  int mils = millis() - millisRolloverTime;
  //---------------------------------------------- 

  background (223, 250, 215);
  
  fill(155);
  rect(0,200,300,100);
  fill(130);
  rect (10, 220, 280, 80);
//drain
  fill(123);
  stroke(0);
  strokeWeight(2);
  ellipse (150, 250, 50, 30);
  line(150, 235, 150, 265);
  line (125, 250, 175, 250);
  noFill();
  ellipse(150, 250, 20, 15);
  
  //window
  fill(M*4, M*4, M*8);
  stroke(67);
  strokeWeight(5);
  rect(10, -10, 280, 180);
  noStroke();
  fill(H*16, H*17, H*4);
  ellipse((100+H*3.5), (50-H), 40, 40);
  
  
 fill( 130);
 rect(140, 0, 13, 200);
  fill(100);
  ellipse (145, 70, 27, 10);
  
//faucets
rect(50, 180, 10, 20);
ellipse (55, 180, 15,15);
rect (30, 175, 20, 7);

 rect(240, 180, 10, 20);
ellipse (245, 180, 15,15);
rect (250, 175, 20, 7);

  noStroke();


  if (S>58.5) {
    drawsponge (150, 230);
  }
  else {
    drawDrip (150, 100);
  }

  noStroke();
  fill (137, 134, 134);
  rect(130, -1, 30, 70);
  
  
  
}


//water and dripping

void drawDrip(int x, int y) {
  int H = hour();
  int M = minute();
  int S = second();

  if (prevSec != S) {
    millisRolloverTime = millis();
  } 
  prevSec = S;
  int mils = millis() - millisRolloverTime;

  fill(30, 25, 190);
  ellipse (x, y+150, S*3, S+2);

  fill(25, 15, 180);
  ellipse (x, mils/4, 10, 10);
}

//rect that crosses screen

void drawsponge (int z, int t) {
  int H = hour();
  int M = minute();
  int S = second();

  if (prevSec != S) {
    millisRolloverTime = millis();
  } 
  prevSec = S;
  int mils = millis() - millisRolloverTime;



  fill(210, 229, 137);
  rect ((mils/2), t, 50, 20);
}

