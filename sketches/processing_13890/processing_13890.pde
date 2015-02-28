
//...................................................
//............................... circle object class
class Circle {
  float x, y;
  float radius;
  int grey, r, g, b;

  //...................................................
  //................... standard object creation method
  Circle(float pcenterX, float pcenterY)
  {
    float travDist, minRad, maxRad, radFactor;

    x = mouseX;
    y = mouseY;

    //find the distance the mouse has traveled since the previous Circle
    travDist=dist(pcenterX, pcenterY, mouseX, mouseY);
    minRad=3; //set minimum randomized radius
    maxRad=5; //set maximum for randomized radius
    radFactor=.125; //scaling factor for the travel distance multiplier

    //set Circle radius
    radius = int( random(minRad,maxRad) * (travDist * radFactor));

    //set colors, 20% randomized grey, 80% randomized color

      grey = int(random(0,100));

    if (grey > 20) {
      r = (int) circleR;
      g = (int) circleG;
      b = (int) circleB;
    }
    else {
      r = int(random(100,200));
      g = r;
      b = r;
    }
  }


  //...................................................
  //..................... object method to draw circles
  void drawCirc()
  {
    noFill();
    smooth();
    strokeWeight(1);
    stroke(r,g,b);
    ellipse(x, y, radius*2, radius*2);
  }
}


