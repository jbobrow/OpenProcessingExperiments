
Triangle t;

void setup()
{
  size(400, 400);
  t = new Triangle(200, 200, 300, 200);
}

void draw()
{
  background(0);
  t.draw();
}


//isosceles horizontal hypotenuse
class Triangle {
  PVector position;
  float hypotenuse;
  float h;

  Triangle(float _x, float _y, float _hypotenuse, float _h)
  {
    position = new PVector(_x, _y);
    hypotenuse = _hypotenuse;
    h = _h;
  }

  void draw()
  {
    //(mouseX < map(mouseY, -h/2, h/2, position.x-hypotenuse/2, position.x) && 
    boolean rollOver = (mouseX < map(mouseY, position.y+h/2, position.y-h/2, position.x+hypotenuse/2, position.x)
      && mouseX > map(mouseY, position.y+h/2, position.y-h/2, position.x-hypotenuse/2, position.x) 
      && mouseY < position.y+h/2);

    if (rollOver)
      fill(0, 255, 0);
    else
      fill(255);

    pushMatrix();
    translate(position.x, position.y);
    beginShape();
    vertex(- hypotenuse/2, h/2);
    vertex(+ hypotenuse/2, h/2);
    vertex(0, -h/2);
    vertex(- hypotenuse/2, h/2);
    endShape();
    popMatrix();
  }
}

