
class Person
{
  int age;
  int response;
  String name;
  float xpos, ypos;
  float nx,ny;

  Person(String n, int a, int r)
  {
    name = n; 
    age=a; 
    response=r;
  }
  
  /*A display method. Visualizes each person as an ellipse. Age controlls the size. 
   I decided, somewhat arbitrarily, to position them all in a circle...
   We need to know the index, so we can position them evenly around the circle. */
  void display(int index) //So we pass in i, when we loop through the list of people. 
  {
    noStroke();
    fill(197, 222, 227);
    
    float angleIncrement = TWO_PI / numPeople; //One circle, divided by 10 people.
    //     offset    scaler       pick the angle based on whichone/total
    xpos = width/2 +  150 * cos( index*angleIncrement); 
    ypos = height/2 + 150 * sin( index*angleIncrement);
    xpos += nx;
    ypos += ny;
    ellipse(xpos, ypos, age, age);
    update(index);
  }
  void update(int i) //give a little noise to our ellipses... Makes them feel more like people?
  {
    nx = map(noise(millis()/2600.0+i), 0,1, -20,20);
    ny = map(noise(millis()/2000.0), 0,1, -20,20);
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
  
  //A method to find all the other people with the same answer
  //Parameter is a Person object, passed in, from a for loop inside draw()
  void checkConnections(Person p)
  {
    //only do any of this if we have the same response
    if (response == p.response) {
      if (response==1) //pick color based on response (1 or 0)
        stroke(255, 0, 0);
      else 
        stroke(0, 0, 255);
      strokeWeight(0.5);
      //Draw a line from this object to the other object. 
      line(xpos, ypos, p.xpos, p.ypos);
    }
  }
}


