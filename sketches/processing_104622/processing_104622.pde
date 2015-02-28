
void setup () {
  size(800,400);
  background(0);
  
}


void draw () {
  noStroke();
  frameRate(30);
  background(0);
  noCursor();
  fill(frameCount*10%6,frameCount*3%6,frameCount*7%6,255-frameCount/10);
  if (mousePressed){
    background(frameCount*10%6,frameCount*3%6,frameCount*7%6);
  fill(0,0,0,255-frameCount/10);}
  
  ellipse(mouseX-frameCount/8,mouseY-frameCount/8,28,28);
  ellipse(mouseX+frameCount/8,mouseY+frameCount/8,28,28);
  ellipse(mouseX-frameCount/8,mouseY+frameCount/8,28,28);
  ellipse(mouseX+frameCount/8,mouseY-frameCount/8,28,28);
  ellipse(mouseX,mouseY-frameCount/6,28,28);
  ellipse(mouseX,mouseY+frameCount/6,28,28);
  ellipse(mouseX+frameCount/6,mouseY,28,28);
  ellipse(mouseX-frameCount/6,mouseY,28,28);
  
   ellipse(mouseX-frameCount/4,mouseY-frameCount/4,22,22);
  ellipse(mouseX+frameCount/4,mouseY+frameCount/4,22,22);
  ellipse(mouseX-frameCount/4,mouseY+frameCount/4,22,22);
  ellipse(mouseX+frameCount/4,mouseY-frameCount/4,22,22);
  ellipse(mouseX,mouseY-frameCount/3,22,22);
  ellipse(mouseX,mouseY+frameCount/3,22,22);
  ellipse(mouseX+frameCount/3,mouseY,22,22);
  ellipse(mouseX-frameCount/3,mouseY,22,22);
  
   ellipse(mouseX-frameCount*2,mouseY-frameCount*2,10,10);
  ellipse(mouseX+frameCount*2,mouseY+frameCount*2,10,10);
  ellipse(mouseX-frameCount*2,mouseY+frameCount*2,10,10);
  ellipse(mouseX+frameCount*2,mouseY-frameCount*2,10,10);
  ellipse(mouseX,mouseY-frameCount*3,10,10);
  ellipse(mouseX,mouseY+frameCount*3,10,10);
  ellipse(mouseX+frameCount*3,mouseY,10,10);
  ellipse(mouseX-frameCount*3,mouseY,10,10);
  
   ellipse(mouseX-frameCount,mouseY-frameCount,13,13);
  ellipse(mouseX+frameCount,mouseY+frameCount,13,13);
  ellipse(mouseX-frameCount,mouseY+frameCount,13,13);
  ellipse(mouseX+frameCount,mouseY-frameCount,13,13);
  ellipse(mouseX,mouseY-frameCount/0.7,13,13);
  ellipse(mouseX,mouseY+frameCount/0.7,13,13);
  ellipse(mouseX+frameCount/0.7,mouseY,13,13);
  ellipse(mouseX-frameCount/0.7,mouseY,13,13);
  
  ellipse(mouseX-frameCount/2,mouseY-frameCount/2,17,17);
  ellipse(mouseX+frameCount/2,mouseY+frameCount/2,17,17);
  ellipse(mouseX-frameCount/2,mouseY+frameCount/2,17,17);
  ellipse(mouseX+frameCount/2,mouseY-frameCount/2,17,17);
  ellipse(mouseX,mouseY-frameCount/1.5,17,17);
  ellipse(mouseX,mouseY+frameCount/1.5,17,17);
  ellipse(mouseX+frameCount/1.5,mouseY,17,17);
  ellipse(mouseX-frameCount/1.5,mouseY,17,17);
  
  ellipse(mouseX-frameCount*7,mouseY-frameCount*7,3,3);
  ellipse(mouseX+frameCount*7,mouseY+frameCount*7,3,3);
  ellipse(mouseX-frameCount*7,mouseY+frameCount*7,3,3);
  ellipse(mouseX+frameCount*7,mouseY-frameCount*7,3,3);
  ellipse(mouseX,mouseY-frameCount*10,3,3);
  ellipse(mouseX,mouseY+frameCount*10,3,3);
  ellipse(mouseX+frameCount*10,mouseY,3,3);
  ellipse(mouseX-frameCount*10,mouseY,3,3);
  
  ellipse(mouseX-frameCount*5,mouseY-frameCount*5,4,4);
  ellipse(mouseX+frameCount*5,mouseY+frameCount*5,4,4);
  ellipse(mouseX-frameCount*5,mouseY+frameCount*5,4,4);
  ellipse(mouseX+frameCount*5,mouseY-frameCount*5,4,4);
  ellipse(mouseX,mouseY-frameCount*7,4,4);
  ellipse(mouseX,mouseY+frameCount*7,4,4);
  ellipse(mouseX+frameCount*7,mouseY,4,4);
  ellipse(mouseX-frameCount*7,mouseY,4,4);
  
  ellipse(mouseX-frameCount*4,mouseY-frameCount*4,5,5);
  ellipse(mouseX+frameCount*4,mouseY+frameCount*4,5,5);
  ellipse(mouseX-frameCount*4,mouseY+frameCount*4,5,5);
  ellipse(mouseX+frameCount*4,mouseY-frameCount*4,5,5);
  ellipse(mouseX,mouseY-frameCount*5,5,5);
  ellipse(mouseX,mouseY+frameCount*5,5,5);
  ellipse(mouseX+frameCount*5,mouseY,5,5);
  ellipse(mouseX-frameCount*5,mouseY,5,5);
  
  
 ellipse(mouseX-frameCount*3,mouseY-frameCount*3,7,7);
  ellipse(mouseX+frameCount*3,mouseY+frameCount*3,7,7);
  ellipse(mouseX-frameCount*3,mouseY+frameCount*3,7,7);
  ellipse(mouseX+frameCount*3,mouseY-frameCount*3,7,7);
  ellipse(mouseX,mouseY-frameCount*4,7,7);
  ellipse(mouseX,mouseY+frameCount*4,7,7);
  ellipse(mouseX+frameCount*4,mouseY,7,7);
  ellipse(mouseX-frameCount*4,mouseY,7,7);
  
 
  
 
  
  
  ellipse(mouseX,mouseY,frameCount/5,frameCount/5);
  
  
  
  
}
