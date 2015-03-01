
float trans=100;

void setup(){
  size(1000,600);
  frameRate(30);
}

void draw(){
  background(0);
  fill(225,225,0);
  strokeWeight(5);
  stroke(225,225,0,trans);
 
  float xstp = 10;
  float lastx = 250;
  float lasty = 20;
  float x = 250;

  for (int y=20; y<=width-20;y+=10)
  {
        trans=random(40,100);
        xstp = random(50)-25;
        x += xstp;
        strokeWeight(random(1,10));
        x=random(width);
        line(x, y, lastx, lasty);
        lastx = x;
        lasty = y;
  }

}
