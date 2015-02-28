
class Wall {
 int xPos, yPos;
 color c;
 int wallHeight, wallWidth;

Wall (int tmp_height, int tmp_width) { //constructor of the wall class
 wallHeight = tmp_height;
 wallWidth = tmp_width;
c = color(255);
xPos = width/2;
//yPos = random(height/8, height);
} 

void display(int tmp_x, int tmp_y) {
  xPos = tmp_x;
  yPos = tmp_y;
  
  stroke(c);
  strokeWeight (4);
  fill (0);
  rectMode(CENTER);
  rect (xPos, yPos, wallWidth, wallHeight);
}
 
 int getX() {
   return (xPos);
 }
 int getY() {
   return (yPos);
 }

}



