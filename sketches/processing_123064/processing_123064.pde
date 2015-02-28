
int monsterX;
int monsterY;

void setup() {
  size(200, 200);
  monsterX = 100;
  monsterY = 100;
  

}

void draw() {
  background(255, 255, 255);
  stroke(0);
  fill(0, 0, 0);
  rectMode(CENTER);
  rect(monsterX, monsterY+25, 50, 100);
  line(monsterX-50, monsterY, monsterX, monsterY+50); 
  line(monsterX, monsterY+50, monsterX+50, monsterY);
  fill(255);                
  ellipse(monsterX, monsterY-30, 60, 60);  
  fill(0);                   
  ellipse(monsterX-19, monsterY-30, 16, 32);   
  ellipse(monsterX+19, monsterY-30, 16, 32);
  fill(255, 255, 255);
  ellipse(monsterX-17, monsterY-30, 14, 30);
  ellipse(monsterX+18, monsterY-30, 14, 30);
  line(monsterX-10, monsterY-30, monsterX+10, monsterY-30);
  line(monsterX+20,monsterY+90,monsterX+20,monsterY+75);
  line( monsterX-20,monsterY+90,monsterX-20,monsterY+75);
  line( monsterX+20,monsterY+90,monsterX+30,monsterY+90);
  line( monsterX-20,monsterY+90,monsterX-30,monsterY+90);
  
  monsterY = monsterY - 1;
  monsterX= mouseX;
}

