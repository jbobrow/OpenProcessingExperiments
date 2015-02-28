
int monsterX;
int monsterY;

void setup() {
size(500,500);
monsterX = 250;
monsterY = 250;}

void draw() {
background(255,255,255); 
stroke(0);
fill(255,0,0);
ellipseMode(CENTER);
fill(0);
ellipse(monsterX-50,monsterY+60,100,40);
ellipse(monsterX+50,monsterY+60,100,40);
fill(255,0,0);
ellipse(monsterX,monsterY,150,150);
fill(0);
ellipse(monsterX-30,monsterY-30,50,50);
ellipse(monsterX+30,monsterY-30,50,50);
fill(255);
ellipse(monsterX-40,monsterY-40,25,25);
ellipse(monsterX+40,monsterY-20,25,25);
fill(0);
ellipse(monsterX-40,monsterY-40,10,10);
ellipse(monsterX+40,monsterY-20,10,10);
fill(0);
rect(monsterX-35,monsterY+30,70,20);
fill(255);
rect(monsterX-35,monsterY+30,10,10);
rect(monsterX+25,monsterY+30,10,10);

monsterY = monsterY - 1;}

//referentiepunt 250



