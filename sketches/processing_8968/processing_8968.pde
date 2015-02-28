
PFont font;

//Gobal Variables
float x = 400;
float y = 400;
int speed = 200;
boolean isRunning = true;

void setup() {
  font = loadFont("AndaleMono-14.vlw");
  textFont(font, 14);
  //size(screen.width-10,screen.height-50);
  size(800,800);
  smooth();
  background(150,150,150);
  fill(0,0,0);
  ellipse(x,y,4,4);
  
  fill(255,255,255);
  text("banyan \npress space bar to pause \nadjust speed with up/down arrows \nclick to reset",10,height-65);
  text("scott ogle",width-90,height-13);
}


void draw() {
  
  if(isRunning = true) {
    
  //Paramters are randomized.  'L' is the length of the branches,
  //'branches' controls the number of branches and 'randAngle' controls the angle.  
  float L = random(20,150);
  //Had to round or else random() will output a floating point.
  float branches = round(random(1,2));
  float randAngle = random(360);
  float randAngle2 = random(360);
  
  //Trig! 2 and 3 are for the different branches.
  float x2 = x+L*cos(randAngle);
  float y2 = y+L*sin(randAngle);
  float x3 = x+L*cos(randAngle2);
  float y3 = y+L*sin(randAngle2);
  
  

  if(branches == 2) {
    stroke(0,0,0);
    fill(0,0,0);
      line (x,y,x2,y2);
      line (x,y,x3,y3);
      ellipse(x2,y2,4,4);
      ellipse(x3,y3,4,4);
    
    noStroke();
    fill(6,48,137,30);
      ellipse(x2,y2,20,20);
      ellipse(x2,y2,L,L);
      ellipse(x3,y3,20,20);
      ellipse(x3,y3,L,L);
  }
  
  else {
    stroke(0,0,0);
    fill(0,0,0);
      line(x,y,x2,y2);
      ellipse(x2,y2,4,4);
    
    fill(6,48,137,30);
    noStroke();
      ellipse(x2,y2,L,L);
      ellipse(x2,y2,20,20);
  }
  
  delay(speed);

  x = x2;
  y = y2;
  
  if(x > width || x < 0) {
    x = random(width);
    stroke(0,0,0);
    fill(0,0,0);
    ellipse(x,y,3,3);
  }
  
  if(y > height || y < 0){
    y = random(height);
    stroke(0,0,0);
    fill(0,0,0);
    ellipse(x,y,3,3);
  }
  }
}

void keyPressed() {
  if(key == 32) {
    if(isRunning == true) { 
      noLoop();
      isRunning = false;
    }
    else {
      loop();
      isRunning = true;
    }
    
  }
  else if(keyCode == UP) {
    speed -= 50;
  }
  else if(keyCode == DOWN) {
    speed += 50;
  }
}

void mouseClicked() {
  background(150,150,150);
  fill(255,255,255);
  text("banyan \npress space bar to pause \nadjust speed with up/down arrows \nclick to reset",10,height-65);
  text("scott ogle",width-90,height-13);
}


