
Ball balls1[]= new Ball [10];
Ball balls2[]= new Ball [1];
heart hearts[]= new heart [1];
bomb mybomb;
int count=0;
int count1=0;
PImage webImg;
void setup(){
 size(700, 750);
  fill(200);
 rect(0,700,width,height);
String url = "http://th08.deviantart.net/fs71/PRE/f/2012/201/f/5/f5c7577adb4b1e9492fcf2079c366d18-d57xadt.jpg";
  // Load image from a web server
  webImg = loadImage(url, "jpg");
  mybomb= new bomb(20,width/2, (height-95)/2);
  for (int k = 0; k < balls1.length; k++){
      balls1[k]= new Ball(40,color(255,190,90), random(300),random(height-95),int(random(1,5)),int(random(1,5)));
  }
  for (int i= 0; i< balls2.length; i++){
    balls2[i]= new Ball(30,color(60,50,200), random(width),random(height-95),int(random(1,5)),int(random(1,5)));
  }
  for (int h = 0; h < hearts.length; h++){
      hearts[h]= new heart(-10, 625);
  }
}

void draw() {
 count++;
 count1++;
 noStroke();
 fill(200);
 rect(0,0,width,700);   
 if (count1<180){
   textSize(20);
  fill(0);
  text("MOVE WITH WASD OR ARROW KEYS", 250, 450);
  text("TO AVOID TOUCHING THE ORANGE PEOPLE",230,470);
 }
 if (count > int(random(350,400))){
    noStroke();
    fill(255,190,90);
 rect(0,0,width,699);
  }
  if (count > 500){
    count=0;
  }
for (int k=0; k< balls1.length; k++) {
    for (int i=0; i< balls2.length; i++){
if (balls1[k].intersect(balls2[i])) {
balls1[k].reset();
balls2[i].reset();
}
  }
  }
 if (count1 > 80){
  for (int k=0; k< balls1.length; k++){
    balls1[k].display();
    balls1[k].move();
  }
  for (int i= 0; i< balls2.length; i++){
      balls2[i].display();
      balls2[i].move();
  }
 }
  mybomb.display();
 for (int k=0; k< balls1.length; k++) {
  if (mybomb.intersect(balls1[k])) {
mybomb.endgame();
noLoop();
count=0;
}
 }
if(count1>505){
for (int h = 0; h < hearts.length; h++) {
        hearts[h].grow();
        hearts[h].display();
    }
   }
}

void keyPressed(){
  mybomb.move();
}



class Ball {
float r; // radius
float x,y;
color c;
int xspeed;
int yspeed;

Ball(int radius,color tempC, float tempXpos, float tempYpos, int tempXspeed,int tempYspeed) {
    r=radius;
    c = tempC;
    x = tempXpos;
    y = tempYpos;
    xspeed = tempXspeed;
    yspeed= tempYspeed;
  }


void move() {
  x=x+xspeed;
  y=y+yspeed;
  if (x > width || y > height-95){
    xspeed= -xspeed;
    yspeed= -yspeed;
  }
  if (x < 0 || y < 0){
    xspeed= -xspeed;
    yspeed= -yspeed;
  }
}


void reset(){
x = random(width);
y = random(height-95);
xspeed = int(random(1,5));
yspeed= int(random(1,5));
fill(200);
rect(0,0,width,700);
}

void display() {
stroke(250,185,40);
fill(c);
ellipse(x,y,r*2,r*2);
}

boolean intersect(Ball b) {
// Objects can be passed into functions as arguments too!
float distance = dist(x,y,b.x,b.y); // Calculate distance

// Compare distance to sum of radii
if (distance < r + b.r) {
return true;
}
else {
return false;
}
}
}



class bomb{
float r; // radius
float x;
float y;

bomb(int radius,float tempXpos, float tempYpos) {
    r=radius;
    x = tempXpos;
    y = tempYpos;
  }


void move() {
//put under void keyPressed()
  if (key == CODED) {
    if (keyCode == UP) {
      y = y-10;
    }  if (keyCode == DOWN) {
      y = y+10;
    }
    if (keyCode == RIGHT) {
      x = x+10; 
  }
   if (keyCode == LEFT) {
      x = x-10;
}
  }
  if (key == 'a' || key == 'A') {
      x = x-10;
  }
  if (key == 'd' || key == 'D') {
      x = x+10;
  }
  if (key == 's' || key == 'S') {
      y = y+10;
  }
  if (key == 'w' || key == 'W') {
      y = y-10;
  }
 x= constrain(x,0,width);
 y= constrain(y,0,height-140);
}


void endgame(){
x = width/2;
y = (height-95)/2;
noStroke();
fill(0);
rect(0,0,width,629);
imageMode(CENTER);
image(webImg, 230, 350);
}

void display() {
noStroke();
fill(60,50,200);
beginShape();
vertex(x-15,y+50);
vertex(x-25,y+90);
vertex(x-10,y+90);
vertex(x,y+55);
vertex(x+15,y+50);
vertex(x+25,y+90);
vertex(x+10,y+90);
vertex(x,y+55);
endShape();
ellipse(x,y+54,38,40);
ellipse(x,y+30,15,15);
stroke(60,50,200);
strokeWeight(10);
line(x-10,y,x-15,y+40);
line(x+10,y,x+14,y+40);
strokeWeight(4);
stroke(255,0,0);
fill(40);
ellipse(x,y,r*2,r*2);
}

boolean intersect(Ball b) {
// Objects can be passed into functions as arguments too!
float distance = dist(x,y,b.x,b.y); // Calculate distance

// Compare distance to sum of radii
if (distance < r + b.r) {
return true;
}
else {
return false;
}
}
}



class heart{
int x=-10;
int y;
int count = 505;
int w=0;
color c = color(random(0,255),random(0,255),random(0,255));
  
heart(int tempx, int tempy){
  x = tempx;
  y = tempy;
}
   
 void display(){
  smooth();
    noStroke();
    fill(255, 0, 0, 150);
    beginShape();
    vertex(50+x, 25+y);
    bezierVertex(50+x, -5+y, 120+x, 5+y, 50+x, 60+y);
    vertex(50+x, 25+y);
    bezierVertex(50+x, -5+y, -20+x, 5+y, 50+x, 60+y);
    endShape();
    stroke(255,0,0,150);
    strokeWeight(2);
    line(50+x,25+y,50+x,58+y);
}
  
void grow(){
  count++;
  if (count > 505){
    count=0;
    x= x + w;
    y=695;
    w=65;
}
 }

}

