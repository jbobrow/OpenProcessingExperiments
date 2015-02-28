
float vx = 2;
float vy = 0;
float x = 0;
float y = 10;
float a; 
float b; 
float c;
float d;
float frictionx = .998;
float frictiony = -.75;
float gravity = .3;
PImage head;
PImage lava;
PImage volcano;
PImage lavaface;
float time;
float facetime;
void setup(){
size(800,800);
imageMode(CENTER);
head = loadImage("head.png");
lava = loadImage("lava.gif");
lavaface = loadImage("lavaface.gif");
volcano = loadImage("volcano.jpeg");
time = 0;
facetime = 0;
}
void draw(){
//image(volcano,800,400); 
background(0);
text(time,400,200);
time += .01;
vy += gravity;
vx *= frictionx;
x += vx;
y += vy;
a = x+40;
b = y+100;
c = x-40;
d = y+100;
float degree = 0;
degree ++;
image(head,x,y);
if(y > height - 90){
y = height - 90;
vy *= frictiony;
time = 0;
}
if (y >= height - 90){
image(lavaface,x,y);
facetime +=5;
}
//else{
//image(head,x,y);
//}
if(x > width - 70){
vx *= -1;
}
if(x < 0){
vx *= -1;
}
//image(head,x,y);
//tint(random(255),0,0);
image(lava,400,500,960,700);
if(mousePressed && dist(mouseX,mouseY,x,y) < 50){
vy -= 2;
}
if(mousePressed && dist(mouseX,mouseY,a,b) < 40){
vy -= 2;
vx -= 2;
}
if(mousePressed && dist(mouseX,mouseY,c,d) < 40){
vy -=2;
vx +=2;
}
//ellipse(x,y, 40,40);
//ellipse(a,b,30,30);
//ellipse(c,d,30,30);
}

