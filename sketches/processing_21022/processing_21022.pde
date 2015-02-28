
int hours;
int minutes;
int seconds;
int millisec;
int move;
int face;
int face2;


void setup() {
  size(400, 800);
  colorMode(HSB,200,100,100);
   background(62, 50,100);
  strokeCap(ROUND);
  ellipseMode(CENTER);
  smooth();
  move = 10;
}



void draw() {
  hours = hour();
  minutes = minute();
  seconds = second();
  millisec = millis();

  background(70, 50,100);
  pushMatrix();
  // scale(1.25);
  // Found this code that determines odd or even
  // at http://processing.org/discourse/yabb2/YaBB.pl?num=1214309824
  if(seconds%2 == 0) {
    if(move > 40) {
      move-=1;
      println("positive" + " " + move);
    }
    else {
      move+=1;
    }
  }

  else if(move < 340) {
    move-=1;
  }
  else {
    move+=1;
  }  
  pendulum(move,width/2,height/4);
  clock((width/2) + 50,(height/4) + 50);
  println("negative" + " " + move);
  popMatrix();
}




void clock(int X, int Y) {
  translate(X,Y);
  rotate(radians(90));
  noFill();
  ellipse(0,0, 10, 10);
  // hour hand
  strokeWeight(4);
  stroke(hours, 50, 50);
  pushMatrix();
  rotate(radians(30 * hours));
  fill(hours - 20,75,75); 
  ellipse(-100,0,5 * hours,5 * hours);
  popMatrix();

  // minute hand
  strokeWeight(2);
  stroke(minutes, 50, 50);
  pushMatrix();
  rotate(radians(6 * minutes));
  fill(minutes - 10,75,75);
  ellipse(-100,0,2 * minutes,2 * minutes);
  popMatrix();
}

void pendulum(int move,int X, int Y) {
  pushMatrix();
  translate(X,Y);
  rotate(radians(move));
  noStroke();
  fill(20,25,25);
  rect(-8,0, 16,300);
  fill(seconds + 10,80,80);
  ellipse(0,300,100,100);
  fill(seconds,80,80);
  ellipse(0,300,80,80);
  clockFace(minutes);

  popMatrix();
}

void clockFace(int minutes) {

  noStroke();
  fill(minutes,seconds,seconds);
  ellipse(0,0, 200,200);
}


