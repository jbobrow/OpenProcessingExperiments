
void setup() {
  size(640, 640); 
  noStroke(); 
}

int r;
int g;
int b;
int offsetX = 0;
boolean move = false;

void draw() {
  background(0);  

  int gridSize = 40;
  
  for (int x = gridSize; x <= width - gridSize; x += gridSize) {
    for (int y = gridSize; y <= height - gridSize; y += gridSize) {
        if (  dist(x,y,width/2,height/2) <= 300 ) {
          noStroke();
          fill(255);
          stroke(255, 50);
          int rectX = x;
          int rectY = y;
          strokeWeight(1);
       
         int mySize = trackPosition(x,y,3);
          
          ellipse(rectX-1 + offsetX-gridSize/2, rectY-1, mySize, mySize);
          
          line(rectX + offsetX-gridSize/2, rectY, width/2, height/2);
        }
    }
  }
  
  if ( move == true ) { 
    offsetX = (offsetX + 1) % gridSize;
  }
}

int trackPosition(int x, int y, int size) {
  //distanceToCenter = sqrt( sq(mouseX - x-1) + sq(mouseY - y-1) );
      if (dist(x,y,mouseX,mouseY) <= 100) {
        //int r = random(255);
        //int g = random(255);
        //int b = random(255);
        fill((r*x) % 255,(g*y) % 255 ,(b*(x+y)) % 255);
        stroke((r*x) % 255,(g*y) % 255 ,(b*(x+y)) % 255);
        strokeWeight(2);

        size = 3 * size;
        //rectX += (x - mouseX)* 1.5 ;
        //rectY += (y - mouseY) * 1.5;
    
      }
      
      return size;
  
}

void mouseMoved() {
  r = random(255);
  g = random(255);
  b = random(255);
}

void mousePressed() {
  move = !move;
}




