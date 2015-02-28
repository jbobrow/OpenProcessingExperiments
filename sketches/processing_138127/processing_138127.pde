
//To draw an interactive sketch
//To implement random values for the strokes of polygon of sides between 0 and 15

/*
HELP:

backspace :- clear canvas
delete :- clear canvas

'b' or 'B' :- to load an image of beach

1 - 5 :- random stroke color
s :- save the canvas

position x :- length
position y :- thickness & number of lines to be drawn
drag :- draw the image

*/

//Global variables
color strokeColor = color(0,10);
PImage beach;
int count = 0;
//setup()
void setup(){
size(1000,700);
beach = loadImage("screenshot.jpeg");
colorMode(HSB, 360, 100, 100, 100);
noFill();
background(360);
}

//draw()
void draw(){
  if(mousePressed){
  pushMatrix();
  translate(width/2, height/2);
  int circleResolution = (int)map(mouseY+100, 0, height, 2, 15);
  int radius = mouseX-width/2;
  float angle = TWO_PI/circleResolution;
  
  strokeWeight(2);
  stroke(strokeColor);
  
  beginShape();
  for(int i=0; i<=circleResolution; i++){
  float x = 0 + cos(angle*i) * radius;
  float y = 0 + sin(angle*i) * radius;
  vertex(x,y);
  }
  endShape();
  popMatrix();
  }
}

//keyReleased()
void keyReleased(){
if (key == DELETE || key == BACKSPACE) 
  background(360);
else if (key == 'b' || key == 'B')
  image(beach, 0,0);
if (key == 's' || key == 'S') 
{
  count++;
  saveFrame("pic"+count+".jpeg");
}

switch(key){
case '1':
strokeColor = color(0,10);
break;
case '2':
strokeColor = color(random(0,360),random(0,100),random(0,100),random(0,100));
break;
case '3':
strokeColor = color(random(0,360),random(0,100),random(0,100),random(0,100));
break;
case '4':
strokeColor = color(random(0,360),random(0,100),random(0,100),random(0,100));
break;
case '5':
strokeColor = color(random(0,360),random(0,100),random(0,100),random(0,100));
break;
}

}

