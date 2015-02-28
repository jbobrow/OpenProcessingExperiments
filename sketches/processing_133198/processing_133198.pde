
PImage i;
PImage cHar;
PVector pos = new PVector(0, 200);
float yvel = 0;
boolean bool = false;
import java.io.*;
void setup() {
 size(400, 400); 
 noCursor();
 i = loadImage("Untitled.png");
 cHar = loadImage("char.png");
}
void draw(){
  background(255);
    pos.y += yvel;
  if(i.get((int)pos.x, (int)pos.y) == 16777215) {
   fill(0);
   yvel += 0.4;
  }else if(!(pos.y < 189 && pos.x < 50)){
   yvel = -10;
  fill(255);
   bool = true;
  }
  
  image(i, 0, 0);
  ellipse(mouseX, mouseY, 10, 10);
  image(cHar, pos.x-cHar.width/2, pos.y-cHar.height);
  if(keyPressed && key == 'd'){
    pos.x ++;
  }
  if(keyPressed && key == 'a'){
   pos.x--; 
  }
  text(i.get((int)pos.x, (int)pos.y), 15, 15);
  ellipse(pos.x, pos.y, 10, 10);
//  pos = new PVector(50+cHar.width/2, 50+cHar.height);
}


