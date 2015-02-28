
/*
Ani Gubba
*/

boolean gameStart = false;
int count = 0;
boolean gameFinished = false;
int h1=1;
int h2=1;
int h3 = 1;
void setup()
{
  size(600, 400);
  smooth();
 // noCursor();
}
void draw()
{
  bars s = new bars(10,20,35);
  if(gameStart){
    if (mouseX > 0 && mouseX <= 100) {
      background(0);
      count = 1;
      s.display();
      text("2000-(First bar: 3.8%) (Second bar: 4%) (Third bar: 2.4%)",width-480,height-90);
      
    }
    else if (mouseX > 100 && mouseX <= 200) {
      background(0);
      count =2;
      s.display();
     text("2002-(First bar: 4.4%) (Second bar: 5.9%) (Third bar: 4.1%)",width-470,height-90);
    }
    else if (mouseX > 200 && mouseX <= 300) {
      background(0);
      count = 3;
      s.display();
      text("2004-(First bar: 4.2%) (Second bar: 5.7%) (Third bar: 3.9%)",width-460,height-90);
    }
      else  if (mouseX > 300 && mouseX <= 400) {
        background(0);
        count = 4;
        s.display();
      text("2006-(First bar: 3.9%) (Second bar: 5%) (Third bar: 3%)",width-450,height-90);
    }
      else  if (mouseX > 400 && mouseX <= 500) {
        background(0);
        count =5 ;
        s.display();
      text("2008-(First bar: 3.2%) (Second bar: 4.9%) (Third bar: 3.1%)",width-440,height-90);
    }
      else  if (mouseX > 500 && mouseX <= 600) {
        background(0);
        count  = 6;
        s.display();
      text("2010-(First bar: 8%) (Second bar: 9.9%) (Third bar: 7.2%)",width-430,height-90);
    }
  }
  else{
    background(0); 
        text("Press Space to Start!",width-300,height-190);
  }
}

void keyPressed()
{
  gameStart = true;
  
}

class bars{
  float x,y;
  bars (int barh1, int barh2, int barh3){
    h1=barh1;
    h2=barh2;
    h3=barh3;
  }
  void display(){
  //2000
   text("Maryland unemployment - National unemployment - Virginia unemployment",width-500,height-30);
   text("Maryland and Virginia Unemployment Versus the US Unemployment Rate",width-480,height-350);
    if(count == 1){
      rect(50,250,500,2);     //add some text at top of each bar (number value)
    rect(250, 212, 30, 38); //unemployment MD - 3.8%
    rect(285, 210, 30, 40);//unemployment Natl - 
    rect(320, 226, 30, 24);
  }
      if(count == 2){
      rect(50,250,500,2);     //add some text at top of each bar (number value)
    rect(250, 206, 30, 44); //4.4%
    rect(285, 191, 30, 59);
    rect(320, 209, 30, 41);
  }
      if(count == 3){
      rect(50,250,500,2);     //add some text at top of each bar (number value)
    rect(250, 208, 30, 42);//4.2%
    rect(285, 193, 30, 57);
    rect(320, 211, 30, 39);
  }
      if(count ==4){
      rect(50,250,500,2);     //add some text at top of each bar (number value)
    rect(250, 211, 30, 39);//3.9%
    rect(285, 200, 30, 50);
    rect(320, 220, 30, 30);
  }
      if(count == 5){
      rect(50,250,500,2);     //add some text at top of each bar (number value)
    rect(250, 218, 30, 32);//3.2%
    rect(285, 201, 30, 49);
    rect(320, 219, 30, 31);
  }
      if(count == 6){
      rect(50,250,500,2);     //add some text at top of each bar (number value)
    rect(250, 170, 30, 80);//8%
    rect(285, 151, 30, 99);
    rect(320, 178, 30, 72);
  }
  }
  
  
}

void mousePressed(){
background(0);
}

  
  void display()
  {
    stroke(0);
    fill(200);
  }



