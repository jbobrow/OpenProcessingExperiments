
void	
setup() {	

  size(300, 300);	
  smooth();
  background(255);
}	
float line = 100;
int x=0;
int y=400;	

void draw() {	

  //Big lines from top right and bottom left
  strokeWeight(100);
  stroke(random(0, 255), random(0, 255), random(0, 255));
  line(x+250, x, x+250, x);
  line(y-250, y, y-250, y);
  //line(y, y, y, y);

  //lines from top left
  stroke(random(0, 50), random(0, 10), random(200, 255), 50);
  strokeWeight(5);
  line(x+25, x, x+25, x);
  line(x+50, x, x+50, x);

  line(x+100, x, x+100, x);
  line(x+125, x, x+125, x);


  line(x-25, x, x-25, x);
  line(x-50, x, x-50, x);

  line(x-100, x, x-100, x);
  line(x-125, x, x-125, x);


  // lines from bottom right
  stroke(random(200, 250), random(0, 10), random(0, 50), 50);
  strokeWeight(10);
  line(y, y, y, y);
  line(y-75, y, y-75, y);
  line(y-150, y, y-150, y);
  line(y+75, y, y+75, y);
  line(y+150, y, y+150, y);


  x++;
  y--;
}


