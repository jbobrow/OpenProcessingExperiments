

int monsterY;

void setup(){
size(500,500);
mouseX = 250;
monsterY = 250;
}
void draw(){
background(0);
fill(172,220,95);
rect(mouseX-50,monsterY-10,10,10);
rect(mouseX-50,monsterY,10,10);
rect(mouseX-50,monsterY+10,10,10);
rect(mouseX-50,monsterY+20,10,10);
rect(mouseX-40,monsterY+10,10,10);
rect(mouseX-40,monsterY+20,10,10);
rect(mouseX-40,monsterY+30,10,10);
rect(mouseX-40,monsterY+50,10,10);
rect(mouseX-30,monsterY-20,10,10);
rect(mouseX-30,monsterY,10,10);
rect(mouseX-30,monsterY+10,10,10);
rect(mouseX-30,monsterY+20,10,10);
rect(mouseX-30,monsterY+30,10,10);
rect(mouseX-30,monsterY+40,10,10);
rect(mouseX-20,monsterY-10,10,10);
rect(mouseX-20,monsterY,10,10);
rect(mouseX-20,monsterY+20,10,10);
rect(mouseX-20,monsterY+30,10,10);
rect(mouseX-10,monsterY,10,10);
rect(mouseX-10,monsterY+10,10,10);
rect(mouseX-10,monsterY+20,10,10);
rect(mouseX-10,monsterY+30,10,10);
rect(mouseX,monsterY,10,10);
rect(mouseX,monsterY+10,10,10);
rect(mouseX,monsterY+20,10,10);
rect(mouseX,monsterY+30,10,10);
rect(mouseX+10,monsterY,10,10);
rect(mouseX+10,monsterY+10,10,10);
rect(mouseX+10,monsterY+20,10,10);
rect(mouseX+10,monsterY+30,10,10);
rect(mouseX+20,monsterY-10,10,10);
rect(mouseX+20,monsterY,10,10);
rect(mouseX+20,monsterY+20,10,10);
rect(mouseX+20,monsterY+30,10,10);
rect(mouseX+30,monsterY-20,10,10);
rect(mouseX+30,monsterY,10,10);
rect(mouseX+30,monsterY+10,10,10);
rect(mouseX+30,monsterY+20,10,10);
rect(mouseX+30,monsterY+30,10,10);
rect(mouseX+30,monsterY+40,10,10);
rect(mouseX+40,monsterY+10,10,10);
rect(mouseX+40,monsterY+20,10,10);
rect(mouseX+40,monsterY+30,10,10);
rect(mouseX+40,monsterY+50,10,10);
rect(mouseX+50,monsterY-10,10,10);
rect(mouseX+50,monsterY,10,10);
rect(mouseX+50,monsterY+10,10,10);
rect(mouseX+50,monsterY+20,10,10);

monsterY = monsterY -1;
}
