
/*
MOUSE
position x : length
position y : thickness and number lines to be drawn
drag: draw

KEYS
1-3 : stroke color
del, backspace : erase
s : save png

*/

color strokeColor=color(105,0,23,10);

void setup(){
size(720,720);
colorMode(HSB,360,100,100,100);
noFill();
background(360);
}


void draw(){
if(mousePressed){
pushMatrix();
translate(width/2,height/2);
//map(value, start1,stop1,start2,stop2);
int circleResolution=(int)map(mouseY+100,0,height,4,8);
int radius=mouseX-width/2;
float angle =TWO_PI/circleResolution;

strokeWeight(2);
stroke(strokeColor);

beginShape();
for(int i=0; i<=circleResolution; i++){
  float x=0+cos(angle*i)*radius;
  float y=0+sin(angle*i)*radius;
  vertex(x,y);
}
endShape();
popMatrix();
}
}

void keyPressed(){
if(key==DELETE || key==BACKSPACE)background(360);
if(key=='s'||key=='S')saveFrame("screenShot.png");

switch(key){
case'1':
strokeColor=color(347,100,41,10);
break;
case'2':
strokeColor=color(347,100,71,10);
break;
case'3':
strokeColor=color(347,100,86,10);
break;
}
}

