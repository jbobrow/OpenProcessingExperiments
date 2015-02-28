
class Matrix{
  color c;

  // The Constructor is defined with arguments.
  Matrix(color tempC) { 
    c = tempC;
  }

  void display() {
    stroke(5);
    fill(c);  
    //Horizontal Lines
    line(10,200,590,200);
    line(10,400,590,400);
    //Vertical Lines
    line(200,10,200,590);
    line(400,10,400,590);
  }
}

