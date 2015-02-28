
ground a = new ground(0);
ground b = new ground(420);
ground c = new ground(840);
bird ni = new bird();
bird ichi = new bird();
bird san = new bird();
bird shi = new bird();
bird go = new bird();
boolean switchscene = false;
boolean start = false;
int health = 115;
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
  strokeWeight(5);
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
   if(health <= 0){
     gameover();
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

class bird{
  int xp = 450;
  int yp = int(random(10,400));
  int xdifference;
  int ydifference;
  int speed = int(random(3,10));
  
  bird(){}
  
  void display(){
  fill(250,36,13);
  rect(xp,yp,60,20);
  }
  
  void move(){
    xdifference = x3 - xp;
   ydifference = y3 - yp;
    if (xp >= -70){
    xp = xp - speed;
    }
    else{
      xp = 500;
      yp = int(random(10,350));
      speed = int(random(3,14));
    }
  }
  
  void collision(){
  if(xdifference <= 40 && (xdifference >= 0) && (ydifference <= 40) && (ydifference >=0)){
  health = health -5;
  }
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
stroke(0);
strokeWeight(5);
strokeJoin(BEVEL);
rect(xp,yp,h, 400);
}

void moveground(){
stroke(0);
xp = xp - 5;
if (xp < - 900){
xp = 510;
h = int(random(300,360));
}
}

}
void displayer(){
stroke(0);
strokeJoin(BEVEL);
strokeWeight(3);
fill(7,89,131);
triangle(x1,y1,x2,y2,x3,y3);
}

void displayer2(){
stroke(0);
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
ichi.display();
ichi.collision();
ni.display();
ni.collision();
san.display();
san.collision();
shi.display();
shi.collision();
go.display();
go.collision();
a.moveground();
b.moveground();
c.moveground();
ichi.move();
ni.move();
san.move();
shi.move();
go.move();
textSize(15);
fill(0);
text("Scene 1",10,20);
text("Health: " + health, 10,40);
//text("Xdifference:" + ichi.xdifference, 10,50);
//text("Xdifference:" + ni.xdifference, 10,65);
//text("Xdifference:" + san.xdifference, 10,85);
//text("Ydifference:" + ichi.ydifference, 10,95);
//text("Ydifference:" + ni.ydifference, 10,105);
//text("Ydifference:" + san.ydifference, 10,115);
//the sun
fill(250,250,13);
noStroke();
ellipse(500,5,50,50);
}

void scene2(){
strokeWeight(5);
background(35,15,131);
displayer2();
fill(41,108,5);
a.displayground();
b.displayground();
c.displayground();
ichi.display();
ichi.collision();
ni.display();
ni.collision();
san.display();
san.collision();
a.moveground();
b.moveground();
c.moveground();
ichi.move();
ni.move();
san.move();
textSize(15);
fill(255);
text("Scene 2",10,20);
text("Health: " + health, 10,40);
//the moon
fill(255);
noStroke();
ellipse(500,5,50,50);
}

void scene0(){
  start = false;
background(13,250,26);
fill(0);
textSize(15);
text("Mock up of a game.", 10,20);
text("You can move the airship with the up and down keys.",10,120);
text("Press the right arrow to start.", 10,140);
text("The red bars are burning hot. Stay away!", 10,180);
text("start: " + start , 10, 160);
}

void gameover(){
background(19,184,232);
textSize(25);
text("Game over. :(",50,50);
text("Reload the screen to play again.",50,100);
}


