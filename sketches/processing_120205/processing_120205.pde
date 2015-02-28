
float cx=random(450);
float cy=random(450);
int s=0;
int ct=1;
int t=1000;
int p=0;
int sp=151;
void setup(){
size(500,500);
}
void draw(){
fill(0,255,0);
rect(200,350,80,30);
textSize(30);
if(p==0){
t--;
}
fill(150,150,250);
background(0,0,0);
rect(cx,cy,50,50);
ct++;
if(ct==150-sp&&p==0){
ct=0;
cx=random(450);
cy=random(450);
}
if(mouseX>cx&&mouseX<cx+50&&mouseY>cy&&mouseY<cy+50&&mousePressed&&mouseButton==LEFT&&p==0){
cx=random(450);
cy=random(350);
ct=0;
s=s+1;
}
fill(255,0,0);
text("SCORE:",10,470);
text("TIME:",35,440);
text("SPEED:",17,410);
if(t==0){
textSize(50);
text("GAME OVER",100,150);
text("SCORE:",120,250);
text(s,310,250);
fill(0,255,0);
rect(200,350,80,30);
fill(0,0,0);
textSize(15);
text("RESTART",210,370);
p=1;
}
if(sp>130){
sp=130;
}
if(sp<20){
sp=20;
}
if(mousePressed&&mouseButton==LEFT&&mouseX>200&&mouseX<280&&mouseY>350&&mouseY<380&&p==1){
p=0;
t=1000;
s=0;
ct=100;
}
if(keyPressed&&key=='+'){
sp++;
}
if(keyPressed&&key=='-'){
sp--;
}
fill(255,0,0);
textSize(30);
text(t,115,440);
text(s,125,470);
text(sp,125,410);
fill(70,70,70);
fill(255,0,0);
}


