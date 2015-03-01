
Rope triangleRope;
Rope biRope;
Rope sqRope1;
Rope sqRope2;
float cursorWidth;
RadioButtons tesselType;

void setup(){
  size(750,850);
  triangleRope = new Rope(100,200,240,400);
  biRope = new Rope(375,100,375,400);
  sqRope1 = new Rope(175,175,575,175);
  sqRope2 = new Rope(175,175,175,575);
  cursorWidth = 10;
  ArrayList<String> options;
  options = new ArrayList<String>();
  options.add("Triangle");
  options.add("Square");
  options.add("Line");
  tesselType = new RadioButtons(100,760,150,20,options,color(67,125,212));
}

void draw(){
  background(255);
  strokeWeight(1);
  stroke(200);
  noFill();
  if(mousePressed){
    strokeWeight(2);
    stroke(50);
  }
  ellipse(mouseX,mouseY,cursorWidth*2,cursorWidth*2);
  if(tesselType.pressed==0){
    if(mousePressed){
      triangleRope.move();
    }
    triangleRope.drawMe();
    triangleRope.drawGhost(380,600,240,400);
    triangleRope.drawGhost(380,600,520,400);
    triangleRope.drawGhost(660,200,520,400);
    triangleRope.drawGhost(660,200,380,200);
    triangleRope.drawGhost(100,200,380,200);
  }else if(tesselType.pressed==1){
    if(mousePressed){
      sqRope1.move();
      sqRope2.move();
    }
    sqRope1.drawMe();
    sqRope2.drawMe();
    sqRope1.drawGhost(175,575,575,575);
    sqRope2.drawGhost(575,175,575,575);
  }else if(tesselType.pressed==2){
    if(mousePressed){
      biRope.move();
    }
    biRope.drawMe();
    biRope.drawGhost(375,700,375,400);
  }
  strokeWeight(2);
  stroke(100);
  fill(150);
  rect(-10,750,760,110);
  tesselType.refresh();
  fill(250);
  textSize(10);
  text("Tessella v0.9 by Guillaume Riesen",560,830);
  rect(280,770,240,60);
  fill(100);
  textSize(12);
  text("Click and push to move red lines",290,780);
  text("Mousewheel to change cursor size",290,800);
}

class Rope{
  float x1,y1,x2,y2;
  int nPoints;
  ArrayList<tuple> pointList;
  float tension;
  Rope(float xOne, float yOne, float xTwo, float yTwo){
    x1 = xOne;
    y1 = yOne;
    x2 = xTwo;
    y2 = yTwo;
    nPoints = 100;
    pointList = new ArrayList<tuple>();
    float dx = (x2-x1)/nPoints;
    float dy = (y2-y1)/nPoints;
    for(int i=0;i<nPoints;i++){
      pointList.add(new tuple(i*dx,i*dy));
    }
    tension = .5*cursorWidth;
  }
  void drawMe(){
    strokeWeight(3);
    stroke(color(150,0,0));
    pushMatrix();
    translate(x1,y1);
    float lastX = 0;
    float lastY = 0;
    for(int i=0;i<nPoints-1;i++){
      float x = pointList.get(i).getX();
      float y = pointList.get(i).getY();
      line(lastX,lastY,x,y);
      lastX = x;
      lastY = y;
    }
    line(lastX,lastY,x2-x1,y2-y1);
    popMatrix();
  }
  void drawGhost(float xOne,float yOne,float xTwo, float yTwo){
    strokeWeight(1);
    stroke(100);
    float angle = atan2(yTwo-yOne,xTwo-xOne)-atan2(y2-y1,x2-x1);
    float relSize = sqrt(sq(xTwo-xOne)+sq(yTwo-yOne))/sqrt(sq(x2-x1)+sq(y2-y1));
    float dX = xOne-x1;
    float dY = yOne-y1;
    pushMatrix();
    translate(xOne,yOne);
    rotate(angle);
    scale(relSize);
    float lastX = 0;
    float lastY = 0;
    for(int i=0;i<nPoints-1;i++){
      float x = pointList.get(i).getX();
      float y = pointList.get(i).getY();
      line(lastX,lastY,x,y);
      lastX = x;
      lastY = y;
    }
    line(lastX,lastY,x2-x1,y2-y1);
    translate(-dX,-dY);
    popMatrix();
  }
  
  void move(){
    for(int i = 0;i<nPoints;i++){
      float x = pointList.get(i).getX()+x1;
      float y = pointList.get(i).getY()+y1;
      float dx = x-mouseX;
      float dy = y-mouseY;
      float distance = sqrt(sq(dx)+sq(dy));
      if(distance<cursorWidth){
        //pointList.get(i).setX((cursorWidth/distance*dx)+mouseX);
        //pointList.get(i).setY((cursorWidth/distance*dy)+mouseY);
        movePoint(i,(cursorWidth/distance*dx)+mouseX-x1,(cursorWidth/distance*dy)+mouseY-y1);
      }
    }
  }
        
  void movePoint(int index,float x, float y){
    tension = .5*cursorWidth;
    float dx = x - pointList.get(index).getX();
    float dy = y - pointList.get(index).getY();
    float weight;
    for(int i = index;i<nPoints;i++){
      weight = max(((tension-(i-index))/tension),0);
      pointList.get(i).setX(pointList.get(i).getX()+weight*dx);
      pointList.get(i).setY(pointList.get(i).getY()+weight*dy);
    }
    for(int i = index-1;i>-1;i--){
      weight = max(((tension-(index-i))/tension),0);
      pointList.get(i).setX(pointList.get(i).getX()+weight*dx);
      pointList.get(i).setY(pointList.get(i).getY()+weight*dy);
    }
  }
}

void mouseWheel(MouseEvent event) {
  float e = -1*event.getCount();
  cursorWidth = max(cursorWidth + e,5);
}

void mouseScrolled() {
  if (mouseScroll > 0) {
    cursorWidth = cursorWidth+1;
  } else if (mouseScroll < 0) {
    cursorWidth = max(cursorWidth -1,5);
  }
}
    
class tuple{
  float x;
  float y;
  tuple(float ex,float wy){
    x = ex;
    y = wy;
  }
  float getX(){
    return x;
  }
  float getY(){
    return y;
  }
  void setX(float ex){
    x = ex;
  }
  void setY(float wy){
    y = wy;
  }
}

class RadioButtons{
  int nButtons;
  float w;
  float h;
  float x;
  float y;
  ArrayList<String> labels;
  int currSelection;
  color colour;
  int pressed;
  float depth;
  float ySpacing = 1.25;
  float xD = .6;
  
  RadioButtons(float xp, float yp, float widths, float heights, ArrayList<String> labls,color col){
    x = xp;
    y = yp;
    w = widths;
    h = heights;
    labels = labls;
    nButtons = labels.size();
    colour = col;
    pressed = 0;
    depth = .2*h;
  }
  void refresh(){
    update();
    display();
  }
  void update(){
    if(overEvent() && mousePressed){
      for(int i=0;i<nButtons;i++){
        if(mouseY>y+ySpacing*i*h && mouseY<y+ySpacing*i*h+h+depth){
          pressed = i;
        }
      }
    }
  }
  void display(){
    for(int i=0;i<nButtons;i++){
      float ypos = y+ySpacing*i*h;
      if(i==pressed){
        drawPressed(ypos,i);
      }else{
        drawUnpressed(ypos,i);
      }
    }
  }
  void drawUnpressed(float yp, int id){
    float ypos = yp;
    int i = id;
    fill(blendColor(colour,color(80),HARD_LIGHT));
    noStroke();
    beginShape();
    vertex(x,ypos+h);
    vertex(x+w,ypos+h);
    vertex(x+w+xD*depth,ypos+h+depth);
    vertex(x+xD*depth,ypos+h+depth);
    endShape(CLOSE);
    
    fill(blendColor(colour,color(100),HARD_LIGHT));
    beginShape();
    vertex(x+w,ypos);
    vertex(x+w+xD*depth,ypos+depth);
    vertex(x+w+xD*depth,ypos+h+depth);
    vertex(x+w,ypos+h);
    endShape(CLOSE);
    
    fill(colour);
    rect(x,ypos,w,h);
    fill(blendColor(colour,color(170),DODGE));
    textSize(.6*h);
    textAlign(LEFT,TOP);
    text(labels.get(i),x+.15*h,ypos+.05*h);
  }
  void drawPressed(float yp, int id){
    int i = id;
    float ypos = yp;
    fill(blendColor(colour,color(80),HARD_LIGHT));
    noStroke();
    beginShape();
    vertex(x+xD*depth,ypos+depth);
    vertex(x+w+xD*depth,ypos+depth);
    vertex(x+w+xD*depth,ypos+2*depth);
    vertex(x+xD*2*depth,ypos+2*depth);
    endShape(CLOSE);
    
    fill(blendColor(colour,color(100),HARD_LIGHT));
    beginShape();
    vertex(x+xD*depth,ypos+depth);
    vertex(x+xD*2*depth,ypos+2*depth);
    vertex(x+xD*2*depth,ypos+h+depth);
    vertex(x+xD*depth,ypos+h+depth);
    endShape(CLOSE);
    
    fill(blendColor(colour,color(100),HARD_LIGHT));
    rect(x+xD*1.1*depth,ypos+1.1*depth,w-.05*xD*depth,h-.05*depth);
    fill(blendColor(colour,color(170),DODGE));
    textSize(.6*h);
    textAlign(LEFT,TOP);
    text(labels.get(i),x+.15*h+xD*1.1*depth,ypos+.05*h+1.1*depth);
  }
  boolean overEvent(){
    if(mouseX>x && mouseX<x+w && mouseY>y && mouseY<y+h*ySpacing*nButtons){
      return true;
    }else{
      return false;
    }
  }
}
    


