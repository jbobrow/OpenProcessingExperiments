
float posX=25;
float posY=40;
float gravity=1;
float floorNum =200;

void setup(){
size(250,250);
}

void draw(){
background(0);
ellipseMode(CENTER);
fill(255,0,0);
stroke(255,0,0);
ellipse(posX,posY,20,20);
posY +=gravity;
if(posY>floorNum){
posY=floorNum;
}
stroke(0,0,255);
line(0,floorNum,250,floorNum);
}

