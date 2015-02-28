
class Person
{
  int answer;
  int age;
  int gender;
  float xpos, ypos;
  float nx, ny;
  float ex, ey;

  float x = random(width);
  float y = random(height);


  Person (int an, int a, int g)
  { 
    answer=an;
    age=a;
    gender=g;


  }


  void update() 
  {


        if (answer==2)
        {
          x += 0.01;
          y += 0.011;
          
        nx = noise(x) * 500;
        ny = noise(y) * 600;
        xpos = nx;
        ypos = ny;
        }
        else if (answer==1)
        {
          x += 0.001;
          y += 0.002;
          nx = noise(x)*500;
          ny = noise(y)* 600;
          xpos = nx+width/2;
          ypos = ny;
        }

 

      ex += (xpos-ex) * 0.04;
      ey += (ypos-ey) * 0.04;
    }
 


  void display()
  {
    noStroke();
    fill(gender, 100, 100);
    ellipse(xpos, ypos, age, age);
  }
}


