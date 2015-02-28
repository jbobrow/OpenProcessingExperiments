
size(400,400);
background(191,239,255);

int x;
int y;
x=10;
y=150;

smooth();
strokeCap(SQUARE);

strokeWeight(5);
line(x*17,y,x*17,y+60);
line(x*15,y,x*15,y+60);

strokeWeight(3);
line(x*19.3,y,x*19.3,y+60);

strokeWeight(2);
line(x*21.5,y,x*21.5,y+60);
line(x*21.1,y,x*21.1,y+60);
line(x*16.2,y,x*16.2,y+60);

strokeWeight(1);
line(x*20,y,x*20,y+60);
line(x*22,y,x*22,y+60);
line(x*18.6,y,x*18.6,y+60);
line(x*23.7,y,x*23.7,y+60);
line(x*20.6,y,x*20.6,y+60);
line(x*17,y,x*17,y+60);

void draw(){
//scanner
if((mouseY>150) && (mouseY<210)){
noStroke();
fill(220,20,60,25);
rectMode(CENTER);
rect(x*19.35,y+30,150,10,12,12,12,12);
}
else if((mouseY<150) && (mouseY>210)){

background(191,239,255);
}
}


//text
String s = "2 957  5012394  75";
textSize(10);
rectMode(CORNER);
fill(0);
text(s,x*14.6,y+65,100,20);

