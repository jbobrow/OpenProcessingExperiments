
//Rainbow test;
Rainbow[] heroes = new Rainbow[7]; 
People[] pedestrians = new People[50];
//People testPerson;
int unit = 15;
String[] quote = new String[50];

void setup() {

  quote[  0  ]=  "Sick  ";
  quote[  1  ]=  "Friends are sick  ";
  quote[  2  ]=  "What's happening to us?  ";
  quote[  3  ]=  "GRID?  ";
  quote[  4  ]=  "Gay cancer?  ";
  quote[  5  ]=  "Alone?  ";
  quote[  6  ]=  "Is God punishing us?  ";
  quote[  7  ]=  "…  ";
  quote[  8  ]=  "Where are our heroes  ";
  quote[  9  ]=  "Family?  ";
  quote[  10  ]=  "Autoimmuno..?  ";
  quote[  11  ]=  "Will he be ok?  ";
  quote[  12  ]=  "Will I be ok?  ";
  quote[  13  ]=  "Please don't leave  ";
  quote[  14  ]=  "Help  ";
  quote[  15  ]=  "No cure  ";
  quote[  16  ]=  "Shame  ";
  quote[  17  ]=  "Plague  ";
  quote[  18  ]=  "Wasting  ";
  quote[  19  ]=  "No parents  ";
  quote[  20  ]=  "Silence  ";
  quote[  21  ]=  "Now they know  ";
  quote[  22  ]=  "Just one more day  ";
  quote[  23  ]=  "Condoms?  ";
  quote[  24  ]=  "Sex scares me  ";
  quote[  25  ]=  "Tell my friends  ";
  quote[  26  ]=  "Silence is death  ";
  quote[  27  ]=  "What do I do?  ";
  quote[  28  ]=  "Remember  ";
  quote[  29  ]=  "Farewell party  ";
  quote[  30  ]=  "Better on my own terms  ";
  quote[  31  ]=  "Who will watch after me  ";
  quote[  32  ]=  "I can't visit  ";
  quote[  33  ]=  "Hospital again  ";
  quote[  34  ]=  "Vigils  ";
  quote[  35  ]=  "Reagan doesn't care  ";
  quote[  36  ]=  "Streets are quiet  ";
  quote[  37  ]=  "35 year old with walker  ";
  quote[  38  ]=  "Stay with me  ";
  quote[  39  ]=  "Everyone is gone  ";
  quote[  40  ]=  "AZT  ";
  quote[  41  ]=  "Scared  ";
  quote[  42  ]=  "Wiped out  ";
  quote[  43  ]=  "So thin  ";
  quote[  44  ]=  "Weak  ";
  quote[  45  ]=  "Hospice  ";
  quote[  46  ]=  "We have to fight  ";
  quote[  47  ]=  "Outrage  ";
  quote[  48  ]=  "Act up  ";
  quote[  49  ]=  "Retroviral  ";
  noStroke();
  rectMode(CENTER);
  //test = new Rainbow(1);
  //testPerson = new People(1);
  size(100*unit, 70*unit);
  frameRate(15);

  for (int i=0; i<heroes.length;i++)
  {
    heroes[i] = new Rainbow(i);
  }
  for (int i=0; i<pedestrians.length;i++)
  {
    pedestrians[i] = new People(i);
  }
}

void draw() {
  background(0);
  for (int i=0; i<heroes.length;i++)
  {
    heroes[i].display();
    heroes[i].move();
    //testPerson.move();
    //testPerson.checkSaving(heroes[i]);
  }
  int scaling = int( millis() /1000);
  if (scaling > pedestrians.length) {
    scaling = pedestrians.length;
  }
//  for (int i=0; i<pedestrians.length;i++)
for (int i=0; i<scaling;i++)
  {
    pedestrians[i].display();
    pedestrians[i].move();
    for (int k=0; k<heroes.length;k++) {
      pedestrians[i].checkSaving(heroes[k]);
    }
    pedestrians[i].reset();
  }
  //test.display();
  //test.move();
  //testPerson.display();
}

class People {
  boolean visible;
  int type;
  int xpos;
  int ypos;
  int speed;
  color myColor;
  String banner;
  String thanks;
  String goodbye;
  String whatShouldISay;




  People(int i) {
    banner = quote[i];
    thanks = "Thank you";
    goodbye = "Goodbye";
    speed = int(random(10));
    xpos = int(random(unit*100));
    ypos = -100;
    type = int(random(5));
    visible = true;
    myColor = color(255, 255, 255);
    whatShouldISay = banner;
  }

  void display()
  {
    fill(myColor);
    if (visible) {
      if (ypos < height-unit*19) {
        text(banner, xpos+unit, ypos-unit);
      }
      else if (ypos > height-unit*19) {
        text(goodbye, xpos+unit, ypos-unit);
      }
    }
    else if (!visible) {
      text(thanks, xpos+unit, ypos-unit);
    }
    rect(xpos, ypos, unit/3, unit/3);
    rect(xpos+unit/3, ypos, unit/3, unit/3);
    rect(xpos, ypos+unit/3, unit/3, unit/3);
    rect(xpos, ypos-unit/3, unit/3, unit/3);
    rect(xpos-unit/3, ypos, unit/3, unit/3);
  }
  void move() {
    ypos = ypos+speed;
  }
  void reset()
  {
    if (ypos > height)
    {
      visible = true;
      speed +=5;
      ypos = - 100;
      myColor = color(255,255,255);
      
    }
  }
  void checkSaving(Rainbow r)
  {
    if (dist(xpos, ypos, r.currentXA, height-unit*19)<unit ||dist(xpos, ypos, r.currentXB, height-unit*19)<unit)
      //    if (ypos == height-unit*19) { 
      //      if (abs(r.currentXA-xpos) <unit  || abs(r.currentXB-xpos) <unit)
    {
      myColor = r.c;
      visible = false;
    }
    //    }
  }
}

class Rainbow {

  int i;
  int step;
  int posChange;
  int ypos;
  color c;
  int[] tail = new int[20];  
  int[] tailB = new int[20];
  int currentXA;
  int currentXB;
  
  color[] myColor = new color[7];

  Rainbow(int a)
  {
    myColor[0] = color(255,0,0);
    myColor[1] = color(255,200,0);
    myColor[2] = color(255,255,0);
    myColor[3] = color(0,255,0);
    myColor[4] = color(0,0,255);
    myColor[5] = color(75,0,130);
    myColor[6] = color(128,0,128);
    
    
    ypos = 3*height/4;
    i = a;
    c = myColor[a];
    step = a*unit;
    posChange = 0;
    for (int k = 0; k<tail.length;k++) {
      tail[k]=0;
      tailB[k]=0;
    }
  }

  void display() {

    fill(c, 255);
    //println("the width is "+width+ "and xposA is"+xposA);
    int xstartA =width/2+i*unit;
    int xstartB =width/2-unit*(i+1);  

    for (int i = 0; i < tail.length-1; i ++ ) {
      tail[i]= tail[i+1];
      tailB[i]=tailB[i+1];
    }
    //this is the one in the lead, the current position
    tail[tail.length-1] = xstartA+posChange;
    tailB[tailB.length-1] = xstartB-posChange; 

    for (int i = 0; i< tail.length; i++) {
      if (i==tail.length-1) {
        fill(c, 255);
      }
      else fill(c, i*5);
      rect(tail[i], height-unit*i, unit, unit);
      rect(tailB[i], height-unit*i, unit, unit);
    }

    fill(c, 255);
    currentXA = xstartA+posChange;
    currentXB = xstartB-posChange;


    println("Current xA is "+currentXA+" and currentXB is "+currentXB);
  }

  void move() {
    if (mousePressed) {
      posChange += step;
    }
    else if (posChange >0) {
      posChange-=step;
    }
  }
}


