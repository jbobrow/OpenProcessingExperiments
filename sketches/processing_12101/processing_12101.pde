
int crossSize=150;

void setup(){
size(600,600);
smooth();
background(240);

 drawCross(crossSize,width/2, height/2,0);
 //drawGrid();
}

void drawCross(int a, int coordX, int coordY, int rotation) {
  fill(30);
  strokeWeight(20); 
  strokeJoin(ROUND);
  stroke(30);
  
  translate(coordX, coordY);
  rotate(radians(rotation));

  beginShape();

    int posx = 0;
    int posy = 0;
    int x = posx-(a*3/2);
    int y = posy+(a/2);

    vertex(x,y);
    vertex(x+a,y);
    vertex(x+a,y+a);
    vertex(x+2*a,y+a);
    vertex(x+2*a,y);
    vertex(x+3*a,y);
    vertex(x+3*a,y-a);
    vertex(x+2*a,y-a);
    vertex(x+2*a,y-2*a);
    vertex(x+a,y-2*a);
    vertex(x+a,y-a);
    vertex(x,y-a);
    vertex(x,y);

  endShape(CLOSE);
  resetMatrix();
}

void drawGrid() {
  strokeWeight(1);
  stroke(100);
  line(0,599,599,0);
  line(599,599,0,0);
  line(0,300,599,300);
  line(300,0,300,599);
}

