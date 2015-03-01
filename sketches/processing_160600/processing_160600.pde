
PImage luc;
PImage mew;
float speed = 50;
float move;
float limit;

void setup(){
size(800,400);
mew = loadImage("http://i.imgur.com/lQhcuPD.png");
luc = loadImage("http://img3.wikia.nocookie.net/__cb20140118185201/fantendo/images/4/49/SSB_Lucario.png");
}

void draw() {
background(255);
move = move + speed;
limit = limit + speed;
for (int i = 0; i < 10; i = i+i) {
    image(luc,move-100,0);
}




}
