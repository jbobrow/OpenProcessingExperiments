
int monsterX;
int monsterY;

void setup () {
  size(200,200);
  monsterX=100;
  monsterY=200;
}

void draw () {
  background(255,255,255);
  stroke(0);
  
  fill(129,88,88);
  ellipseMode(CENTER);
  ellipse(monsterX,monsterY,100,100);    //x= 100 y= 100
  
  ellipseMode(CENTER);
  ellipse(monsterX-65,monsterY+10,20,20);
  
  ellipseMode(CENTER);
  ellipse(monsterX+65,monsterY+10,20,20);
  
  fill(5,5,5);
  rectMode(CENTER);
  rect(monsterX,monsterY-75,55,50);
  
  rectMode(CENTER);
  rect(monsterX,monsterY-45,90,10);
  
  fill(255);
  rectMode(CENTER);
  rect(monsterX,monsterY-55,55,7);
  
  fill(255,0,0);
  ellipseMode(CENTER);
  ellipse(monsterX+30,monsterY+60,35,20);
  
  ellipseMode(CENTER);
  ellipse(monsterX-30,monsterY+60,35,20);
  
  fill(5,5,5);
  rectMode(CENTER);
  rect(monsterX-20,monsterY-10,2,13);
  
  rectMode(CENTER);
  rect(monsterX+10,monsterY-10,2,13);
  
  monsterY=monsterY-1;
}
