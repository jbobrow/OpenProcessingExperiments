
Crit myCrit;

void setup() {
  size(600,600);
  
  myCrit = new Crit();
}

void draw() {
  background(255);
  myCrit.display();
  myCrit.move();
}

class Crit {
  int centerPTx = 300;
  int centerPTy = 300;
  int botleftx = 250;
  int botlefty = 350;
  int botrightx = 350;
  int botrighty = 350;
  int topx = 300;
  int topy = 250;
  int sc = 100;

  
  Crit () {
    //sc = color(100);

  }
  
void display() {
  strokeWeight(3);
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
  centerPTy--;
  botlefty--;
  botrighty--;
  topy--;
}
 
void left(){    //move left
  centerPTx--;
  botleftx--;
  botrightx--;
  topx--;
}
 
void down() {    //move down
  centerPTy++;
  botlefty++;
  botrighty++;
  topy++;
}

void right() {    // move right
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



