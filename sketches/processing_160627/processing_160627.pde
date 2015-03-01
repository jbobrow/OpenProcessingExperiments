
PImage luc;
PImage mew;
PImage vs;
float speed = 1;
float moveL = 0;
float moveR = 0;
float limitL = -20;
float limitR = 350;
int X = mouseX;
int Y = mouseY;


void setup(){
textSize(40);
size(800,400);
mew = loadImage("http://i.imgur.com/lQhcuPD.png");
luc = loadImage("http://img3.wikia.nocookie.net/__cb20140118185201/fantendo/images/4/49/SSB_Lucario.png");
vs = loadImage("http://i.imgur.com/8ggXwLq.png");
}

void draw() {
background(0);

for (int i = 0; i < 50; i = i+1) {
        image(luc,-moveL+1200,0);
        moveL = moveL + speed;
    }
for (int i = 0; i <70; i = i+1) {
        image(mew,moveR-700,0);
        moveR = moveR + speed;
    };

image(luc,limitL,0);
image(mew,limitR,0);
image(vs,325,125,100,150);
fill(255);
text("Round 1",305,50);
rect(330,300,100,50);
textSize(32);
fill(0);
text("Start",345,335);
textSize(12);
fill(255);
text("X: "+mouseX,10,340);
text("Y: "+mouseY,10,370);
}

void mouseClicked(){
    if ((mouseX>330)&&(mouseY>300)&&(mouseX<430)&&(mouseY<350)){
        moveR = 0;
        moveL = 0;
    }
}
