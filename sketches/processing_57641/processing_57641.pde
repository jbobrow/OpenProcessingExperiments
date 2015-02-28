
// A simple recursive tree
// (c) Alasdair Turner 2007

void setup()
{
  size(900,450);
  smooth();
  noLoop();
}

void draw()
{
  background(204);   
  strokeWeight(10);
  translate(width/2,height);
  branch(0);
}

void branch(int depth)
{
    if (depth < 10) {
      line(0,0,0,-height/3);
      pushMatrix();
      {
        translate(0,-height/5);
        rotate(random(-PI/4,PI/4));
        scale(0.7);
        branch(depth + 1);
      }
      popMatrix();
      pushMatrix();
      {
        translate(0,-height/3);
        rotate(random(-PI/4,PI/4));
        scale(0.7);
        branch(depth + 1);
      }
      popMatrix();
    }
}

void mouseClicked()
{
  redraw(); 
}
