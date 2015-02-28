
import netscape.javascript.*;

void setup() {
  size(1000,1000);
background(10);
stroke(255,255,255,10);
frameRate(10);

PFont font;
// The font must be located in the sketch's 
// "data" directory to load successfully
font = loadFont("Serif-48.vlw"); 
textFont(font); 
text("Mohan's first sketch in  processing", 175, 450); 
fill(0, 102, 53);
text("Mohan's first sketch in  processing", 175, 500); 
fill(0, 102, 153, 51);
text("Mohan's first sketch in  processing", 175, 550); 

}

void draw() {
for(int i=0;i<50;i++){
stroke(random(255),random(255),random(255),random(20));
int x1=int(random(1000));
int y1=int(random(1000));
int x2=int(random(1000));
int y2=int(random(1000));
 line(x1,y1,x2,y2);
}
}


