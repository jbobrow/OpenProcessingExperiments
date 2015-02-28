
/*
Ani Gubba
*/

boolean gameStart = false;
int count = 0;
boolean gameFinished = false;
PFont font1;
PFont font2;
int h1=1;
int h2=1;
int h3 = 1;
void setup()
{
  size(600, 400);
  //smooth();
  //noCursor();
 // fill(255,0,0);
 font1 = createFont ("Arial", 16, true);
 
 font2 = createFont ("Arial", 32, true);
  
}
void draw()
{
  bars s = new bars();
  if(gameStart){
    if (mouseX > 20 && mouseX <= 185 && mouseY>0 && mouseY <=175) {
      background(0);
      s.display();
      count = 1;
      //textSize(30);
      textFont(font2);
      textSize(32); 
      text("23% of budget",width-240,height-50);
      
      textFont(font1);
      
    }
    else if (mouseX > 330 && mouseX <= 470 && mouseY>20 && mouseY <=140) {
      background(0);
      s.display();
      count =2;
            textFont(font2);
      textSize(32); 
     text("13% of budget",width-240,height-50);
         textFont(font1);
    }
    else if (mouseX > 175 && mouseX <= 375 && mouseY>90 && mouseY <=270) {
      background(0);
      s.display();
      count = 3;
      textFont(font2);
      textSize(32); 
      text("24% of budget",width-240,height-50);
      textFont(font1);
    }
      else  if (mouseX > 30 && mouseX <= 90 && mouseY>220 && mouseY <=280) {
        background(0);
        s.display();
        count = 4;
        textFont(font2);
      textSize(32); 
     text("4% of budget",width-240,height-50);
     textFont(font1);
    }
      else  if (mouseX > 290 && mouseX <= 480 && mouseY>180 && mouseY <=320) {
        background(0);
        s.display();
        count =5 ;
        textFont(font2);
      textSize(32); 
    text("15% of budget",width-240,height-50);
    textFont(font1);
    }
  }
  else{
    background(0); 
        text("Click space to start! Hover each circle to look at percentage of budget.",width-500,height-190);
  }
}

void keyPressed()
{
  gameStart = true;
  
}
class bars{
  float x,y;
  bars (){ }
  void display(){
  
   text("Federal Budget Spending",width-380,height-380);
   
       ellipse(90,80,90,90); 
   text("Military Spending",width-450,height-320);
   
ellipse(400,80,60,60); 
   text("Welfare",width-160,height-320);
   
       ellipse(220,180,95,95); 
   text("Social Security Spending%",width-325,height-210);
   
       ellipse(60,250,20,20); 
   text("Education",width-580,height-120);
   
          ellipse(360,250,68,68); 
   text("Other",width-200,height-150);
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




