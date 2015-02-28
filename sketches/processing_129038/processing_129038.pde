
int monsterX;
int monsterY;

void setup () {
  size (500, 500);
  monsterX = 100;
  monsterY = 100;
  
}

void draw () {
  background (255, 200, 255);
  stroke(0, 255, 0);
    fill(0,255,0);
  

  ellipse(mouseX+60, monsterY+115, 25, 25);
  ellipse(mouseX, monsterY+115, 25, 25);
    fill(255,100,150);

  rect(mouseX-20, monsterY-20, 100, 130);
    fill(0,255,0);

  rect(mouseX-10, monsterY, 30, 30);
  rect(mouseX+30, monsterY-10, 40, 40);
    fill(255);
    
  rect(mouseX-10, monsterY, 15, 15);
  rect(mouseX+30, monsterY-10, 20, 20);
    fill(0);
 
  rect(mouseX-7, monsterY+3, 7, 7);
  rect(mouseX+35, monsterY-5, 10, 10);
  line(mouseX-40, monsterY, mouseX-20, monsterY+80);
  line(mouseX+100, monsterY, mouseX+80, monsterY+80);
    fill(255,150,150);

  ellipse(mouseX+30, monsterY+70, 50, 20);
  

monsterY = monsterY -1;
}

