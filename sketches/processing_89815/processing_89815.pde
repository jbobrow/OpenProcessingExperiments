
ArrayList<Integer> Qx, Qy;
int wp, hp;
int curX, curY, curCol, newCol;
boolean busy = false;
boolean mousePushed = false; 
 
void setup() {
  size(400, 400);
  noSmooth();
 
  paintShapes(10);
  loadPixels();
 
  Qx = new ArrayList<Integer>();
  Qy = new ArrayList<Integer>();
}
 
//////////////////////////////
 
void draw() {
 
  pushStyle();
  popStyle();
 
 
  if (!mousePushed) loadPixels();
 
  if (min(Qx.size(), Qy.size()) == 0) busy = false;
  else busy = true;
 
 
  // ArrayList loop
  for (int i = min(Qx.size()-1 , Qy.size()-1); i >= 0; i--) { 
    curX =  Qx.get(i);
    curY =  Qy.get(i);
 
    Qx.remove(i);
    Qy.remove(i);
 
    addValidXY(curX+1, curY);
    addValidXY(curX-1, curY);
    addValidXY(curX, curY+1);
    addValidXY(curX, curY-1);
 
    putXY(curX, curY, color(newCol));
  }
  // ArrayList loop end
 
  updatePixels();
 
  if (mousePushed & busy) {
    pushStyle();
    fill(255, 0, 0, 100);
    noStroke();
    rect(0, 0, width, height);
 
    fill(0);
    textAlign(CENTER, CENTER);
 
    textSize(width/("Working...".length()+2));
    text("Working...", width/2, height/3);
 
    textSize(width/("Size of queue:".length()+2));
    text("Size of queue:", width/2, height/2);
 
    textSize(width/((""+min(Qx.size(), Qy.size())).length()+2));
    text(min(Qx.size(), Qy.size()), width/2, height/1.5);
 
    popStyle();
  }
}
 
/////////////////////////////
/////////////////////////////
 
//Drawing/Checking functions
 
boolean addValidXY(int px, int py) {
  if ((px < 0 || px >= width) || (py < 0 || py >= height)) return false;
  else if (color(getXY(px, py)) != color(curCol)) return false; 
  else if (isDuplicity(px, py)) return false;
  else {
    Qx.add((int) px);
    Qy.add((int) py);
    return true;
  }
}
 
 
boolean isDuplicity(int px, int py) {
 
  for (int i = min(Qx.size()-1 , Qy.size()-1); i >= 0; i--) { 
    int storedX =  Qx.get(i);
    int storedY =  Qy.get(i);
 
    if ((storedX == px) && (storedY == py)) return true;
  }
 
  return false;
}
 
int getXY(int px, int py) {
  if (px >= width) px = width-1;
  if (py >= height) py = height-1;
  return pixels[height*py+px];
}
 
boolean putXY(int px, int py, color pc) {
  boolean result = true;
 
  if (px >= width) {
    px = width-1;
    result = false;
  }
 
  if (py >= height) {
    py = height-1; 
    result = false;
  }
 
  pixels[height*py+px] = pc;
  return result;
}
 
 
void paintShapes (int border) {
  pushStyle();
  wp = (width/100)*border;  
  hp = (height/100)*border;  
 
  strokeWeight(5);
 
  stroke(#501DCB);
  fill(#986CFF);
  beginShape();
  vertex(wp*2, hp*2);
  vertex(wp*2, hp);
  vertex(width-1-wp*2, hp);
  vertex(width-1-wp*2, hp*2);
  vertex(width-1-wp, hp*2);
  vertex(width-1-wp, height-1-hp*2);
  vertex(width-1-wp*2, height-1-hp*2);
  vertex(width-1-wp*2, height-1-hp);
  vertex(wp*2, height-1-hp);
  vertex(wp*2, height-1-hp*2);
  vertex(wp, height-1-hp*2);
  vertex(wp, hp*2);
  endShape(CLOSE);
 
  stroke(#E88915);
  fill(#FCB04C);
  rect(0, 0, wp+wp/2, hp+hp/2);
  rect(width-1-wp-wp/2, 0, wp+wp/2, hp+hp/2);
  rect(width-1-wp-wp/2, height-1-hp-hp/2, wp+wp/2, hp+hp/2);
  rect(0, height-1-hp-hp/2, wp+wp/2, hp+hp/2);
 
  stroke(#3D81D8);
  fill(#74B1FF);
  ellipse(width/2, height/2, wp*5, hp*5);
 
  textAlign(CENTER, CENTER);
  fill(255);
 
 
  popStyle();
}
 
 
void mousePressed() {
  mousePushed = true;
  if (!busy) {
    Qx.add((int) mouseX);
    Qy.add((int) mouseY);
    curCol = getXY(mouseX, mouseY);
    newCol = color(random(0, 255), random(0, 255), random(0, 255));
  }
}
 
void mouseReleased() {
  mousePushed = false;
  updatePixels();
}
