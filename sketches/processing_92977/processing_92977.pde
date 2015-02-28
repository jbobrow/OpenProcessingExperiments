
class Flock {
  ArrayList squares; // An arraylist for all the squares
  
  Flock() {
    squares = new ArrayList(); // Initialize the arraylist
  }

  void run() {
    for (int i = 0; i < squares.size(); i++) {
      Square s = (Square) squares.get(i);  
      s.run(squares);  // Passing the entire list of squares to each square individually
    }
  }

  void setColor(color c)
  {
    for(int i = 0; i < squares.size(); i++)
    {
      Square s = (Square) squares.get(i);
      if(!s.hunter)
      s.c = c;
    }    
  }


  void addSquare(Square s) {
    squares.add(s);
  }

}

