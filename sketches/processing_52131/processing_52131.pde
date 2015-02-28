
// Homework #7 for Jim Roberts' CFA-757
// Carnegie Mellon University, Pittsburgh
// Zoe Lu copyright Spring 2012, PA 15213

int time,score;
float ox,oy,oxSpeed,oySpeed;
float ox2,oy2,oxSpeed2,oySpeed2;

void setup(){
  size(300,300);
  textSize(14);
  textAlign(LEFT);
  fill(0);
  ox=random(width);
  oy=random(height);
  ox2=random(height);
  oy2=random(width);
  oxSpeed=.1;
  oySpeed=.1;
  oxSpeed2=.1;
  oySpeed2=.1;
  score=0;
}

void draw(){
  countTime();
  countScore();
  drawObjects(ox,oy,ox2,oy2);
  moveObjects();
//  startOver();

}

void drawObjects(float x, float y, float x2, float y2){
//  background(255,0);
  noStroke();
  fill(150,0,0);
  ellipse(x,y,30,30);
  fill(0,150,0);
  ellipse(x2,y2,20,20);
}

void moveObjects(){
  ox+=oxSpeed;
  oy-=oySpeed;
  if(ox>width||oy<0){
    ox=random(width);
    oy=random(height);
  }
  ox2-=oxSpeed2;
  oy2+=oySpeed2;
  ///*
  if(ox2<0||oy2>height){
    ox2=random(height);
    oy2=random(width);    
  }
  //*/
}

void countTime(){
  time=millis()/1000;
  fill(0,0,150);
  background(255);
  text("Timer: "+time+" sec",10,50);  
  if(time==16){
    noLoop();
    background(255);
    text("Time's up!",10,50);
    //time=0;
  }
}

void countScore(){
  text("Score: "+score+" points",10,30);
}

void mousePressed(){
  float d=dist(mouseX,mouseY,ox,oy);
  float d2=dist(mouseX,mouseY,ox2,oy2);
  if(d<30){
    score+=100;
    oxSpeed++;
  }
  if(d2<30){
    score+=200;
    oySpeed2++;
  }
}

/*
void mouseMoved(){
  stroke(0,0,90);
  strokeWeight(2);
  line(mouseX, mouseY, mouseX, mouseY+20);
  line(mouseX-10,mouseY+10,mouseX+10,mouseY+10);
}
*/

/*
void startOver(){
  fill(45,0,0);
  rect(width-60,height-40,55,35);
  stroke(255);
  text("start",width-45,height-25);
  text("over",width-40,height-20);
}
*/




