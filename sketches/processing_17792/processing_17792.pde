
color c, r, g, b, a;
boolean waiting;
int len, count, x, y, turn, reactionTime;

void setup(){
  size(400, 600);
  background(0, 0, 0, 50);
  smooth();
  clear();
  waiting = true;
  turn = 0;
  reactionTime = 0;
  len = int(random(100));
}

void clear(){
  fill(0, 0, 0, 255);
  rect(0, 0, 400, 400);
  waiting = true;
  turn++;
  reactionTime = 0;
}

void draw(){
  if(!waiting){
    reactionTime++;
  }

  if(count == len && waiting == true){
    r = int(random(200)) + 55;
    g = int(random(200)) + 55;
    b = int(random(200)) + 55;
    a = int(random(150)) + 105;
    
    fill(r, g, b, a);
    x = int(random(300)) + 50;
    y = int(random(270)) + 50;
    
    ellipse(x, y , 50, 50);
    waiting = false;
    count = 0;
    reactionTime = 0;

  }
  count++;
}

void mouseClicked(){ 
    if(abs(x - mouseX) < 25 && abs(y - mouseY) < 25){
      fill(0, 30, 200, 100);
      rect(turn * 5, 600, 5, -reactionTime);
      waiting = true;
      len = int(random(100));
      count = 0;
      clear();
  }
}

