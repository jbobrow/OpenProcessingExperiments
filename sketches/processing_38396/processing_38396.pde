
void setup(){
  size(400,400);
  smooth();
  background(#990000);
  frameRate(30);
}
void draw(){ 
stroke(mouseX, 0 , mouseY);
float distance = dist(pmouseX,pmouseY,mouseX,mouseY);
float maxStroke = 15;
strokeWeight(maxStroke-constrain(distance,0,maxStroke));
line(pmouseX, pmouseY, mouseX, mouseY);
}
void mouseClicked(){
  rectMode(CENTER); fill(mouseY,#66FFFF, mouseX); noStroke();
rect(mouseX, mouseY,#FFFF00,#FF33FF );
}

void keyPressed(){ 
background(0); }
  

