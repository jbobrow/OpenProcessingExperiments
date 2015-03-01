
float x, y, rectx, recty, r, theta;
int rect=375;
Rectangle rec;


int numb = 1;
Rectangle[] rec_arr = new Rectangle[numb];

void setup()
{
  size(650, 650);
  background(255);
  rec= new Rectangle();
}



void draw()
{
  theta+=.20;
  rec.update();
  rec.display();

}


class Rectangle
{
  Rectangle()
  {
    x=random(width/2);
    y=random(height/2);
    rectx=100;
    recty=100;
  }


  void update()
  {
    r+= .34;
    x = (width/2)+(r*cos(theta));
    y = (height/2)+(r*sin(theta));
  }

  void display()
  {
    pushMatrix();
    translate(x, y);
    rotate(theta);
    rect(0, 0, rectx, recty);
    popMatrix();
  }
}



