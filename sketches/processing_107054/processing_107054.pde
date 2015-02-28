
ground a = new ground(0);
ground b = new ground(420);
ground c = new ground(840);
boolean switchscene = false;
boolean start = false;
int x1 = 40;
int x2 = 40;
int x3 = 140;
int y1 = 80;
int y2 = 100;
int y3 = 90;


void setup(){
  size(500,500);
}

void draw(){
 if (start == false){
 scene0();
 }
 else if (start == true){
   if(switchscene == false){
     scene1();
   }
   else{
     scene2();
   }
 }


//fill(0);
//textSize(10);
//text("a.h: " + a.h,50,50);
//text("b.h: " + b.h,50,60);
//text("c.h: " + c.h,50,70);
//text("Start: " + start,50,80);
//text("Switchscene: " + switchscene,50,90);

if (keyPressed){
if(keyCode == DOWN){
y1 = y1 + 5;
y2 = y2 + 5;
y3 = y3 + 5;
}
else if(keyCode == UP){
y1 = y1 - 5;
y2 = y2 - 5;
y3 = y3 - 5;
}
else if(keyCode == RIGHT){
start = true;
}
}

}
void mousePressed(){
if (switchscene == true){
switchscene = false;
}
else{
switchscene = true;
}
}

class ground{
int xp;
int yp = 350;
int h = 400;

ground(int x){
  xp = x;

}
  
void displayground(){
strokeWeight(5);
strokeJoin(BEVEL);
rect(xp,yp,h, 400);
}

void moveground(){
xp = xp - 5;
if (xp < - 900){
xp = 510;
h = int(random(300,360));
}
}

}
void displayer(){
fill(7,89,131);
strokeJoin(BEVEL);
strokeWeight(3);
triangle(x1,y1,x2,y2,x3,y3);
}

void displayer2(){
fill(210,31,234);
strokeJoin(BEVEL);
strokeWeight(3);
triangle(x1,y1,x2,y2,x3,y3);
}

void scene1(){
background(19,184,232);
displayer();
fill(41,108,5);
a.displayground();
b.displayground();
c.displayground();
a.moveground();
b.moveground();
c.moveground();
textSize(15);
fill(0);
text("Scene 1",10,20);
}

void scene2(){
background(35,15,131);
displayer2();
fill(41,108,5);
a.displayground();
b.displayground();
c.displayground();
a.moveground();
b.moveground();
c.moveground();
textSize(15);
fill(255);
text("Scene 2",10,20);
}

void scene0(){
  start = false;
background(35,15,131);
fill(0);
textSize(15);
text("Mock up of a game.", 10,20);
text("You can move the airship with the up and down keys.",10,120);
text("Press the right arrow to start.", 10,140);
text("start: " + start , 10, 160);
}


