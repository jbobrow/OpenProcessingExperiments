
int monsterX;
int monsterY;


void setup() {
  size(300, 300);

 
monsterX = 100;
monsterY = 200;

}
 
void draw() {
  
  monsterY = monsterY -1;
  monsterX = mouseX;
  
  
  background(138,138,138);
 
  stroke(255);
  fill(57, 199, 204);
  rectMode(CENTER);
  rect(monsterX-10, monsterY+50, 5, 25);
 
  stroke(255);
  fill(57, 199, 204);
  rectMode(CENTER);
  rect(monsterX+10, monsterY+50, 5, 25);
 
 
  noStroke();
  fill(57, 199, 204);
  rectMode(CENTER);
  rect(monsterX, monsterY, 60, 100); 

   stroke(180);
  fill(255);
  rectMode(CENTER);
  rect(monsterX-10, monsterY-20, 20, 20);
 
  stroke(0);
  fill(0);
  rectMode(CENTER);
  rect(monsterX-10,monsterY-20, 10, 10);
 
   stroke(180);
  fill(255);
  rectMode(CENTER);
  rect(monsterX+10, monsterY-20, 20, 20);
 
  stroke(0);
  fill(0);
  rectMode(CENTER);
  rect(monsterX+10,monsterY-20, 10, 10);
 
  
  stroke(0);
  fill(50);
  rectMode(CENTER);
  rect(monsterX, monsterY+20, 30, 22);
}

