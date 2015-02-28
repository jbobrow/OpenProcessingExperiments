
Fur redFur1;
Fur redFur2;
Fur redFur3;
Fur redFur4;
Fur redFur5;
Fur redFur6;


void setup() {
  size(600,600 );
  background(240,190,70);  
 redFur1 = new Fur(color(255,random(255),random(255),50),300,100,1);
 redFur2 = new Fur(color(255,random(255),random(255),50),200,400,15);
 redFur3 = new Fur(color(255,random(255),random(255),50),150,250,30);
 redFur4 = new Fur(color(255,random(255),random(255),50),600,1,45);
 redFur5 = new Fur(color(255,random(255),random(255),50),420,500,60);
 redFur6 = new Fur(color(255,random(255),random(255),50),500,599,75);

}


void draw() {
 redFur1.run();
 redFur1.show();
 redFur2.run();
 redFur2.show();
 redFur3.run();
 redFur3.show();
 redFur4.run();
 redFur4.show();
 redFur5.run();
 redFur5.show();
 redFur6.run();
 redFur6.show();

}
class Fur{
  color c;
  float xpos;
  float ypos;
  float xspeed;
  
  Fur(color tempC, float tempXpos, float tempYpos, float tempXspeed){
    c = tempC;
    xpos =tempXpos;
    ypos =tempYpos;
    xspeed = tempXspeed;
  }

void show() {
 stroke(68,165,130);
fill(255,random(255),random(255),50);
 curve(xpos, ypos,xpos+ypos,xpos+xspeed,ypos+xspeed,ypos-xpos,TWO_PI,HALF_PI); 

ellipseMode(CENTER);
int steps = 6;
for (int i = 0; i <= steps; i++) {
  float t = i / float(steps);
  float x = curvePoint(xpos, ypos, 73, 73, t);
  float y = curvePoint(ypos, xpos, 24, 61, t);
  ellipse(x, y, 10, 10);
  x = curvePoint(xpos+xspeed, ypos+xspeed, 73, 15, t);
  y = curvePoint(ypos+xspeed, xpos+xspeed, 61, 65, t);
  ellipse(x, y, 10, 10);
}
}
  
void run(){
  xpos = xpos+ xspeed;
  if (xpos> width){
    xpos =0;
  }
}
}

