
int linkX = 285;
int linkY = 530;
 
int e1x = 100;
int e1y = 150;
boolean e1right = true;
 
int e2x = 300;
int e2y = 420;
boolean e2right = false;
 
int kx = random(100,300);
int ky = random(100,500);
boolean kup = true;
boolean kright = true;
 
int health = 3;
 
int won = 0;
 
PImage navi;
PImage link;
PImage ranch;
PImage octo;
PImage chest;
PImage win;
PImage lose;
PImage keese;

void setup() {  // this is run once.   
    size(400, 600);
    frameRate(60);
    
    // Load image from a web server
    navi = loadImage("http://i.imgur.com/h4lU6Id.png");
    link = loadImage("http://i.imgur.com/JZZS5X5.png");
    ranch = loadImage("http://i.imgur.com/WPr7fGR.png");
    octo = loadImage("http://i.imgur.com/v37TnJr.png");
    chest = loadImage("http://i.imgur.com/LrTobCm.png");
    win = loadImage("http://i.imgur.com/30YLJSh.png");
    lose = loadImage("http://i.imgur.com/5NhQjyU.png");
    keese = loadImage("http://i.imgur.com/W5HRj3T.png");
    
} 
 
void draw() {  // this is run repeatedly.  
 
    noCursor();
    background(ranch);
    imageMode(CENTER);
    
    image(chest,180,20,32,32);
    
    image(link,linkX,linkY,34,46);
    image(navi,mouseX+12,mouseY-5);
    image(octo,e1x,e1y);
    image(octo,e2x,e2y);
    image(keese,kx,ky,40,24);
    
    fill(255,0,0);
    text("Health: " + health, 290, 580);
    
    if (abs(linkX - mouseX) < 120 && abs(linkY - mouseY) < 120) {
        if (mouseX > linkX) {
            linkX+=.5;
        }
        if (mouseX < linkX) {
            linkX-=.5;
        }
        if (mouseY > linkY) {
            linkY+=.5;
        }
        if (mouseY < linkY) {
            linkY-=.5;
        }
    }
    
    if (e1right == true) { e1x++; }
    else if (e1right == false) { e1x--; }
    
    if (e1x >= 360) { e1right = false; }
    if (e1x <= 40) { e1right = true; }
    
    if (e2right == true) { e2x++; }
    else { e2x--; }
    
    if (e2x >= 360) { e2right = false; }
    if (e2x <= 40) { e2right = true; }
    
    if (kx >= 360) { kright = false; }
    if (kx <= 20) { kright = true; }
    if (ky >= 560) { kup = true; }
    if (ky <= 20) { kup = false; }
    
    if (kup == true) { ky--; }
    else { ky++; }
    if (kright == true) { kx++; }
    else { kx--; }
    
    imageMode(CORNER);
    
    if (won == 1) {
        image(win,0,0);
    }
    
    if (health < 1 && won != 1) {
        image(lose,0,0);
    }
    
    if (collide(linkX-17,linkY-23,linkX+17,linkY+23, 180, 20, 212, 52)) {
        won = 1;
    }
    
    if (collide(linkX-17,linkY-23,linkX+17,linkY+23, e1x-20, e1y-20, e1x+20, e1y+20)) {
        linkY += 50;
        health--;
    }
    
    if (collide(linkX-17,linkY-23,linkX+17,linkY+23, e2x-20, e2y-20, e2x+20, e2y+20)) {
        linkY += 50;
        health--;
    }
    
    if (collide(linkX-17,linkY-23,linkX+17,linkY+23, kx-20, ky-12, kx+20, ky+12)) {
        linkY += 50;
        health--;
    }
}
 
boolean collide(float left, float top, float right, float bottom,float otherLeft, float otherTop, float otherRight, float otherBottom) {
    return !(left > otherRight || right < otherLeft || top > otherBottom || bottom < otherTop);
}
