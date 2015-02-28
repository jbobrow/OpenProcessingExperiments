
void setup(){
  size(500,460);
  background(245,232,220);
}

int pinkx = 135; //pink x coordinate
int speed = 1;
int blackx = 56;
int speedb = -1;

int blackY = 117;
int pinkY = 20;

void draw(){  
  
 //nude horizontal over vertical black bars
  noStroke();
  fill(245,232,220);
  rect(355,181,112,16);
  
  //vertical pink bars  
  noStroke();
  fill(245,101,104);
  rect(40,pinkY,16,417);
  
  noStroke();
  fill(245,101,104);
  rect(72,pinkY,16,417);
 
 //vertical black bars
  noStroke();
  fill(0,0,0);
  rect(355,blackY,16,300);
  
  noStroke();
  fill(0,0,0);
  rect(387,blackY,16,300);
  
  noStroke();
  fill(0,0,0);
  rect(419,blackY,16,300);
  
  noStroke();
  fill(0,0,0);
  rect(451,blackY,16,300);
  
 //nude horizontal over vertical black bars
  noStroke();
  fill(245,232,220);
  rect(355,181,112,16);
  
//horizontal pink bars
  noStroke();
  fill(245,101,104);
  rect(pinkx + 140,5,65,16);
  
  noStroke();
  fill(245,101,104);
  rect(pinkx +140,37,65,16);
  
  noStroke();
  fill(245,101,104);
  rect(pinkx,69,205,16);
  
  noStroke();
  fill(245,101,104);
  rect(pinkx,101,205,16);
  
//long pink horizontal 1
  noStroke();
  fill(245,101,104);
  rect(pinkx,133,332,16);
  
//long pink horizontal 2
  noStroke();
  fill(245,101,104);
  rect(pinkx,165,332,16);

//pink horizontal
  noStroke();
  fill(245,101,104);
  rect(pinkx,197,205,16);
  
  noStroke();
  fill(245,101,104);
  rect(pinkx,229,205,16);

  noStroke();
  fill(245,101,104);
  rect(pinkx,261,205,16);
  
  noStroke();
  fill(245,101,104);
  rect(pinkx,293,205,16);

  noStroke();
  fill(245,101,104);
  rect(pinkx,325,205,16);

  noStroke();
  fill(245,101,104);
  rect(pinkx,357,205,16);
  
//black horizontal bars  
  noStroke();
  fill(0,0,0);
  rect(116,85,162,16);
  
  noStroke();
  fill(0,0,0);
  rect(blackx + 60,117,162,16);

  noStroke();
  fill(0,0,0);
  rect(blackx + 60,149,162,16);

  noStroke();
  fill(0,0,0);
  rect(blackx + 60,181,162,16);

//4 overlapping black bars
  noStroke();
  fill(0,0,0);
  rect(blackx,213,223,16);
  
  noStroke();
  fill(0,0,0);
  rect(blackx,245,223,16);

  noStroke();
  fill(0,0,0);
  rect(blackx,277,223,16);
  
  noStroke();
  fill(0,0,0);
  rect(blackx,309,223,16);

  noStroke();
  fill(0,0,0);
  rect(blackx + 60,341,162,16);

//small black squares  
  noStroke();
  fill(0,0,0);
  rect(blackx + 60,373,19,16);
  
  noStroke();
  fill(0,0,0);
  rect(blackx + 60,405,19,16);
  
  noStroke();
  fill(0,0,0);
  rect(blackx + 60,437,19,16); 
  
  blackx = blackx + speedb;
  if (blackx <= 0){
    speedb = speedb*-1;
}
  
  pinkx = pinkx + speed;
  
  if (pinkx > 460){
    speed = speed*-1;
}

 blackY = blackY + speed;
  
  if (blackY > 500){
    speed = speed*-1;
}

 pinkY = pinkY + speed;
  
  if (pinkY > 500){
    speed = speed*-1;
}

}
