
float femembar;
float maleempbar;
float femdegbar;
float maledegbar;

PFont f;

String message3 = "190s";
String message4 = "1960s";
String message5 = "1970s";
String message6 = "1980s";
String message7 = "1990s";
String message8 = "2000s";
String message9 = "2010s";
int timer;
int currentIndex = 0;
Ant my_ant = new Ant(20, 250);

void setup(){
  size (720,320);
  f = createFont("Arial",20,true);
  smooth();

  frameRate(55);
  
}

void draw(){
  background(0);
   
 my_ant.drawAnt(); 
  my_ant.moveAnt(); 

  fill(255);
  rect (0,height/1.7, width, 30);  
rect ( 0, height/1.1, width, 30);
fill(255);
textFont(f);
text(" Female vs. Male: In the workplace & with a degree (U.S.A.)", 40,20);
text("Working  ", 310, 70);
text("Working with a degree (%)", 310, 140);
fill(150,45,600);
text("The diverse, purple worker-ant moves onward to progress and equality!Yay!", 1, 310);



fill(255);
rect (580,60, 120,100);

fill(0);
text("legend:", 600,80);
text("Female", 625, 102);
text("Male", 625, 128);

fill(400,70,740);
rect(600,90,20,15);
fill(35,35,255);
rect(600,116,20,15);
////////////////////////////////////////////////////////////////////////////////////////////
//working bar female
fill(400,70,740);
rect (40,50, femembar, 12);
noStroke();

  femembar+=.32;
if (femembar>190) {
  femembar =190;}

//working bar male
fill(35,35,255);
rect(40,65, maleempbar, 12);
noStroke();
maleempbar+=.40;
if (maleempbar >207){
  maleempbar =207;
}
// female degree bar
  fill(400,70,740);
  noStroke();
  rect(40, 120, femdegbar, 12);
  femdegbar+=.32;
  if (femdegbar>150) {
    femdegbar=150;
  }
  //male degree bar
  fill(35,35,255);
  rect(40, 135, maledegbar, 12);
  noStroke();
  maledegbar+=.35;
  if ( maledegbar> 160) {
    maledegbar=160;
  }

//////////////////////////////////////////////////////////////////////////////////////////////////////////
  timer++;

  fill(255,0,0);
  
  
  
 int i= 0;///try to make into a loop---really repetitive and inefficient
    
  if (timer > i){ i =0;}
    if( timer <= i ){text(message3= message3, width/2, height/1.5);
  }
    else if(timer <= i +200) {text(message3 = message4, width/2, height/1.5);
  }
    else if(timer <= i+ 400) {text (message3 = message5,width/2, height/1.5);
  }
    else if (timer <=i +600) {text (message3 = message6, width/2 ,height/1.5);
  }
   else if(timer <= i +800) {text (message3= message7, width/2, height/1.5);
  }
  else if (timer <= i +1000) {text (message3= message8, width/2, height/1.5);
  }
  else if (timer >= i+1000) {text (message3= message9, width/2, height/1.5);
}
}
   
  
  
  


  

class Ant {

  int ant_x;
  int ant_y;
  int ant_x_speed = 1; 
 
  Ant(int _x, int _y) {   
    ant_x = _x;
    ant_y = _y;
  }
    void moveAnt() { 
    ant_x += ant_x_speed; 
     
    if (ant_x > width) {
      ant_x = 0;
      fill(35,35,255);
    }
  }
  
  void drawAnt() {
    //legs
 fill(150,45,600);
    line(ant_x, ant_y, ant_x - 10, ant_y - 10);
    line(ant_x, ant_y, ant_x + 10, ant_y - 10);
  line(ant_x, ant_y, ant_x, ant_y - 12);
    line(ant_x, ant_y, ant_x - 10, ant_y + 10);
    line(ant_x, ant_y, ant_x, ant_y + 12);
    line(ant_x, ant_y, ant_x + 10, ant_y + 10);
    // antenna
  
    line(ant_x+10, ant_y, ant_x + 17, ant_y-4);
    line(ant_x+10, ant_y, ant_x + 17, ant_y+4);
    //
    ellipse(ant_x, ant_y, 15, 10);// body
    ellipse(ant_x + 10, ant_y, 8, 8); // head
  }}
  
  
  
  





