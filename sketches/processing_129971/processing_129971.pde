
float spawntimer;
boolean resetTimerOnZero = false;
boolean capTimerMax = true;
int capTimerAmount = 18;
int rolloverAmount = 15;
int emptyQueueAmount = 5;
RectButton buttonL1, buttonL2, buttonM1, buttonM2, buttonH1, buttonH2; 
RectButton buttonCapTimerAmt1, buttonCapTimerAmt2;
RectButton buttonRolloverAmt1, buttonRolloverAmt2;
RectButton buttonEmptyAmt1, buttonEmptyAmt2;
ArrayList deadguys;

boolean locked = false;
//color currentcolor;

int FUNC_X = 40;
int STATE_X = 300;
int AMT_X = 340;
int BUTTON_X = 400;
int BUTTON_SIZE = 12; //even number preferable
boolean buttonReleased = true; //user must release mouse before he can press a button again

int addAmountLight = 3;
int addAmountMedium = 4;
int addAmountHeavy = 6;

void setup()
{
  size(500,200);
  background(0);
  fill(255);
  deadguys = new ArrayList();
 // PFont fontA = loadFont("courier");
  //textFont(fontA, 14); 
  frameRate(30);
  buttonL1 = new RectButton(BUTTON_X,0,BUTTON_SIZE,200,100,true);
  buttonL2 = new RectButton(BUTTON_X+15,0,BUTTON_SIZE,200,100,false);
  buttonM1 = new RectButton(BUTTON_X,0,BUTTON_SIZE,200,100,true);
  buttonM2 = new RectButton(BUTTON_X+15,0,BUTTON_SIZE,200,100,false);
  buttonH1 = new RectButton(BUTTON_X,0,BUTTON_SIZE,200,100,true);
  buttonH2 = new RectButton(BUTTON_X+15,0,BUTTON_SIZE,200,100,false);
  
  buttonCapTimerAmt1 = new RectButton(BUTTON_X,0,BUTTON_SIZE,200,100,true);
  buttonCapTimerAmt2 = new RectButton(BUTTON_X+15,0,BUTTON_SIZE,200,100,false);
  
  buttonRolloverAmt1 = new RectButton(BUTTON_X,0,BUTTON_SIZE,200,100,true);
  buttonRolloverAmt2 = new RectButton(BUTTON_X+15,0,BUTTON_SIZE,200,100,false);
  
  buttonEmptyAmt1 = new RectButton(BUTTON_X,0,BUTTON_SIZE,200,100,true);
  buttonEmptyAmt2 = new RectButton(BUTTON_X+15,0,BUTTON_SIZE,200,100,false);
}
 
void draw(){ 
  int y = 1;
  int yinc = 15;
  int buttonYoffset = 12;
  color colvalue = color(0,255,0);
  color coltext = color(150,180,255);
 // textSize(11);
  
  
  background(0);
  fill(coltext);  text("spawn timer:",20,y*yinc);  fill(colvalue);  text(nf(spawntimer,1,1),120,y*yinc);  fill(coltext);
  y++;  fill(225); text("functionality",FUNC_X,y*yinc); text("state",STATE_X,y*yinc); text("seconds",340,y*yinc); fill(coltext);
  stroke(255);line(FUNC_X, y*yinc + 2, 420, y*yinc + 2);
  y++;  text("press 1 to add a light class to queue",FUNC_X,y*yinc);  fill(colvalue);    text(addAmountLight,AMT_X,y*yinc); fill(coltext);
        buttonL1.SetY(y*yinc - buttonYoffset); buttonL2.SetY(y*yinc - buttonYoffset);
  y++;  text("press 2 to add a medium class to queue",FUNC_X,y*yinc);  fill(colvalue);   text(addAmountMedium,AMT_X,y*yinc); fill(coltext);
        buttonM1.SetY(y*yinc - buttonYoffset); buttonM2.SetY(y*yinc - buttonYoffset);
  y++;  text("press 3 to add a heavy class to queue",FUNC_X,y*yinc);  fill(colvalue);    text(addAmountHeavy,AMT_X,y*yinc); fill(coltext);
        buttonH1.SetY(y*yinc - buttonYoffset); buttonH2.SetY(y*yinc - buttonYoffset);
  y++;  text("press 4 to reset the timer",FUNC_X,y*yinc);
  y++;  text("press R to toggle empty queue rollover on zero",FUNC_X,y*yinc); fill(colvalue);  text(str(resetTimerOnZero),STATE_X,y*yinc); text(rolloverAmount,AMT_X,y*yinc); fill(coltext);
         buttonRolloverAmt1.SetY(y*yinc - buttonYoffset); buttonRolloverAmt2.SetY(y*yinc - buttonYoffset);
  y++;  text("press C to toggle spawn timer cap",FUNC_X,y*yinc); fill(colvalue); text(str(capTimerMax),STATE_X,y*yinc);  text(capTimerAmount,AMT_X,y*yinc); fill(coltext);
         buttonCapTimerAmt1.SetY(y*yinc - buttonYoffset); buttonCapTimerAmt2.SetY(y*yinc - buttonYoffset);
  y++;  text("when queue is empty, timer stops at: (0 = off)",FUNC_X,y*yinc); fill(colvalue);   text(emptyQueueAmount,AMT_X,y*yinc); fill(coltext);
         buttonEmptyAmt1.SetY(y*yinc - buttonYoffset); buttonEmptyAmt2.SetY(y*yinc - buttonYoffset);
  y+=4;  text("J: Dystopia 1.3 defaults -- K: Dystopia 1.4 defaults -- L: ShooterGame defaults",FUNC_X,y*yinc); fill(coltext);
 
 for (int i = deadguys.size()-1; i >= 0; i--) {
    int deadnum = deadguys.get(i);
    String classtype = "";
    if(deadnum == 1) {classtype = "L"; fill(200,70,40);}
    if(deadnum == 2) {classtype = "M"; fill(230,50,25);}
    if(deadnum == 3) {classtype = "H"; fill(255,0,0);}
    text(classtype, 20 + i*15, 150);
  }
     
  spawntimer -= 0.0333333;
   
  if(spawntimer <= 0 )
  {
    if( resetTimerOnZero )
      spawntimer = rolloverAmount;
    else
      spawntimer = 0;
       
    for (int i = deadguys.size()-1; i >= 0; i--) {
      deadguys.remove(i);
      spawntimer = rolloverAmount;
    }
      
    if(spawntimer > capTimerAmount)
      spawntimer = capTimerAmount;
  }
  
  if( emptyQueueAmount > 0 && deadguys.size() <= 0 && spawntimer <= emptyQueueAmount )
    spawntimer = emptyQueueAmount;
  
  buttonupdates(mouseX,mouseY);
}

void buttonupdates(int x, int y)
{
  buttonCapTimerAmt1.display();
  buttonCapTimerAmt2.display();
  buttonRolloverAmt1.display();
  buttonRolloverAmt2.display();
  buttonEmptyAmt1.display();
  buttonEmptyAmt2.display();
  buttonL1.display();
  buttonL2.display();
  buttonM1.display();
  buttonM2.display();
  buttonH1.display();
  buttonH2.display();
  
  if(locked == false) {
    buttonCapTimerAmt1.update();
    buttonCapTimerAmt2.update();
    buttonRolloverAmt1.update();
    buttonRolloverAmt2.update();
    buttonEmptyAmt1.update();
    buttonEmptyAmt2.update();
    buttonL1.update();
    buttonL2.update();
    buttonM1.update();
    buttonM2.update();
    buttonH1.update();
    buttonH2.update();
  } 
  else {
    locked = false;
  }

  if(mousePressed && buttonReleased) {
    buttonReleased = false;
    if(buttonCapTimerAmt1.pressed())
      capTimerAmount++;
    else if(buttonCapTimerAmt2.pressed())
      capTimerAmount--;
    else if(buttonRolloverAmt1.pressed())
      rolloverAmount++;
    else if(buttonRolloverAmt2.pressed())
      rolloverAmount--;
    else if(buttonEmptyAmt1.pressed())
      emptyQueueAmount++;
    else if(buttonEmptyAmt2.pressed())
      emptyQueueAmount--;
    else if(buttonL1.pressed())
      addAmountLight++;
    else if(buttonL2.pressed())
      addAmountLight--;
    else if(buttonM1.pressed())
      addAmountMedium++;
    else if(buttonM2.pressed())
      addAmountMedium--;
    else if(buttonH1.pressed())
      addAmountHeavy++;
    else if(buttonH2.pressed())
      addAmountHeavy--;
  }
  
}

void mouseReleased()
{
  buttonReleased = true;
}
 
void keyPressed() {
    if (key == '1') {
      spawntimer += addAmountLight;
      deadguys.add(1);
    } else if (key == '2') {
      spawntimer += addAmountMedium;
      deadguys.add(2);
    } else if (key == '3') {
      spawntimer += addAmountHeavy;
      deadguys.add(3);
    } else if (key == '4') {
      spawntimer = 0.0;
      for (int i = deadguys.size()-1; i >= 0; i--) {
        deadguys.remove(i);
      }
    }else if (key == 'r' || key == 'R' ) {
      resetTimerOnZero = !resetTimerOnZero;
    }else if (key == 'c' || key == 'C' ) {
      capTimerMax = !capTimerMax;
    }else if (key == '=' || key == '+' ) {
      capTimerAmount++;
    }else if (key == '-' || key == '_' ) {
      capTimerAmount--;
    }else if (key == 'j' || key == 'J' ) {
      load13defaults();
    }else if (key == 'k' || key == 'K' ) {
      load14defaults();
    }else if (key == 'l' || key == 'L' ) {
      loadSGdefaults();
    }
    
    if( spawntimer > capTimerAmount && capTimerMax )
    {
      spawntimer = capTimerAmount;
    }
   
}

void load13defaults(){
  addAmountLight = 3;
  addAmountMedium = 4;
  addAmountHeavy = 6;
  resetTimerOnZero = true;
  capTimerMax = false;
  capTimerAmount = 18;
  rolloverAmount = 15;
  emptyQueueAmount = 0;
}

void load14defaults(){
  addAmountLight = 3;
  addAmountMedium = 4;
  addAmountHeavy = 6;
  resetTimerOnZero = false;
  capTimerMax = true;
  capTimerAmount = 18;
  rolloverAmount = 15;
  emptyQueueAmount = 5;
}

void loadSGdefaults(){
  addAmountLight = 0;
  addAmountMedium = 0;
  addAmountHeavy = 0;
  resetTimerOnZero = true;
  capTimerMax = false;
  capTimerAmount = 18;
  rolloverAmount = 15;
  emptyQueueAmount = 0;
}

class RectButton
{
  
  int x, y;
  int size;
  color basecolor, highlightcolor;
  color currentcolor;
  boolean over = false;
  boolean pressed = false;   
  boolean add = true;
  
  RectButton(int ix, int iy, int isize, color icolor, color ihighlight, boolean iadd) 
  {
    x = ix;
    y = iy;
    size = isize;
    basecolor = icolor;
    highlightcolor = ihighlight;
    currentcolor = basecolor;
    add = iadd;
  }
  
  
    boolean overRect(int x, int y, int width, int height) 
  {
    if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
      return true;
    } 
    else {
      return false;
    }
  }

  boolean overit() 
  {
    if( overRect(x, y, size, size) ) {
      over = true;
      return true;
    } 
    else {
      over = false;
      return false;
    }
  }

  void update() 
  {
    if(overit()) {
      currentcolor = highlightcolor;
    } 
    else {
      currentcolor = basecolor;
    }
  }
  
  void SetY(int yy)
  {
    y = yy;
  }

  boolean pressed() 
  {
    if(over) {
      locked = true;
      return true;
    } 
    else {
      locked = false;
      return false;
    }    
  }



  void display() 
  {
    stroke(255);
    fill(currentcolor);
    rect(x, y, size, size);
    
    stroke(0);
    int p = 4; //padding
    if(add)
    {
      line(x+p, y+size/2, x+size-p, y+size/2);
      line(x+size/2, y+p, x+size/2, y+size-p);
    }
    else
      line(x+p, y+size/2, x+size-p, y+size/2);
  }
}
