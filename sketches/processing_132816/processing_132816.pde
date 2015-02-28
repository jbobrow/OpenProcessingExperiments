
//Jenny McCarthy 2/8/14 - Drawing with while and for loops
void setup(){
  size(500,500);
  background(#3dac61);
  noLoop();
}
void draw(){
  strokeWeight(5);
  line(0,0,500,100);
  line(0,35,500,205);
  line(0,165,500,440);

  float r = 0;
  while (r < 500) {
    strokeWeight(random(1,10)); //random line stroke weights
    line(0, r, 500, r);
    r = r + random(5,50); //random placement of lines
  } 
  float s = 0;
  while (s < 500) {
    stroke(255,150);
    strokeWeight(5);
    translate(0,5); //lines gradually go from top left to bottom right
    line(s,0,s,50);
    line(s,100,s,150);
    line(s,200,s,250);
    line(s,300,s,350);
    line(s,400,s,450);
    s = s + 25;
  }  
  int circleSize = 100;
  for (int x = 50; x < 500; x = x+100) {  //draws circles across the screen (rows)
  for (int y = 0; y < 500; y = y+100) { //draws circles down the screen (columns)
    noStroke();
    fill(175,25,50,random(100,250)); //circle opacity varies
    translate(5,6);
    ellipse(x,y,circleSize,circleSize);
    circleSize = circleSize - 5; //circle size changes
    }
  }
  for (int x = 0; x < 500; x = x+50) {  //draws squares across the screen (rows)
  for (int y = 0; y < 500; y = y+50) { //draws squares down the screen (columns)
    noStroke();
    fill(50,75,150);
    rectMode(CENTER);
    translate(6,6);
    rect(x,y,25,25);
    }
  }
}


