
int monsterY = 40;

void setup(){
size(200,200);
}
void draw(){
background(0);
fill(54,9,9);
rect(mouseX,monsterY,20,20);     // Startcoordinaten 20,40
rect(mouseX,monsterY+20,20,20);
rect(mouseX+20,monsterY+20,20,20);
rect(mouseX+40,monsterY,50,90);
rect(mouseX+90,monsterY+20,20,20);
rect(mouseX+110,monsterY+20,20,20);
rect(mouseX+110,monsterY,20,20);
rect(mouseX+40,monsterY+90,20,20);
rect(mouseX+70,monsterY+90,20,20);
fill(0,0,0);
triangle(mouseX+42,monsterY+2,mouseX+42,monsterY+20,mouseX+60,monsterY+10);
triangle(mouseX+70,monsterY+10,mouseX+88,monsterY+2,mouseX+88,monsterY+20);
triangle(mouseX+65,monsterY+15,mouseX+55,monsterY+55,mouseX+75,monsterY+55);

monsterY = monsterY - 1;
}
