

// setup global unit size for scalability and simplicity
int   unit=20;

color norm_stroke = color(30,30,30,255);
color norm_fill = color(30,30,30,255);

int   norm_strokeweight = 0;
  
void setup(){
  // main setup routines
  size(600,600);
  smooth();
  background(240);
  
  // setup a grid in the background
  drawGrid();
  
  // draw the circle in bottom left corner
  drawCircle(31*unit,0, height);
  
  // draw 45 degree cross in top left corner
  drawCross(7*unit, 5*unit,5*unit, 45);
  
  noStroke();
  
  // Draw the first rect  
  // from the circle to the top crossing the cross
  beginShape();
  vertex(4*unit,15*unit);
  vertex(5*unit,15*unit);
  vertex(20*unit, 0);
  vertex(19*unit, 0);
  endShape(CLOSE);
  
  // Draw the second rect which ends in a triangular shape
  // Bottom left to upper right
  beginShape();
  vertex(0,26*unit);
  vertex(0,25*unit);
  vertex(5*unit, 25*unit);
  vertex(25*unit, 5*unit);
  vertex(30*unit, 10*unit);
  vertex(21*unit, 10*unit);
  vertex(5*unit, 26*unit);
  endShape(CLOSE);
  
  // Draw the third rect
  // starts in cross goes straight and ends on the right side
  rect(10*unit,13*unit,20*unit,unit);
  
  // Draw the outlined triangle
  // below triangle number 1
  beginShape();
  vertex(22*unit,13*unit);
  vertex(25*unit,10*unit);
  vertex(27*unit, 10*unit);
  vertex(30*unit, 13*unit);
  vertex(29*unit, 13*unit);
  vertex(26*unit, 10*unit);
  vertex(23*unit, 13*unit);
  endShape(CLOSE);  
}

// Reset colors & weights
void resetColors(){
   fill(norm_fill);
   stroke(norm_stroke);
   strokeWeight(norm_strokeweight);
}

void drawGrid() {
  noFill();
  stroke(200);
  strokeWeight(1);
  
  int num=height/unit;
  for(int i=1; i<num; i++) {
      if(i*unit%100==0){
        strokeWeight(2);
      }else {
        strokeWeight(1);
      }
      line(0,i*unit,width,i*unit);
      line(i*unit,0,i*unit,height);
    }
   ellipse(width/2,height/2,5,5);
   resetColors();
}

void drawCircle(int radius, int x, int y){
   noFill();
   strokeWeight(unit);
   
   ellipse(x,y,radius,radius);
   resetColors();
}

void drawCross(int a, int coordX, int coordY, int rotation) {
  
  noStroke();
  
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
  resetColors();
}

