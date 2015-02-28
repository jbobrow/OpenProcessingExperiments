
int dispsize_x = 500;
int dispsize_y = 250;

ArrayList bug_array;
Bug bug1;

void setup()
{
  background(0,0,0);
  size(dispsize_x, dispsize_y);
  bug_array = new ArrayList();
  bug1 = new Bug(50, 100, 100);
}

void draw()
{
  bug1.display();
  
}

class Bug
{
  float bug_size;
  float bug_xpos;
  float bug_ypos;
  float bug_rotation;
  
  
  Bug(float _bug_size, float _bug_xpos, float _bug_ypos)
  {
    this.bug_xpos = _bug_xpos;
    this.bug_ypos = _bug_ypos;
    this.bug_size = _bug_size;
  }
  
  void display()
  {
    noStroke();
    fill(255,200,200);
    ellipse(bug_xpos, bug_ypos, 40, 40);
  }
}
