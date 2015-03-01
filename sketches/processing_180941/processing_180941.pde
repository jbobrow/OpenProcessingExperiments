
float heroX;
float heroY;
float villainX;
float villianY;
float speed;

void setup() {
size(500,500);
speed=5;
villainX=20;
villainY=20;
heroX=width/2;
heroY=height/2;
}

void draw() {
background(50, 0, 0);
moveVillain();
//drawVillain(100, 100);
//drawGoal(400, 400);
//drawHero(heroX, heroY);
}

void moveVillain() {
villainX=villainX+random(-speed,speed);
villainY=villainY+random(-speed,speed);
if(villainX<0) villainX=0;
if(villainY<0) villainY=0;
}


void keyPressed() {
    //press D, move right
    if (key=='d') {
        heroX=heroX + 25;
        heroY=heroY+25;
    }
    if (key=='a') {
    }
 }
  
 void drawHero(float x, float y) {
    //first ear
    ellipse(x-6,y-15,4,15);
    //second ear
    ellipse(x+6,y-15,4,15);
//head
    ellipse(x,y,20,20);
    //nose
    fill(0);
    ellipse(x,y+2,3,3);
}


void drawVillain(float x,float  y) {
        fill(255,0,0);
triangle(x,y,x-12,x-12,x+12,y-12
}

void drawGoal(float x,float y) {
    fill(202,205,51);
    ellipse(x,y,20,20);
}

