
//the rules of this design are the stroke and 
//weight of the lines are determined by their randomly selected length 

int x;
float y;

void setup() {
  size(500, 500);
  background(0);
  smooth();
}
void draw() {
  float x=floor(random(250));//chooses a random integer to make each of the lines
  strokeWeight(x/50);//line length divided by 50 to determine weight
  stroke(x+50,0,150-x,125);//line length added or subtracted from red and blue
  line(x, y, width/2, y);//lines on left side of drawing
  line(width/2, y, width-x, y);//lines on right side of drawing
  y++;
}
//loops lines when clicked
void mousePressed() {
  background(0);
  y=0;
}


