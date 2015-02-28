
color bgcolor;
int x = 50;
int y = 50;
PShape alien, head, ear1, ear2, eye1, eye2, mouth, larm, llarm, rarm, lleg, rleg;

void setup(){

size(400, 400, P2D);
smooth();
bgcolor = color(random(255), random(255), random(255)); //set a random background color
background(bgcolor);
rectMode(CENTER);
alien = createShape(GROUP);
head = createShape(RECT, x, y, 50, 50);
ear1 = createShape(RECT, x +10 , y -28, 10, 25);
ear2 = createShape(RECT, x+35, y - 23, 10, 20);
eye1 = createShape(RECT, x + 10, y + 10, 10, 10);
eye2 = createShape(RECT, x + 30, y + 9, 13, 13);
mouth = createShape(RECT, x + 10, y + 30, 30, 10);
mouth.fill(bgcolor);
eye2.fill(bgcolor);
eye1.fill(bgcolor);
larm = createShape(RECT, x - 15, y + 55, 75, 100);
llarm = createShape(RECT, x-37, y + 55, 20, 125);
rarm = createShape(RECT, x+ 62, y + 55, 20, 125);
lleg = createShape(RECT, x - 7, y + 160, 30, 125);
rleg = createShape(RECT, x + 25, y + 160, 30, 125);
alien.addChild(ear1);
alien.addChild(ear1);
alien.addChild(ear2);
alien.addChild(head);
alien.addChild(eye1);
alien.addChild(eye2);
alien.addChild(mouth);
alien.addChild(larm);
alien.addChild(llarm);
alien.addChild(rarm);
alien.addChild(lleg);
alien.addChild(rleg);
}
void draw() {
  background(bgcolor);
  cursor();
  translate(mouseX -100, mouseY -100); 
  shape(alien);
}
