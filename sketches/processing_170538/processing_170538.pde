
int numLines = 30;
Liner[] lines;
float time = 0.0;
float increment = 0.01;
boolean pressedX = false;

void setup()
{
  size(640, 380);
  smooth();
  lines = new Liner[numLines];
  for(int p=0;p<lines.length;p++){
    if(p>0){
      lines[p] = new Liner(p,time,false,lines[p-1]);
    } else {
      lines[p] = new Liner(p,time,false,null);
    }
  }
}

void draw()
{
  time+=increment;
  for (int p = 0; p < lines.length; p++) {
    lines[p].display();
  }
}

void keyPressed(){
  if ((key == 'x' || key == 'X') && !pressedX) {
      pressedX = true;
      background(200);
      for (int p = 0; p < numLines; p++) {
        if(p>0){
          lines[p] = new Liner(p,time,false,lines[p-1]);
        } else {
          lines[p] = new Liner(p,time,false,null);
        }
      }
    }
}

void keyReleased(){
    if ((key == 'x' || key == 'X') && pressedX) {
      pressedX = false;
    }
}

class Liner
{
  float sX, sY, eX, eY, length, n, childChance;
  int point, childCount;
  Liner prevLine;
  Liner[] childLines;
  boolean hasChild = false;
  boolean isChild = false;
  
  Liner(int mult, float t, boolean ic, Liner pl) {
    
    if(ic){
     isChild = true; 
    }
    
    point = mult;
    childCount = (int) random(1,15);
    
    prevLine = pl;
    
    childChance = random(-10,5);
    if(childChance > 0 && !isChild) {
      hasChild = true; 
    }
    
    length = 10;
    
    if(prevLine != null){
      sX = prevLine.returnX();
      sY = prevLine.returnY();
    } else {
      sX = width/2;
      sY = 0;
    }
    
    if(isChild){
      n = noise(t*t*t)*length*(random(-3,3));
    } else {
      n = noise(t)*length*(random(-3,3));
    }
    
    eX = sX+n;
    eY = sY+length;
    
    if(!isChild && hasChild){
      childLines = new Liner[childCount];
      for (int p = 0; p < childLines.length; p++) {
        if(p>0){
          childLines[p] = new Liner(p,time*n,true,childLines[p-1]);
        } else {
          childLines[p] = new Liner(p,time*n,true,this);
        }
      }
    }
  }
  
  void display(){
    strokeWeight(5);
    if(isChild){
      stroke(0,(50*point),0);
    } else {
     stroke((50*point),0,0); 
    }
    line(sX, sY, eX, eY);
    if(hasChild && !isChild){
      for (int p = 0; p < childLines.length; p++) {
        childLines[p].display();
      }
    }
  }
    
  float returnX() {
    return eX; 
  }
  
  float returnY() {
    return eY; 
  }
}
