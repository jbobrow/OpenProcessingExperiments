
int monsterX;
int monsterY;
 
void setup() {
  size(500, 500);
  monsterX = 145;
  monsterY = 240;
 
}
 
 
void draw() {
  background(255, 255, 255);
   
  stroke(0);
  fill(79, 216, 132);
  rect(monsterX-50, monsterY+35, 20, 50);
 
  stroke(0);
  fill(79, 216, 132);
  rect(monsterX+25, monsterY+35, 20, 50);
 
  stroke(0);
  fill(79, 216, 132);
  ellipseMode(CENTER);
  ellipse(monsterX, monsterY, 180, 100);
 
  stroke(0);
  fill(79, 216, 132);
  ellipseMode(CENTER);
  ellipse(monsterX-100, monsterY-40, 100, 100);
 
  stroke(0);
  fill(79, 216, 132);
  ellipseMode(CENTER);
  ellipse(monsterX-100, monsterY-40, 90, 90);
 
  fill(255, 255, 255);
  ellipseMode(CENTER);
  ellipse(monsterX-125, monsterY-60, 20, 20);
 
  fill(0);
  ellipseMode(CENTER);
  ellipse(monsterX-127, monsterY-55, 9, 9);
 
  fill(255, 0, 0);
  ellipseMode(CENTER);
  ellipse(monsterX-127, monsterY-55, 10, 10);
 
/*bewegend omhoog*/
  monsterY = monsterY - 3;
   /*bewegend met muis*/
  monsterX = mouseX;
 /*herhaling*/
  if (monsterY==-150){
     monsterY=900;
 }
}

