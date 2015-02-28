
/*
Theme : 
This is for showing respect to process project. 
When mouse is pressed, thumbs up sign will appear.
The stroke color can be changed by pressing key 1,2 and 3.
The fill color can be changed randomly chosen 5 colors.

Mouse
drag: draw

KEYS
1-3 : stroke color
del,backspace : erase
s: save png

*/

color strokeColor=color(0,80);
color [] ccc ={#2B56F4,#576BB6,#1E3BA8,#0034F4,#152975};
color [] cc2 ={#F40B2D,#B63F50,#A8081F,#F4556C,#750516};
PImage fractal;

void setup(){
  size(1280,720);
  colorMode(HSB,360,100,100,100);
  background(360);
  fractal=loadImage("screenshot.png");
}

void draw(){
  image(fractal,width/2-320,height/2-320,640,640);
  if (mousePressed){
    pushMatrix();
    stroke(strokeColor);
    strokeWeight(5);
    if (mouseX>width/2){
      fill(ccc[int(random(0,5))]);
      rect(mouseX+70,mouseY-80,30,80);
      rect(mouseX,mouseY,100,100);
      line(mouseX,mouseY+25,mouseX+50,mouseY+25);
      line(mouseX,mouseY+50,mouseX+50,mouseY+50);
      line(mouseX,mouseY+75,mouseX+50,mouseY+75);
    }
    if (mouseX<width/2){
      fill(cc2[int(random(0,5))]);
      rect(mouseX,mouseY-80,30,80);
      rect(mouseX,mouseY,100,100);
      line(mouseX+100,mouseY+25,mouseX+50,mouseY+25);
      line(mouseX+100,mouseY+50,mouseX+50,mouseY+50);
      line(mouseX+100,mouseY+75,mouseX+50,mouseY+75);
    }
    popMatrix();
  }
}

void keyReleased(){
  if(key==DELETE||key==BACKSPACE) background(360);
  if(key=='s'||key=='S') saveFrame("final.png");
  
  switch(key){
    case '1':
    strokeColor=color(0,80);
    break;
    case '2':
    strokeColor=color(192,100,90,80);
    break;
    case '3':
    strokeColor=color(52,100,90,80);
    break;
  }
}



