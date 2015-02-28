
int strokeCol;
int mode;
int boxWidth;
int boxHeight;

void setup() {
background(255);
size(1240,920);
mode = 0;
boxWidth = width/3-100;
boxHeight = 75;
}

void draw() {

noStroke();
fill(220);
rectMode(CENTER);
rect(75 + boxWidth/2, height-100,boxWidth,boxHeight);
rect(width/2, height-100,boxWidth,boxHeight);
rect(width - boxWidth/2 - 75, height-100,boxWidth,boxHeight);

  
if((mousePressed) && (mode == 1)){
strokeCol = constrain(abs(mouseX-pmouseX) + abs(mouseY-pmouseY),0,100);
stroke(0+strokeCol*4,200+strokeCol,150);
line(width/2,height/2,mouseX,mouseY);
}

if((mousePressed) && (mode == 3)){
strokeCol = constrain(abs(mouseX-pmouseX) + abs(mouseY-pmouseY),0,40);
fill(255,100,150,100-strokeCol);
ellipse(mouseX, mouseY, strokeCol, strokeCol);
}
}

void mouseClicked(){
if((mouseX > 75) && (mouseX < 75 + boxWidth)){
  if((mouseY > height - boxHeight - 75) && (mouseY < height - 75)){
    mode = 1;
  }
}

if((mouseX > width/2 - boxWidth/2) && (mouseX < width/2 + boxWidth/2)){
  if((mouseY > height - boxHeight - 75) && (mouseY < height - 75)){
    mode = 2;
  }
}

if((mouseX > width - boxWidth - 75) && (mouseX < width - 75)){
  if((mouseY > height - boxHeight - 75) && (mouseY < height - 75)){
    mode = 3;
  }
}
}
