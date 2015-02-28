
float x,y,xv,yv,d;
int s, skeet, shots;
if (.5>random(1)) {x=800;} else {x=0;}
d=100;
y=random(300)+300;
xv=random(1,5);
yv=-(random(1,5)+3);
if (x==800) {xv=-xv;}
s=0;
skeet=1;
shots=0;


 
void setup() {
  size(800, 800);
  smooth();
  cursor(CROSS);
}
 
void draw() {
frameRate(120);
  background(0,200,0,100);
  noStroke();
  fill(0,0,200,100);
  rect(0,0,800,350);
  textAlign(LEFT, BOTTOM);
  fill(0);
 text("Hover of the skeet and click the mouse!", 10, 20);
 text("Skeet hit:",10,40);
 text(s,100,40);
 text("Skeet launched:",10,60);
 text(skeet,100,60);
  
noStroke();
fill (100,100,100,d*4-50);
 ellipse (x,y+d/10,d,d/2,d);
fill (50,50,50,d*4-50);
 ellipse (x,y,d,d/2,d);
 if (d/2>dist(x,y,mouseX,mouseY)) {
    stroke(150,50,50);
    noFill();
   rect(mouseX-50,mouseY-50,100,100);
 } 
 if ((mousePressed) && (d/2>dist(x,y,mouseX,mouseY))) {
    fill(200,200,200);
    ellipse (mouseX,mouseY,50,50);
    for (int i=0; i<2000; i++;) {
    frameRate(1);
       stroke(random(255));
       fill(200,200,200,random(255));
       ellipse(x+random(200)-random(200),y+random(200)-random(200),random(100),random(100));
       }
    d=0; 
    s++;  
    shots++;
  }
   if ((mousePressed) && (d/2<dist(x,y,mouseX,mouseY))) {
  fill(200,200,200);
  ellipse (mouseX,mouseY,50,50);
  shots++;
 }
x+=xv;
y+=yv;
d-=.2;
yv+=.05;
  if (d<=10) {
 skeet++;
  if (.5>random(1)) {x=800;} else {x=0;}
           d=100;
           y=random(300)+500;
           xv=random(1,5);
            yv=-random(1,5);
            if (x==800) {xv=-xv;}
            }
 
  } 

