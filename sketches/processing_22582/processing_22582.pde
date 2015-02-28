
class Circle { //custom class called 'circle'

  PVector pos; //position
  color c; //colour
  float s; //size
  int age; //the 'age' element records the age of the created 'circle'

  Circle( PVector _pos, color _c, float _s  ) { //makes a new 'circle'
    pos = _pos; //take the incoming info and store it
    c = _c;
    s = _s;
  }

  void run() { //runs everything
    render(); // draws the circle
    age++;// creating age +1
    if(age>1000) { // causes the object to remove itself after 'age' reaches 1000
      Circles.remove(this);
    }
  }

  void render() { //draws the circle
    stroke(c,255-age*0.25); // causes the stroke colour to slowly fade over time  
    ellipse( pos.x, pos.y, s+age*0.25,s+age*0.25 ); // draws a circle which will become progressively larger as 'age' increases
  }
}


