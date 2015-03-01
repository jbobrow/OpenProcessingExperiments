
int state= 0;
int AStar= 1;
int BTree= 2;
int CMoon= 3;
int DFish= 4;
int ESail= 5;
int FCream= 6;
int GSun= 7;
int r = int(random(0, 255));
int g = int(random(0, 255));
int b = int(random(0, 255));

Point points;
Timer timer; 

void setup() {
  background (150);
  smooth();
  size(400, 400);
  

  points = new Point();

  timer = new Timer(5000);
  timer.start();
  
  
  }
  
  void draw() {

    stroke (r);
  strokeWeight(5);
    PFont font;
font = loadFont("AGOldFace-Regular-48.vlw");
textFont(font, 30);
text("Connect the dots!", 20, 50);
  
    
  stroke(0,0,0);
  strokeWeight(10);

 //draws the line
  if(mousePressed) {
     stroke(r, g, b);
    smooth();
    strokeWeight(3);
    line(mouseX, mouseY, pmouseX, pmouseY);}

//states
if (state==AStar){
  points.star();
}
if (state==BTree){
  points.tree();
}
if (state==CMoon){
points.moon();
}
if (state==DFish){
  points.fish();
}
if (state==ESail){
  points.sail();
}
if (state==FCream){
  points.cream();
}
if (state==GSun){
  points.sun();
}
  
  //check timer
  if (timer.isFinished()){
    background (255);
    println( " 5 seconds have passed! " );
    //if seconds have passed this state will show up
    //now need to randomize states
    //wont go up to three, starts at 0
    int dots = int (random(7));
    if (dots == 0){
      state = AStar;
      //points.star();
    }else if (dots == 1){
      state= BTree;
      //points.tree();
    }else if (dots == 2){
     state= CMoon;
     //points.moon();
    }else if (dots == 3){
      state = DFish;
      //points.fish();
    }else if (dots == 4){
      state = ESail;
     // points.sail();
    }else if (dots == 5){
      state = FCream;
     }else if (dots == 6){
      state = GSun;
    }
    

    timer = new Timer(5000);
    timer.start();
    
  }
  }
class Point{ 
  
  void star(){ 
    
point(200,20);
point(250,100);
point(350,130);
point(270, 180);
point(300, 280); 
point(200, 230);
point(100, 280);
point(130, 180);
point(50, 130);
point(150, 100);

  }
  void tree(){
  point(200,30);
point(245,90);
point(220,85);
point(300, 180);
point(250, 170); 
point(350, 280);
point(230, 280);
point(230, 350);
point(170, 350);
point(170, 280);
point(50, 280);
point(150, 170);
point(100, 180);
point(180,85);
point(155,90);
  }
  
  void moon(){
    point(80,50);
point (180,60);
point(270,130);
point(310, 260);
point(220, 370); 
point(90, 360);
point(40, 290);
point(140, 300);
point(200, 240);
point(180, 130);
  }
  
  void fish(){
  point(20,200);
point(60,150);
point(130,130);
point(200, 150);
point(250, 180); 
point(350, 130);
point(350, 290);
point(250, 240);
point(200, 270);
point(130, 290);
point(60, 260);
point(90, 180);
  }

void sail(){
  point(50,250);
point(90,300);
point(160,340);
point(230, 340);
point(300, 300); 
point(350, 250);
point(250, 250);
point(150, 250);
point(200, 250);
point(200, 150);
point(200, 50);
point(300, 150);
}

void cream(){
  point(200,380);
point(220,330);
point(180,330);
point(250, 250);
point(150, 250); 
point(200, 250);
point(200, 140);
point(230, 145);
point(170, 145);
point(135, 170);
point(265, 170);
point(265, 210);
point(135, 210);
point(200, 40);
point(230, 55);
point(170, 55);
point(245, 90);
point(155, 90);
point(173, 115);
point(225, 115);
}

void sun(){
  point(200,140);
point(240,150);
point(255,185);
point(240, 225);
point(200, 235); 
point(160, 225);
point(145, 185);
point(160, 150);
point(200, 30);
point(230, 100);
point(295, 70);
point(300, 160);
point(375, 210);
point(280, 260);
point(250, 350);
point(190, 290);
point(110, 335);
point(80, 250);
point(15, 210);
point(60, 155);
point(60, 60);
point(135, 80);
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
    savedTime = millis(); 
  }
  
  
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


