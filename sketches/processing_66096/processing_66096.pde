

void setup() {
  size(800,500);
    background(255,255,0);
  smooth();
  frameRate(5);
}

void draw (){
  //framecount is set as greyscale value
stroke(frameCount*3);


noFill();
rectMode(CORNER);
rect(pmouseX,pmouseY,100,100);
rect(mouseX,mouseY,100,100);
strokeWeight(5);
line(pmouseX,pmouseY,mouseX,mouseY);
line(pmouseX+100,pmouseY+100,mouseX+100,mouseY+100);
line(pmouseX,pmouseY+100,mouseX,mouseY+100);
line(pmouseX+100,pmouseY,mouseX+100,mouseY);

}

void keyPressed(){
  if (key == 'b') 
    background(255,255,0);
   if (key == 'x') 
    frameCount=0;
  } 

