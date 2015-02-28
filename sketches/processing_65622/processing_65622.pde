
class Person
{
  int age;
  int response;
  String name;
  float xpos, ypos;

  Person(int index, String n, int a, int r)
  {
    name = n; 
    age=a; 
    response=r;
    xpos = 30 + (index*width / numPeople); //spaces them out evenly
    ypos = height/2;
  }

  /*A display method. Visualizes each person as an ellipse. Age controlls the size. */
  void display() 
  {
    fill(200);
    stroke(0);
    ellipse(xpos, ypos, age, age);
  }
  void checkHover()
  {
    //Always check this object agaist the mouse. 
    //Age is used for diameter, so if mouse < age/2, we're over the ellipse.
    if ( dist(mouseX, mouseY, xpos, ypos) < age/2 )
    {
      fill(10, 150);
      rect(mouseX, mouseY, 50, 25);
      fill(255);
      text(name, mouseX+15, mouseY+15);
    }
  }
}


