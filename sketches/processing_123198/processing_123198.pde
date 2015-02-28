
int monsterY;
int monsterX;

void setup() {
  size(200, 200);
  monsterY = 100;
}

void draw() {
  background(255);
 monsterY=monsterY-1;
  monsterX= mouseX;
  stroke(0);
  ellipseMode(CENTER); 
  fill(61,165,60);
  ellipse(monsterX, monsterY-30, 100, 70);
  fill(255);
  ellipse(monsterX-20,monsterY-65,40,40);
  ellipse(monsterX+20, monsterY-65,40,40);
  fill(0);
  ellipse (monsterX-10, monsterY-60, 10,10);
  ellipse (monsterX+10, monsterY-60, 10,10);
  fill (240,189,235);
  stroke(240,189,235);
   ellipse (monsterX-35, monsterY-30, 12,12);
   ellipse (monsterX+35, monsterY-30,12,12);
  fill (0);
  stroke(0);
  ellipse( monsterX, monsterY-15,40,20);
 
 

 
}


