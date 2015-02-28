
//import Java.util.ArrayList;

Cell[] cells = new Cell[1000];

void setup(){
  size(500,600);
  for(int i=0; i<cells.length; i++){
    cells[i] = new Cell(random(0,width),random(0,height));
  }
}

void draw(){
  Cell eh;
  float dx,dy,nag,sX,sY;
  //filter(ERODE);
  //background(0);
  fill(0,0,0,10);
  rect(0,0,width,height);
  for(int i=0; i<cells.length; i++){
    cells[i].y += 3;
    if (cells[i].y > height+10){
      cells[i].y = -12;
      cells[i].x = random(0,width);
      cells[i].c = color(map(sin(millis()/500.0),-1.0,1.0,0,255), 50, random(200,250));
    } else {
      
      dx = cells[i].x-mouseX;
      dy = cells[i].y-mouseY;
      nag = dx*dx+dy*dy;
      sX = 6000*dx/nag;
      if (abs(sX) > abs(dy)*2){
        sX = 1000; //poof!
      }
      
      fill(cells[i].c);
      stroke(cells[i].c); 
      ellipse( cells[i].x + sX, cells[i].y, 10, 10);
    }
  }
  
  noStroke();
  fill(0,10);
  ellipse(mouseX,mouseY,60,60);
  fill(0,30);
  ellipse(mouseX,mouseY,40,40);
  fill(0,60);
  ellipse(mouseX,mouseY,20,20);
}

class Cell {
  public float x,y;
  public color c;
  public Cell(float X, float Y){
    x = X;
    y = Y;
    c = color(random(30,70), 50, random(200,250));
  }
}

