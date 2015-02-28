
//Lauren Lee
//Creative computing
//For loops and arrays
//February 26 2013

//variables
int numbersquares = 15;
int[] xpos = new int[numbersquares];
int[] ypos = new int[numbersquares];
int[] xspeed = new int[numbersquares];
int[] yspeed = new int[numbersquares];
int[] sizes = new int[numbersquares];
int time_change = 27000; //timer

//establishment
void setup() {
  size(800,350);
  background(255);
  smooth();
  noStroke();
  noFill();
  for (int i=0; i<numbersquares; i++) {
    xpos[i] = int(random(1,width));
    ypos[i] = int(random(175,height/2));
    xspeed[i] = int(random(1,5));
    yspeed[i] = int(random(1,5));
    sizes[i] = int( random(50,100));
  }
}

//pattern making
void draw() {
//motion
  for (int i = 0; i<numbersquares; i++) {
    xpos[i] += -xspeed[i];
    ypos[i] += -yspeed[i];
   
//boundaries     
    if ((xpos[i] > width) || (xpos[i]<0)) {
      xspeed[i] *= -1; 
    }
    if ((ypos[i] > height) || (ypos[i]<0)) {
      yspeed[i] *= -1;   
    }
   
//moving circles
    ellipse(xpos[i], ypos[i], sizes[i], sizes[i]);
    strokeWeight(1);
    point(xpos[i], ypos[i]);
  }

//change after certain amt of time
  int timer = millis();
  println(timer);
  int current_time = millis();
  if(current_time > time_change) {
    stroke(255,255,255,50);
  } else {
    stroke(random(200), 0, random(255),50);  
}
}



