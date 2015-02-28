
//class  
Lane laneline1, laneline2, laneline3, laneline4, laneline5;

//global
  int blck = 0;
  int white = 250;
  int HEIGHT = 200;
  int lanelineR = mouseY;
  int lanelineG = 0;
  int lanelineB = mouseY;
    //shadow variables
  int shadowX = 100;
  int shadowY = 65;
  int shadowDIAM = 145;
  int shadowR = 93;
  int shadowG = 69;
  int shadowB = 19;
  //ball variables
  int ballX = 100;
  int ballSTROKE = 2;
  int ballY = 20;
  int ballDIAM = 150;
    //hole variables
 int holeYA = 60;
  int holeYB = 80;
 int holeDIAM = 15;
  int hole1 = 80;
  int hole2 = 100;
  int hole3 = 120;
  int holeSTROKE = 4;
  

void setup() {
  //setup
  size(200,300);
  smooth();
  
  laneline1 = new Lane(20,0,20,300);
  laneline2 = new Lane(60,0,60,300);
  laneline3 = new Lane(100,0,100,300);
  laneline4 = new Lane(140,0,140,300);
  laneline5 = new Lane(180,0,180,300);
  
}
 
void draw(){
  //lane
  background(lanelineR,lanelineG,lanelineB);
  noStroke();
  laneline1.display();
  laneline2.display();
  laneline3.display();
  laneline4.display();
  laneline5.display();
}


class Lane{
  // fields
  int x;
  int y;
  int HEIGHT;
  //lane variables
  int lanelineR = mouseY;
  int lanelineG = 0;
  int lanelineB = mouseY;
  int lanelineY = 0;
  int laneline1_X = 20;
  int laneline2_X = 60;
  int laneline3_X = 100;
  int laneline4_X = 140;
  int laneline5_X = 180;
  
  //constructor
  Lane(int tempX, int tempY, int tempX2, int tempHEIGHT){
    x = tempX;
    x = tempX2;
    y = tempY;
    HEIGHT = tempHEIGHT;
  }

  //methods
  //method
  void display() {
    stroke(RGB,mouseX,mouseY);
    line(laneline1_X,lanelineY,laneline1_X,HEIGHT);
    line(laneline2_X,lanelineY,laneline2_X,HEIGHT);
    line(laneline3_X,lanelineY,laneline3_X,HEIGHT);
    line(laneline4_X,lanelineY,laneline4_X,HEIGHT);
    line(laneline5_X,lanelineY,laneline5_X,HEIGHT);
  
   fill(shadowR,shadowG,shadowB);
    noStroke();
    ellipse(shadowX,mouseY/1.5+shadowY,shadowDIAM,shadowDIAM);

  //boolean
boolean black = true;
  
if (mousePressed) {
    black = false;
  } else {
    black = true;
  }
  if (black) {
    // ball
    fill(blck,mouseX,mouseY);
  //  stroke(white);
   // strokeWeight(ballSTROKE);
    ellipse(ballX,mouseY+ballY,ballDIAM,ballDIAM);
     
    //holes
    stroke(white);
    strokeWeight(holeSTROKE);
    ellipse(hole1,mouseY/1.5+ holeYA,holeDIAM,holeDIAM);
    ellipse(hole2,mouseY/1.5+ holeYB,holeDIAM,holeDIAM);
    ellipse(hole3,mouseY/1.5+ holeYA,holeDIAM,holeDIAM);
        
  }else {
    //ball turns colors
    fill(blck);
    stroke(white);
   strokeWeight(ballSTROKE);
    ellipse(ballX,mouseY+ballY,ballDIAM,ballDIAM);
   
    //holes also turn colors
    stroke(white);
    strokeWeight(holeSTROKE);
    ellipse(hole1,mouseY/1.5+ holeYA,holeDIAM,holeDIAM);
    ellipse(hole2,mouseY/1.5+ holeYB,holeDIAM,holeDIAM);
    ellipse(hole3,mouseY/1.5+ holeYA,holeDIAM,holeDIAM);
  }
 }
 }


