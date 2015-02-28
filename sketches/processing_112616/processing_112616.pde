
void setup() {
  size(800, 800);}
void draw() {
  

  background(0, 0, 0);
  strokeWeight(random(0.15));
  stroke(255);
  

  for (int r=0; r<height; r=r+8)
  {
    for (int i=0; i<width; i=i+50)

    {
      float t = random(width);
      float y= random(height);
      float w= random(400);
      //{if (i%3==0 && r%3==0)

      //line(i-5, 5, i-5, r-5);

      //if (i%3==0 && r%3==0)
      //{line(i,t,w,y);
      //line(5.5,r-5.5,i-5.5,r-5.5);}
      //line(i, 0, i, r);
      //line(0,r,i,r);



      noFill();
      triangle(t/3, y/3, i/4, t/4, r/4, w/4);
      ellipse(t/1.3, y/1.3, i/1.3, r/1.3);
      ellipse(i/2, r/2, t/2, y/2);
      line(t, i, r, y);

      line(2*t, 2*i, 2*r, 2*y);
    }
  }
  }
