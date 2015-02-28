
Crit[] crits;

void setup() {
  size(600,600);
  crits = new Crit[0];
}

void draw() {
  background(255);
  for(int i=0; i<crits.length; i++){
    
  crits[i].display();
  crits[i].move();
}
}

void mousePressed() {
  Crit myCrit = new Crit();
  crits = (Crit[]) append(crits, myCrit);
}
class Crit {
  int centerPTx;
  int centerPTy;
  int botleftx;
  int botlefty;
  int botrightx;
  int botrighty;
  int topx;
  int topy;
  int sc;

  
  Crit() {
    centerPTx = 300;
    centerPTy = 300;
    botleftx = 250;
    botlefty = 350;
    botrightx = 350;
    botrighty = 350;
    topx = 300;
    topy = 250;
    sc = 100;
    scw = 3;
  }
  
void display() {
  strokeWeight(scw);
  stroke(sc);
  triangle(botleftx,botlefty,botrightx,botrighty,topx,topy);
  line(botleftx,botlefty,centerPTx,centerPTy);
  line(centerPTx,centerPTy,topx,topy);
  line(centerPTx,centerPTy,botrightx,botrighty);
}

  
void move() {
  if (key=='w')     //move up
  {
    up();
  }
  if (key=='a')    //move left
  {
    left();
  }
  if (key=='s')    //move down
  {
    down();
  }
  if (key=='d')    //move right
  {
    right();
  }
}
 
void up(){    //move up
  if (topy > 600) 
  centerPTy--;
  botlefty--;
  botrighty--;
  topy--;
}
 
void left(){    //move left
  if (botleftx > 600)
  centerPTx--;
  botleftx--;
  botrightx--;
  topx--;
}
 
void down() {    //move down
  if (topy > 600)
  centerPTy++;
  botlefty++;
  botrighty++;
  topy++;
}

void right() {    // move right
  if (botrightx > 600)
  centerPTx++;
  botleftx++;
  botrightx++;
  topx++;
} 


/* 
void frame () {    //create white frame to hide instructions when saved
  fill(255);
  noStroke();
  rect(0,575,1000,575);
  rect(0,0,1000,25);
  rect(0,0,25,600);
  rect(975,0,1000,600);
}
 
void instructions () {    //create uniform boarder & display instructions
  fill(200,200,200,100);
  noStroke();
  rect(0,575,1000,575);
  rect(0,0,1000,25);
  rect(0,0,25,600);
  rect(975,0,1000,600);
  textFont(f);
  fill(100);
  textAlign(CENTER);
  text("Use Mouse to draw  |  l = faded layer  |  r = reset canvas  |  s = save image",width/2, 590);
 
}
*/

}


