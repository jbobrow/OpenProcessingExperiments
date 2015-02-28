
//Lots of squares. Hold the mouse or keyboard to relieve eyes.
void setup(){
  size(400,400);
}
void draw(){
noStroke();
for(int yPos = 0; yPos <displayHeight; yPos += 10){
for(int xPos = 0; xPos < displayWidth; xPos += 10){
fill(random(0,255),random(0,255),random(0,255));
rect(xPos,yPos,20,20);
 if (keyPressed == true) {{ //green screen
   fill(0,255,0);
rect(xPos,yPos,20,20);}}
if (mousePressed== true) {{ // red screen
  fill(255,0,0);
  rect(xPos,yPos,20,20);
   }
 }
}
}
}
