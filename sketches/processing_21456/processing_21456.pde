
int x = 30;
 
void setup(){
size (400,400);
noStroke();
frameRate(15);
}
void draw(){
if (mousePressed == true){
if (mouseX <= 200){ 
fill(random(255),random(255),random(255));
x = random(10,100)
y = random(10,100)
ellipse (mouseX,mouseY,x,y);
}
else {
fill(random(255),random(255),random(255));
x = random(10,100);
rect (mouseX,mouseY,x,x);
}
}
else {
ellipse(width/2, height/2, 150,150);
}
}
