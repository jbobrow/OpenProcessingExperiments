
int xpos = 30;
int ypos = 40;

color monsterColor = color(255, 0, 0);

void setup(){
  size(480, 320);
  noStroke();
  smooth();
}

void draw(){
  background(0, 0, 0);
  xpos = mouseX;
  ypos = mouseY;

if((xpos > 200) && (xpos < 320)){
  monsterColor = color(0, 0, 255);
}
else{
  monsterColor = color(255, 0, 0);
}
  
  fill(monsterColor);
  ellipse(xpos, ypos, 40, 40);
  ellipse(xpos, ypos+16, 50, 50);
  fill(255, 255, 255);
  ellipse(xpos-8, ypos-8, 10, 10);
  ellipse(xpos+8, ypos-8, 10, 10);
  fill(0, 0, 0);
  ellipse(xpos-8, ypos-8, 4, 4);
  ellipse(xpos+8, ypos-8, 4, 4);
  fill(255, 255, 255);
  ellipse(xpos, ypos+2, 10, 10);
  ellipse(xpos, ypos+16, 20, 12);  
}


