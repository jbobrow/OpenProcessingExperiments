
int xLever = 1040;
int yLever = 120;
int sR,sG,sB = 0;
int sW = 2;
int shape = 0;
float rotation = PI/64;
float scalar = .2;
PImage arrows;
boolean overLever = false;
boolean randomize = false;
boolean toggle = false;
boolean flag = false;
boolean first = true;
boolean canPress = true;
boolean overStop = false;
boolean[] rage = {false,false,false,false,false,false,false,false,false};
int[] win = {0,0,0,0,0,0};
Symbol[] symb = new Symbol[9];
Account acc; 


void setup()
{
  size(1200,900);
  smooth();
  acc = new Account();
}

void draw()
{

  update();
  background(35,137,36);
  makeInterface();
  drawSymbols(sR,sG,sB,sW);
  if(canPress)
  {
  keyPressed();
  }
}

void update()
{
  rotation += PI/64;
  if(!flag)
  {
  scalar += .1;
  }
  if(flag)
  {
  scalar -= .1;
  }
  if(scalar > 2 || scalar < .2)
  {
    flag = !flag;
  }
  
  strokeWeight(2);
  overStop = false;
  if(mouseX > 920 && mouseX < 1170 && mouseY > 750 && mouseY < 870)
  {
    overStop = true;
  }
}

void drawSymbols(int sR, int sG, int sB, int sW)
{  
  pushMatrix();
  translate(220,490);
  if(first)
  {
  symb[3] = new Symbol(0);
  }
  if(randomize)
  {
  symb[3].randomizeShape();
  }
  symb[3].changeShape(sR,sG,sB,sW);
  if(rage[3])
  {
  pushMatrix();
  rotate(rotation);
  scale(scalar);  
  symb[3].changeShape(sR,sG,sB,5); 
  popMatrix(); 
  
  }
  popMatrix();
  
  
  
  pushMatrix();
  translate(450,490);
  if(first)
  {
  symb[4] = new Symbol(1);
  }
  if(randomize)
  {
   symb[4].randomizeShape();
  }
  symb[4].changeShape(sR,sG,sB,sW);
  if(rage[4])
  {
  pushMatrix();
  rotate(rotation);
  scale(scalar); 
  symb[4].changeShape(sR,sG,sB,5);
  popMatrix();  
  }
  popMatrix();
  
  
  
  pushMatrix();
  translate(680,490);
  if(first)
  {
  symb[5] = new Symbol(2);
  }
  if(randomize)
  {
    symb[5].randomizeShape();
  }
  symb[5].changeShape(sR,sG,sB,sW);
    if(rage[5])
  {
  pushMatrix();
  rotate(rotation);
  scale(scalar);
  symb[5].changeShape(sR,sG,sB,5); 
  popMatrix(); 
  }
  popMatrix();
 
 
  
  pushMatrix();
  translate(220,360);
  if(first)
  {
  symb[0] = new Symbol(3);
  }
  if(randomize)
  {
    symb[0].randomizeShape();
  }
    symb[0].changeShape(sR,sG,sB,sW);  
      if(rage[0])
  {
  pushMatrix();
  rotate(rotation);
  scale(scalar);
  symb[0].changeShape(sR,sG,sB,5);
  popMatrix();  
  }
  popMatrix(); 
  
  
  
  pushMatrix();
  translate(450,360);
  if(first)
  {
  symb[1] = new Symbol(4);
  }
  if(randomize)
  {
    symb[1].randomizeShape();
  }
  symb[1].changeShape(sR,sG,sB,sW);
    if(rage[1])
  {
  pushMatrix();
  rotate(rotation);
  scale(scalar);
  symb[1].changeShape(sR,sG,sB,5);  
  popMatrix();
  }
  popMatrix(); 
  
  
  
  pushMatrix();
  translate(680,360);
  if(first)
  {
  symb[2] = new Symbol(5);
  }
  if(randomize)
  {
    symb[2].randomizeShape();
  }
  symb[2].changeShape(sR,sG,sB,sW);
    if(rage[2])
  {
  pushMatrix();
  rotate(rotation);
  scale(scalar);
  symb[2].changeShape(sR,sG,sB,5); 
  popMatrix(); 
  }
  popMatrix(); 


  
  pushMatrix();
  translate(220,620);
  if(first)
  {
  symb[6] = new Symbol(5);
  }
  if(randomize)
  {
    symb[6].randomizeShape();
  }
  symb[6].changeShape(sR,sG,sB,sW);
    if(rage[6])
  {
  pushMatrix();
  rotate(rotation);
  scale(scalar);
  symb[6].changeShape(sR,sG,sB,5);  
  popMatrix();
  }
  popMatrix();
 
 
  
  pushMatrix();
  translate(450,620);
  if(first)
  {
  symb[7] = new Symbol(5);
  }
  if(randomize)
  {
    symb[7].randomizeShape();
  }
  symb[7].changeShape(sR,sG,sB,sW);
    if(rage[7])
  {
  pushMatrix();
  rotate(rotation);
  scale(scalar);
  symb[7].changeShape(sR,sG,sB,5);  
  popMatrix();
  }
  popMatrix(); 
  
  
  
  pushMatrix();
  translate(680,620);
  if(first)
  {
  symb[8] = new Symbol(5);
  }
  if(randomize)
  {
    symb[8].randomizeShape();   
  }
  symb[8].changeShape(sR,sG,sB,sW);
    if(rage[8])
  {
  pushMatrix();
  rotate(rotation);
  scale(scalar);
  symb[8].changeShape(sR,sG,sB,5);  
  popMatrix();
  }
  popMatrix();   
}

void makeInterface()
{
  stroke(0,0,0);
  fill(175,20,50);
  rect(5,5, 890, 200);
  
  fill(255,255,0);
  PFont font;
  font = loadFont("Algerian-150.vlw");
  textFont(font);
  text("Big Money", 60, 150);
  strokeWeight(2);
  stroke(255,255,0);
  line(60,160,840,160);
  
  stroke(0,0,0);
  fill(180,180,180);
  rect(5,210,890,685);
  fill(175,20,50);
  rect(35,250,800,600);
  drawTraps();
  
  fill(255,255,255);
   rect(145,293,150,400);
   rect(375,293,150,400);
   rect(605,293,150,400);
   


   
     fill(105,105,105);
   rect(1000,125,80,600);
   
   
   


   fill(255,0,0);
   if(randomize)
   {
     if(toggle)
     {
     fill(155,50,50);
     }
     toggle = !toggle;
   }
   if(overStop)
   {
     strokeWeight(5);
   }
   rect(920, 750, 250,120);
   
  strokeWeight(2);
  fill(255,255,0);
  font = loadFont("Algerian-100.vlw");
  textFont(font);
  text("STOP", 930, 840);
  
  arrows = loadImage("updown.jpg");
  image(arrows,750,710);
  
  fill(100,100,100);
  rect(245,737,110,60);
  rect(675,737,70,60);
  rect(495,737,85,60);
  
  fill(255,255,0);
  font = loadFont("AgencyFB-Reg-60.vlw");
  textFont(font);
  text("Tokens: " + acc.getTokens(),100,790);
  text("Bet: " + acc.getBet(), 600, 790);
  text("Won: " + acc.getWinnings(),400,790);
  drawLever();
}

void drawLever()
{
   pushMatrix();
   if(overLever)
   { 
   yLever += (mouseY-pmouseY);
   if(yLever > 700) 
   {
     yLever = 700;
   }
   }
   if(!overLever)
   {
   yLever = yLever-105;
   if(yLever < 120)
   {
     yLever = 120;
   }
   }
   translate(xLever,yLever);
   fill(175,20,50);
   ellipse(0,0,200,200);
   fill(255,255,0);
   PFont font = loadFont("Aharoni-Bold-24.vlw");
   textFont(font);
   text("Pull Down",-50,0);
   popMatrix();
}

void drawTraps()
{
  pushMatrix();
  translate(450,250);
  fill(80,80,80);
  quad(-385,20,-425,-20,425,-20,385,20);
  popMatrix();
  pushMatrix();
  rotate(-PI/2);
  translate(-552,45);
  fill(120,120,120);
  quad(-282,20,-322,-20,322,-20,282,20);
  popMatrix();
  pushMatrix();
  rotate(PI/2);
  translate(552,-855);
  fill(220,220,220);
  quad(-282,20,-322,-20,322,-20,282,20);
  popMatrix();
  pushMatrix();
  translate(450,855);
  rotate(PI);
  fill(255,255,255);
  quad(-385,20,-425,-20,425,-20,385,20);
  popMatrix();
}


void checkGame()
{
  if(symb[0].getSymbol() == symb[1].getSymbol() && symb[0].getSymbol() == symb[2].getSymbol())
  {
    acc.payWinnings(0,1,2);
  }
  if(symb[3].getSymbol() == symb[4].getSymbol() && symb[3].getSymbol() == symb[5].getSymbol())
  {
    acc.payWinnings(3,4,5);
  }
  if(symb[6].getSymbol() == symb[7].getSymbol() && symb[6].getSymbol() == symb[8].getSymbol())
  {
    acc.payWinnings(6,7,8);
  }
  if(symb[0].getSymbol() == symb[4].getSymbol() && symb[0].getSymbol() == symb[8].getSymbol())
  {
    acc.payWinnings(0,4,8);
  }
  if(symb[6].getSymbol() == symb[4].getSymbol() && symb[6].getSymbol() == symb[2].getSymbol())
  {
    acc.payWinnings(6,4,2);
  }
}

void mousePressed()
{
  float d = sqrt(sq(mouseX-xLever)+sq(mouseY-yLever));
  if(d<=100)
  {
    overLever = true;
  }
  if(mouseX > 920 && mouseX < 1170 && mouseY > 750 && mouseY < 870)
  {
    randomize = false;
    checkGame();
  }
}

void mouseReleased()
{
  overLever = false;
  if(yLever > 500)
  {
    rage[0] = false;
    rage[1] = false;
    rage[2] = false;
    rage[3] = false;
    rage[4] = false;
    rage[5] = false;
    rage[6] = false;
    rage[7] = false;
    rage[8] = false;
  randomize = true;
  first = false;
  acc.setWinnings(0);
  acc.checkBet();
  acc.placeBets();
  }
}


void keyPressed()
{
    if(keyPressed == true)
  {
      if(key == CODED)
      {
        if(keyCode == UP)
        { 
          acc.betUp();
          acc.checkBet();
          canPress = false;
        }
        else if(keyCode == DOWN)
        {
          acc.betDown();
          acc.checkBet();
          canPress = false;
        }
      }
  }
}

void keyReleased()
{
  canPress = true;
}






class Symbol
{
  int symbol = 0;
  
  
  Symbol(int shape)
  {
  this.symbol = shape;
  }
  
 void changeShape(int strokeR,int strokeG,int strokeB,int weight)
{
  stroke(strokeR,strokeG,strokeB);
  strokeWeight(weight);
  
      if(symbol==0)
    {
      fill(255,0,0);
      beginShape();
      vertex(-15,50);
      vertex(-15,30);
      vertex(30,-30);
      vertex(-40,-30);
      vertex(-40,-25);
      vertex(-50,-25);
      vertex(-50,-50);
      vertex(50,-50);
      vertex(50,-20);
      vertex(10,30);
      vertex(10,50);
      endShape(CLOSE);
    }
    else if(symbol==1)
    {
    fill(255,255,0);  
    rect(-50,-50,100,100);
    }
    else if(symbol==2)
    {
    fill(255,0,255);
    triangle(-50,50,0,-50,50,50);
    }
    else if(symbol==3)
    {
      fill(0,0,255);
      beginShape();
      vertex(0,50);
      vertex(-25,0);
      vertex(0,-50);
      vertex(25,0);
      endShape(CLOSE);
    }
    else if(symbol==4)
    {
    fill(0,255,255);
    beginShape();
    vertex(-21,50);
    vertex(-50,21);
    vertex(-50,-21);
    vertex(-21,-50);
    vertex(21,-50);
    vertex(50,-21);
    vertex(50,21);
    vertex(21,50);
    endShape(CLOSE);
    }
    else if(symbol==5)
    {
    fill(0,255,0);
    beginShape();
    vertex(0,5);
    vertex(-50,50);
    vertex(-5,0);
    vertex(-50,-50);
    vertex(0,-5);
    vertex(50,-50);
    vertex(5,0);
    vertex(50,50);
    endShape(CLOSE);  
    }
    else if(symbol==6)
    {
     fill(255,150,150);
     ellipse(-25,0,50,100);
     ellipse(25,0,50,100);
    }
    else if(symbol==7)
    {
    fill(155,0,155);
    ellipse(0,0,100,100);
    }
    else if(symbol==8)
    {
      fill(255,155,80);
      beginShape();
      vertex(0,50);
      vertex(-5,5);
      vertex(-50,0);
      vertex(-5,-5);
      vertex(0,-50);
      vertex(5,-5);
      vertex(50,0);
      vertex(5,5);
      endShape(CLOSE);
    }
} 
 
int getSymbol()
{
  return this.symbol;
}
  
  void randomizeShape()
  {
    symbol = int(random(5));
  }
}






class Account
{
  int bet;
  int tokens;
  int winnings;
  
  Account()
  {
    bet = 1;
    tokens = 100;
    winnings = 0;
  }
  
  void betUp()
  {
    bet++;
  }
  
  void betDown()
  {
    bet--;
  }
  
 void checkBet()
  {
     if(bet < 0)
    {
      bet = 0;
    }
    if(bet > tokens)
    {
      bet = tokens;
    }
  }
  int getBet()
  {
    return this.bet;
  }
  
  int getTokens()
  {
    return this.tokens;
  }
  void setWinnings(int z)
  {
    winnings = z;
  }
  int getWinnings()
  {
    return this.winnings;
  }
  
void payWinnings(int a,int b,int c)
{
  rage[a] = true;
  rage[b] = true;
  rage[c] = true;
  
  if(symb[a].getSymbol() == 0)
  {
    winnings = bet*10;
    tokens += (winnings);
  }
    if(symb[a].getSymbol() == 1)
  {
    winnings = bet*5;
    tokens += (winnings);
  }
    if(symb[a].getSymbol() == 2)
  {
    winnings = bet*4;
    tokens += (winnings);
  }
    if(symb[a].getSymbol() == 3)
  {
    winnings = bet*3;
    tokens += (winnings);
  }
    if(symb[a].getSymbol() == 4)
  {
    winnings = bet*2;
    tokens += (winnings);
  }
    if(symb[a].getSymbol() == 5)
  {
    winnings = bet*1;
    tokens += (winnings);
  }

}
  
 void placeBets()
 {
   tokens -= bet;
 }
}

