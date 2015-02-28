
ArrayList<Sand> sand;
ArrayList<Stroke> strokes;

int startX;
int startY;
int endX;
int endY;

int res;
float count;

void setup() {
  size(800, 800);
  background(255);
  sand = new ArrayList<Sand>();
  strokes = new ArrayList<Stroke>();
  noStroke();
  res=5;
  count=0;
  //  frameRate(10);
}

void draw() {
  background(255);
  count+=0.001;
//  stroke(0);
//  strokeWeight(res*2);
//  for(int i=0;i<3; i++){
//   for(int j=0; j<3; j++){    
//     pushMatrix();
//     translate(i*width/4+width/4, j*height/4+height/4);
//    line(0, 0, 100*sin(count), 100*cos(count));
//    popMatrix();
//   } 
//  }
//  noStroke();
  for (int i=0; i<strokes.size(); i++) {
    Stroke st = strokes.get(i);
    if (st.startX>width||st.startX<0||st.startY>height||st.startY<0||
      st.endX>width||st.endX<0||st.endY>height||st.endY<0) {
      strokes.remove(i);
    } else {
      st.create();
    }
  }
  sand.add(new Sand((int)random(width/res)*res));
  for (int i=0; i<sand.size(); i++) {
    Sand s = sand.get(i);
    if (s.xPos>width||s.xPos<0||s.yPos>height) {
      sand.remove(i);
    } else {
      s.movement();
      s.drawSand();
    }
  }
}

void mousePressed() {
  strokes.add(new Stroke(mouseX, mouseY));
  Stroke st = strokes.get(strokes.size()-1);
  line(st.startX, startY, mouseX, mouseY);
}

void mouseReleased() {
  Stroke st = strokes.get(strokes.size()-1);
  st.setEnd(mouseX, mouseY);
}

void keyPressed() {
  if (strokes.size()>0) {
    if(key=='r'||key=='R'){
    strokes.remove(strokes.size()-1);
    }
    if(key=='a'||key=='A'){
      for(int i=0; i<strokes.size(); i++){
    strokes.remove(i);
      }
    }
  }
}

//CLASS////////////////////////////////////////////////////////
class Sand {
  int xPos;
  int yPos;
  color c;
  float grey;

  Sand(int xPos) {
    this.xPos=xPos;
    yPos=0;
    if (xPos<width/6) {
      c=color(255, map(xPos, 0, width/6, 0, 255), 0);
    }
    if (xPos>=width/6&&xPos;<width/3) {
      c=color(map(xPos, width/6, width/3, 255, 0), 255, 0);
    }
    if (xPos>=width/3&&xPos;<width/2) {
      c=color(0, 255, map(xPos, width/3, width/2, 0, 255));
    }
    if (xPos>=width/2&&xPos;<width/3*2) {
      c=color(0, map(xPos, width/2, width/3*2, 255, 0), 255);
    }
    if (xPos>=width/3*2&&xPos;<width/6*5) {
      c=color(map(xPos, width/3*2, width/6*5, 0, 255), 0, 255);
    }
    if (xPos>=width/6*5) {
      c=color(255, 0, map(xPos, width/6*5, width, 255, 0));
    }
  }

  void movement() {
    if (downFree()) {
      moveDown();
    } else {
      if (leftFree()) {
        moveDownLeft();
      }
      if (rightFree()) {
        moveDownRight();
      }
    }
  }

  void moveDown() {
    if ((yPos+res)!=height+res) {
      yPos+=res;
    }
  }


  void drawSand() {
   //stroke(c);
    fill(c);
    rect(xPos, yPos, res, res);
    //point(xPos, yPos);
  }

  boolean downFree() {
    color test = get(xPos, yPos+res);
    
    grey = (red(test)+green(test)+blue(test))/3;
    if (grey<250) {
      return false;
    } else {
      return true;
    }
  }

  boolean leftFree() {
    color test = get(xPos-res, yPos+res);
    grey = (red(test)+green(test)+blue(test))/3;
    if (grey<250) {
      return false;
    } else {
      return true;
    }
  }

  boolean rightFree() {
    color test = get(xPos+res, yPos+res);
    grey = (red(test)+green(test)+blue(test))/3;
    if (grey<250) {
      return false;
    } else {
      return true;
    }
  }
  void moveDownLeft() {
    if ((yPos+res)!=height+res&&xPos;!=0) {
      yPos+=res;
      xPos-=res;
    }
  }

  void moveDownRight() {
    if ((yPos+res)!=height+res&&xPos;!=width) {
      yPos+=res;
      xPos+=res;
    }
  }
}

//CLASS////////////////////////////////////////////////////////

class Stroke {
  int startX;
  int startY;
  int endX=0;
  int endY=0;

  Stroke(int xPos, int yPos) {
    startX=xPos;
    startY=yPos;
  }
  
  void setEnd(int xPos, int yPos){
    endX=xPos;
    endY=yPos;
  }

  void create(){
    stroke(color(0));
  if(endX>0&&endY;>0){
    strokeWeight(res*2);
    line(startX, startY, endX, endY);
    noStroke();
  }else{
    strokeWeight(res);
    
    line(startX, startY, mouseX, mouseY);
    noStroke();
  }
  }
}
