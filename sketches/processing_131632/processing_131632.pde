
//Random Pickup Line Generator:
String [] lines;
int indent = 60;

void setup(){
size(1080, 480);
textSize(18);
fill(0);
colorMode(HSB);
background(255);
frameRate(30);
lines = loadStrings("randomPickupLines.txt");
text(lines[16], 5, height/2);
}

void draw(){
  if(frameCount % 70 == 0){
  background(255);
generateLine();
}
}

void generateLine(){
  fill(0);
  int randY = (int) random(height);
  String randLines = lines[(int) random(lines.length)];
text(randLines, 5, randY);
}

void mousePressed(){
  fill(255,255,255);
  int startX = mouseX;
  int startY = mouseY;
beginShape();
vertex(startX,startY);
bezierVertex(startX, startY, startX+45,startY-45,startX,startY-25);
bezierVertex(startX,startY-25,startX-45,startY-45,startX,startY);
endShape(CLOSE);
}


