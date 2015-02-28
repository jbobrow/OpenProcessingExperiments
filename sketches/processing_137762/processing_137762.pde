
//THEME: FINAL PROJECT INTERACTIVE EYE-IRIS SIMULATION
//MOUSE KEYBOARD INPUT


/*
MOUSE 
position x:length
position y: thickness and number of lines to be drawn 
drag:draw

KEYS
0-2 : stroke color
del, backspace:erase
s: save png
*/

//Globalvariables

color strokeColor=color(78,100);

//setup()
void setup() {
  size(720,720);
colorMode(HSB, 360,100,100,100);
noFill();
background(#D7F4FA);
}
//draw()
void draw() {

if(mousePressed){
 
  pushMatrix();
  
translate(width/2,height/2);
//map(value1,start1,start2,stop2);
int circleResolution=(int)map(mouseX+100,0,height,2,10);
int radius=mouseY-width/2;
float angle=TWO_PI/circleResolution/2;

//style
strokeWeight(2);
stroke(strokeColor);

beginShape();
for(int i=0;i<=circleResolution;i++){
float x=0+sin(angle*i)*radius;
float y=0+cos(angle*i)*radius;
vertex(y,x);
}
endShape();
popMatrix();
}
}

//keyPressed()
void keyReleased(){
if(key==DELETE || key==BACKSPACE) background(#D7F4FA);
if(key=='s' || key=='S') saveFrame("screenshot.png");

switch(key){
case '0':

strokeColor=color(100,88,90,66);
break;
case '1':
strokeColor=color(192,100,64,10);
break;
case '2':
strokeColor=color(67,85,79,20);
break;
}
}


