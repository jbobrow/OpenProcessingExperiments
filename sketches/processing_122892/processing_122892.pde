
PImage img;
Mole[] moles;
int totalMoles=0;
Hammer hammer;
Timer timer;
int counter=0;


void setup() { 
  hammer = new Hammer(30);
  size(1300,851);
  img = loadImage("grass background copy.jpg");
  moles = new Mole[5000];
  timer = new Timer(1500);
  timer.start();
}

void draw () {
  background(img);
  
  
  fill(0);
  stroke(0);
  ellipse(216,300,120,90);
  ellipse(256,700,120,90);
  ellipse(311,500,120,90);
  ellipse(489,380,120,90);
  ellipse(718,253,120,90);
  ellipse(539,622,120,90);
  ellipse(708,455,120,90);
  ellipse(897,721,120,90);
  ellipse(1070,493,120,90);
  ellipse(1158,719,120,90);
  ellipse(908,362,120,90);
  ellipse(662,760,120,90);
  ellipse(1151,261,120,90);
  ellipse(876,576,120,90);
  ellipse(82,578,120,90); 

  textSize(85);
  strokeWeight(5);
  fill(200,20,0);
  text("Whack-A-Mole",width/2-300,100);
  textSize(50);
  text("Moles Whacked : "+ counter, width/2-200,155);
  fill(200,20,0);
  


  if (timer.isFinished()) {
    // Deal with raindrops
    // Initialize one drop
    moles[totalMoles] = new Mole();
    // Increment totalDrops
    totalMoles ++ ;  
  moles[totalMoles] = new Mole();
  totalMoles++;
  timer.start();

  }
  
  for (int i = 1; i < totalMoles; i++) {
  moles[i].display();
  if (hammer.intersect(moles[i])) {
    if (mousePressed == true) {
      moles[i].whacked();
  }}
    hammer.setLocation(mouseX,mouseY);
  hammer.display();
  }
  if (counter==15) {
    textSize(90);
    fill(random(0,255),random(0,255),random(0,255));
    text("Keep it up!",width/3,height/2);}
  if (counter==30) {
    textSize(90);
    fill(random(0,255),random(0,255),random(0,255));
    text("Way to Go!",width/3,height/2);
    text("Keep whackin' it!!!",width/4,height/2+100);
  }
    if (counter==50) {
    textSize(90);
    fill(random(0,255),random(0,255),random(0,255));
    text("WOW!",width/2-50,height/2);
    textSize(60);
    text("You're a Whacking Machine!",400,height/2+100);
  }
  println(counter);
}

class Hammer {
  float r;
  color col;
  float x,y;
  
  Hammer(float tempR) {
    r = tempR;
    col = color(165);
    x = 0;
    y = 0;
  }
  
  void setLocation(float tempX, float tempY) {
    x = tempX;
    y = tempY;
  }
  
  void display() {
    stroke(0);
    fill(col);
    rectMode(CENTER);
    rect(x,y,r*2,r*3.5);
    fill(85,43,4);
    rect(x+r*2+15,y,110,30);
  }
  boolean intersect(Mole m) {
    float distance = dist(x,y,m.x,m.y);
    if (distance < r*2) {
      return true;
    } else { 
      return false;
    }
  }
}
 
int moletime;
class Mole {
  float x,y;
  color c;
  float r;
  
  Mole () {
    r=15;
    c = color(152,105,60);
    int[] xpos = {216,256,311,489,718,539,708,897,1070,1158,908,662,1151,876,82};
    int indexX=int(random(xpos.length));
    x=(xpos[indexX]);
  
if (x==216) {
    y=290;
}if (x==256) {
    y=690;
}if (x==311) {
    y=490;
}if (x==489) {
    y=370;
}if (x==718) {
    y=243;
}if (x==539) {
    y=612;
}if (x==708) {
    y=445;
}if (x==897) {
    y=711;
}if (x==1070) {
    y=483;
}if (x==1158) {
    y=709;
}if (x==908) {
    y=352;
}if (x==662) {
    y=750;
}if (x==1151) {
    y=251;
}if (x==876) {
    y=566;
}if (x==82) {
    y=568;
}
} 

  void display() { 

    fill(c);
    fill(152,105,60);
    strokeWeight(0);
    rectMode(CENTER);
    rect(x,y, 70, 90);
    
    fill(255);
    ellipse(x-16,y-20,30,45);
    ellipse(x+16,y-20,30,45);
    fill(0);
    ellipse(x-16,y-14,25,25);
    ellipse(x+16,y-14,25,25);
    strokeWeight(2);
    stroke(0);
    line(x-12,y+16,x+12,y+16);
    moletime++;
    if (moletime == 500) {
      x=-2000;
      y=-2000;
      moletime = 0;
    }

}
  void whacked() {
    x=-2000;
    y=-2000;
    counter++;
  }
}
    



class Timer {
 
  int savedTime; // When Timer started
  int totalTime; // How long Timer should last
  
  Timer(int tempTotalTime) {
    totalTime = tempTotalTime;
  }
  
  // Starting the timer
  void start() {
    // When the timer starts it stores the current time in milliseconds.
    savedTime = millis(); 
  }
  
  // The function isFinished() returns true if "totalTime" has passed. 
  // The work of the timer is farmed out to this method.
  boolean isFinished() { 
    // Check how much time has passed
    int passedTime = millis()- savedTime;
    if (passedTime > totalTime) {
      return true;
    } else {
      return false;
    }

  }
}



