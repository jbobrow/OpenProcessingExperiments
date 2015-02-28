
float x, y;
float angle = 0;
float  r= 400;
float diff = 1;



void setup() {
  size(600, 600);
  background(255, 255, 255);

}

void draw() {
  color col = color(random(200), random(0), random(100),10);

  fill(col);

  x=r* cos(angle);
  y=r* sin(angle);


  noStroke();
  translate(width/2, height/2); 
  rotate(r);

  ellipse(0, 0, x, y);
   ellipse(x, y, 5, 5);
  
  color col2 = color(156, 215, 203);
  
  fill(col2,50);
  rect(x,y,15,15);


  angle = angle + 0.1;
  r = r - diff;

  if (r == 0 || r == 400) {
    diff  = diff * -1;
  }
}
