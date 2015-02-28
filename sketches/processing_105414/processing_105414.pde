
int x=0;
int y=0;
PImage hampster;
int []x2=new int[100000];
int []y2=new int[100000];
int i=0;
int j=0;
int p=0;
void setup(){
size(1000,700);
background(3,198,255);
frameRate(200);
noStroke();
noFill();
}
void draw(){
x2[i]=x;
y2[i]=y;
i++;
textSize(25);
fill(255,255,255);
if(keyPressed&&keyCode==RIGHT){
rect(x++,y,150,150);
}
if(keyPressed&&keyCode==LEFT){
rect(x--,y,150,150);
}
if(keyPressed&&keyCode==DOWN){
rect(x,y++,150,150);
}
if(keyPressed&&keyCode==UP){
rect(x,y--,150,150);
}
if (mousePressed){
p=1;
}
if(p==1){
hampster=loadImage("hampster.png");
hampster.resize(150,100);
fill(255,255,255);
strokeWeight(3);
stroke(255);
rect(x2[j],y2[j],140,140);
image(hampster,x2[j],y2[j]);
j++;
}
if(x>850){
x=850;
}
if(x<0){
x=0;
}
if(y>550){
y=550;
}
if(y<0){
y=0;
}
fill(0);
text("Use arrow keys to make hampster path.",300,570);
text("Click for hampster.",300,620);
text("Press Spacebar to crate another seperate hampster path.",300,670);
if(keyPressed&&key==' '){
x=0;
y=0;
}
}


