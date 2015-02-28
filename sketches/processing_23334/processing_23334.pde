
class Snow {

  PVector pos; // position
  color c; // colour
  float s; // size
  int age;// age of object, age elements record the age of the created 'dot'


  Snow( PVector _pos, color _c, float _s  ) { // constructor - makes a new object
    pos = _pos; // take the incoming info and store it
    c = _c;
    s = _s;
  }

  void run() { // master controller
    render(); // draw it
    age++;// creating age +1
    if(age>700 ) { // causes the object to remove itself after 'age' reaches 600
      Snowing.remove(this);
    }
  }

  void render() { // draws the object
    fill(0,180,200);
    stroke(0);
    strokeWeight(.4);
    ellipse(pos.x, pos.y, s-age*0.1,s-age*0.1); //s-age*0.1 defines the the speed which the ellipse changes size
    noFill();
    stroke(0,0,255); 
    strokeWeight(.5);//possible to descrease the stroke weight below 1
    ellipse(pos.x, pos.y+age*0.03, s+age*0.1,s+age*0.1);
    stroke(0);
    strokeWeight(0.4); 
    ellipse(pos.x, pos.y, s+age*4,s+age*4);//-age causes the ellipse to shrink into itself +age causes the ellipse to grow
  }
}


