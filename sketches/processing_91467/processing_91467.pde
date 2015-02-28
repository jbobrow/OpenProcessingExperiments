
int cellCount = 300;
Cell arrCells[] = new Cell[cellCount];
int i;
int j;
float r;
float g;
float b;

void setup() {
  background(0);
  size(511,511);
  for (i=0;i<cellCount;i++) {
    r=random(255);
    g=random(255);
    b=random(255);    
    arrCells[i] = new Cell(color(r,g,b),random(width),random(height)); 
  }
}

void draw() {
  for(i=0;i<cellCount;i++){
    if (mousePressed == true) {
    arrCells[i].moveCell();
    } 
    arrCells[i].display();
  }
}

class Cell {
  color c;
  float xpos;
  float ypos;
  float cellSize;
  float speed;
  float direction;
  float testXpos;
  float testYpos;
  
  Cell(color tempC, float tempXpos, float tempYpos) {
    //color and position are assigned by function
    c = tempC;
    xpos = tempXpos;
    ypos = tempYpos;
    //size, speed and direction are always set randomly, not assigned by function
    direction = random(2*PI)-PI;
    speed = random(3);
    cellSize = 10/(int(speed)+1);
  }
  
  void display() {
    noStroke();
    ellipseMode(CENTER);
    fill(c);
    pushMatrix();
    translate(xpos,ypos);
    ellipse(0,0,cellSize,cellSize);
    popMatrix();
  }
  
  void moveCell() {
    float xstep;
    float ystep;
    color colorstep = color(0,0,0);
    direction = direction + (random(1)-0.5);
    xpos = xpos + cos(direction)*speed+(((mouseX/2)-127)/50);
    ypos = ypos + sin(direction)*speed+(((mouseY/2)-127)/50);
    if(mouseX<(width/3)){
      println("red");
      colorstep = color(10,0,0);
    }else if(mouseX<(width/3)*2){
      println("green");
      colorstep = color(0,10,0);
    }else{
      println("blue");
      colorstep = color(0,0,10);
    }
    if(mouseY<(height/2)){
      c = blendColor(c,colorstep,ADD);
    }else{
      c = blendColor(c,colorstep,SUBTRACT);
    }
    checkBounds();
  }
  
  void checkBounds() {
    if(xpos>width){
      xpos = xpos - width;
    } else if (xpos<0) {
      xpos = xpos + width;
    }
    if(ypos>height) {
      ypos = ypos - height;
    } else if (ypos<0) {
      ypos = ypos + height;
    }
  }

}
