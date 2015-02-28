
void setup() {
  size(500,500);
  smooth();
}
void draw() {//draw the five squares setting the starting points of the sqares
  normalCoordinates(-50,-50);
  normalCoordinates(50,50);
  normalCoordinates(-150,-150);
  normalCoordinates(-150,50);
  normalCoordinates(50,-150);
}
void normalCoordinates(int x, int y) {
  pushMatrix();//using pushMatrix to stack the drawings...
  translate(width/2, height/2);//setting the centre of window as (0,0)
  scale(1,-1);//reversing the y-axis
  rect(x,y,100,100);//drawing square
  popMatrix();
}


