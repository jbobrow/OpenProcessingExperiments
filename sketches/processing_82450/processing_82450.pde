
Circle[] circles = new Circle[50];
int trailNum = 85;
int prevx[];
int prevy[];
boolean buttonpressed = false;
float tricrosscolor1 = random(0);
float tricrosscolor2 = random(0);
float tricrosscolor3 = random(0);
float tricrosscolor4 = 255;
float tricrosscolor5 = 255;
float tricrosscolor6 = 255;
void setup(){
size(1000,800);
background(random(55),random(5),random(95));
//buttonpressed = 0;
for(int i = 0; i < circles.length; i++){
float x = 108 + i*200;
float y = 130 + i*30;
circles[i] = new Circle(x, y);
prevx = new int[trailNum];
prevy = new int[trailNum];
}
}
void draw(){
//background(0);
for(int i = 0; i < circles.length; i++){
circles[i].move();
circles[i].displayC();
circles[i].change();
}
noFill();
//stroke(0,0,random(155),35);
stroke(tricrosscolor1,tricrosscolor2,tricrosscolor3);
if (buttonpressed){
tricrosscolor1 = tricrosscolor4;
tricrosscolor2 = tricrosscolor5;
tricrosscolor3 = tricrosscolor6;

}else if (!buttonpressed){
tricrosscolor1 = random(0);
tricrosscolor2 = random(0);
tricrosscolor3 = random(0);
}
for(int i = 1; i < trailNum; i++){
prevx[i - 1] = prevx[i];
prevy[i - 1] = prevy[i];
}
prevx[trailNum - 1] = mouseX;
prevy[trailNum - 1] = mouseY;
smooth();
strokeWeight(0);
for(int i = 0; i < trailNum; i ++){
noFill();
triangle(prevx[i], prevy[i],200,100,400,300);
//rotate(radians(PI));
rect(prevx[i], prevy[i], random(10),-65,random(180),-65,40,random(110));
fill(random(90),0,0);
ellipse(50,750,20,20);
}

}
class Circle{
float x, y, angle1, angle2;
float W = random(10.5);
float H = random(20.5);
float exW = random(60);
float exH = random(200.5);
float W2 = random(900);
float H2 = random(200);
float exW2 = random(250);
float exH2 = random(600.5);
//constuctor
Circle(float Cx, float Cy){
x = Cx;
y = Cy;
}
void move(){
//float angle1, angle2;
float ang1 = radians(angle1);
float ang2 = radians(angle2)*sin(20);
x -= (sin(ang2) * 90); //(sin(random(203))));
y += (cos(ang2) * random(10));
//stroke(0,random(70),random(170));
//stroke(24,24,24);
//fill(random(50),random(90),random(50));
//fill (0,0,0);
angle1 *= 10;
angle2 += 80;
}
void displayC(){
stroke(random(0),random(170),random(170), random(100));
strokeWeight(1.5);
noFill();
smooth();
for (int i = 0; i <= 22; i ++){
//rect(x+i, y*i, W2, H2, exW2, exH2);
rect(x+i, y*i, W, H, exW,exH);
//fill(0,0,0);
//rect(x+i,y*i,random(10.5),random(20.5),random(60),random(200.5));
}
}
void change(){
fill(0,0,0);
if(mousePressed){
W = random(0,100);
H = random(0,200);
exH = random(0,250);
exW = random(5,300);
noFill();
}
}
}
void mouseClicked(){

if( dist(mouseX,mouseY,50,750) <= 10){
if (buttonpressed){
buttonpressed = false;
}else{
buttonpressed = true;
}
}
//if ((dist (mouseX,mouseY,50,750) <= 10) && buttonpressed == 1){
// buttonpressed = 2;
// }
}

