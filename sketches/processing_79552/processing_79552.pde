
float flashposX = 250;
float flashposY = 250;

PImage flash;
PImage kid;
PImage treereg;
PImage bushreg;
PImage rockreg;
PImage back;
PImage dead;
PImage sun;
PImage win;

float enemyposX = random(0,500);
float enemyposY = 0;
float enemyposX2 = random(0,500);
float enemyposY2 = 450;
float enemyposX3 = 0;
float enemyposY3 = random(0,450);
boolean gameover = false;
boolean gamewin = false;

int counter = 0;
int treeani = 0;
int rockani = 0;
int bushani = 0;

PImage[] tree = new PImage[5];
PImage[] rock = new PImage[5];
PImage[] bush = new PImage[4];

void setup() {
  size(445,500);
  frameRate(40);
  
  sun = loadImage("sun.png");
  flash = loadImage("flashlight.png");
  kid = loadImage("flashkid.png");
  bushreg = loadImage("bush.png");
  rockreg = loadImage("rock.png");
  treereg = loadImage("tree.png");
  back = loadImage("backgroundflash.png");
  dead = loadImage("deadkid.png");
  win = loadImage("win.png");
  
  tree[0] = loadImage("treeenemny1.png");
  tree[1] = loadImage("treeenemy2.png");
  tree[2] = loadImage("treeenemy3.png");
  tree[3] = loadImage("treeenemy4.png");
  tree[4] = loadImage("treeenemy5.png");
  rock[0] = loadImage("rockenemy1.png");
  rock[1] = loadImage("rockenemy2.png");
  rock[2] = loadImage("rockenemy3.png");
  rock[3] = loadImage("rockenemy4.png");
  rock[4] = loadImage("rockenemy5.png");
  bush[0] = loadImage("bushenemy1.png");
  bush[1] = loadImage("bushenemy2.png");
  bush[2] = loadImage("bushenemy3.png");
  bush[3] = loadImage("bushenemy4.png");
  
}

void draw() {
  background(back);
if (gamewin == true) {
  gameover = true;
  image(treereg,300,50,150,150);
  image(bushreg,100,400,100,100);
  image(rockreg,400,250,100,100);
  image(kid,180,150,150,180);
  image(flash,250,260,25,12);
  image(win,25,25,200,200);
}

if (gameover == false) {
  stroke(10);
  line(10,30,450,30);
  stroke(10);
  image(sun,counter,10,75,50);
  counter ++;
}

if (counter == 450) {
  gamewin = true;
}
fill(10,10,10);
if (gameover == false) {
image(tree[treeani],enemyposX-75,enemyposY-75,150,150);
image(rock[rockani],enemyposX2,enemyposY2,100,100);
image(bush[bushani],enemyposX3,enemyposY3,100,100);
}
fill(255,255,255);


if (gameover == false){
image(kid,flashposX-80,flashposY-100,150,180);
image(flash,flashposX,flashposY,25,12);
  
if(mouseX>=flashposX && mouseY>=flashposY) {
fill(255,255,0);
noStroke();
ellipse(mouseX,mouseY,60,60);
triangle(flashposX,flashposY,mouseX-10,mouseY+25,mouseX,mouseY-25);
}

if(mouseX>flashposX && mouseY<=flashposY) {
fill(255,255,0);
noStroke();
ellipse(mouseX,mouseY,60,60);
triangle(flashposX,flashposY,mouseX-25,mouseY+10,mouseX+10,mouseY+25);
}

if(mouseX<=flashposX && mouseY<flashposY) {
fill(255,255,0);
noStroke();
ellipse(mouseX,mouseY,60,60);
triangle(flashposX,flashposY,mouseX-10,mouseY+25,mouseX,mouseY-25);
}

if(mouseX<flashposX && mouseY>flashposY) {
fill(255,255,0);
noStroke();
ellipse(mouseX,mouseY,60,60);
triangle(flashposX,flashposY,mouseX+10,mouseY+25,mouseX,mouseY-25);
}


if (key =='w' && keyPressed) {
  flashposY = flashposY - 5;
}

if (key =='a' && keyPressed) {
  flashposX = flashposX - 5;
}

if (key =='d' && keyPressed) {
  flashposX = flashposX + 5;
}

if (key =='s' && keyPressed) {
  flashposY = flashposY + 5;
}

if (flashposX < 0) {
  flashposX = 0;
}

if (flashposX > 500) {
  flashposX = 500;
}

if (flashposY < 0) {
  flashposY = 0;
}

if (flashposY > 500) {
  flashposY = 500;
}
}
if (gameover == false) {
//enemy1
if (enemyposX<flashposX) {
  enemyposX ++;
}
if (enemyposX>flashposX) {
  enemyposX --;
}
if (enemyposY<flashposY) {
  enemyposY ++;
}
if (enemyposY>flashposY) {
  enemyposY --;
}

if (abs( mouseX-enemyposX) < 20 && abs (mouseY-enemyposY) < 20) {
  enemyposX = (random(0,500));
  enemyposY = 0;
}
if (abs( flashposX-enemyposX) < 20 && abs (flashposY-enemyposY) < 20) {
  image(dead,flashposX-50,flashposY-100,150,180);
  flashposX = flashposX;
  flashposY = flashposY;
 
gameover = true;

}
//enemy2
if (enemyposX2<flashposX) {
  enemyposX2 ++;
}
if (enemyposX2>flashposX) {
  enemyposX2 --;
}
if (enemyposY2<flashposY) {
  enemyposY2 ++;
}
if (enemyposY2>flashposY) {
  enemyposY2 --;
}

if (abs (mouseX-enemyposX2-50) < 10 && abs (mouseY-enemyposY2-50) < 10) {
  enemyposX2 = (random(0,500));
  enemyposY2 = 450;
}
  
if (abs( flashposX-enemyposX2) < 20 && abs (flashposY-enemyposY2) < 20) {
  image(dead,flashposX-50,flashposY-100,150,180);
  flashposX = flashposX;
  flashposY = flashposY;
 
gameover = true;
}
//enemy3
if (enemyposX3<flashposX) {
  enemyposX3 ++;
}
if (enemyposX3>flashposX) {
  enemyposX3 --;
}
if (enemyposY3<flashposY) {
  enemyposY3 ++;
}
if (enemyposY3>flashposY) {
  enemyposY3 --;
}

if (abs (mouseX-enemyposX3-50) < 10 && abs (mouseY-enemyposY3-50) < 10) {
  enemyposX3 = 0;
  enemyposY3 = random(0,450);
}
  
if (abs( flashposX-enemyposX3) < 20 && abs (flashposY-enemyposY3) < 20) {
  image(dead,flashposX-50,flashposY-100,150,180);
  flashposX = flashposX;
  flashposY = flashposY;
 
gameover = true;
}
}


if (gameover == false) {
//enemy1
if (treeani<4 && frameCount % 5 == 0) {
treeani ++;
}

if (treeani == 4) {
  treeani = 0;
}
//enemy2
if (rockani<4 && frameCount % 5 == 0) {
rockani ++;
}

if (rockani == 4) {
  rockani = 0;
}
//enemy3
if (bushani<4 && frameCount % 5 == 0) {
bushani ++;
}

if (bushani == 4) {
  bushani = 0;
}
}
if (gameover == true) {
  image(treereg,300,50,150,150);
  image(bushreg,100,400,100,100);
  image(rockreg,400,250,100,100);
}
}

