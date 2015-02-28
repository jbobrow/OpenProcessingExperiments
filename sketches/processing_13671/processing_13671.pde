
/*
  The Cell holds a state encoded as an integer
  that is read by the Turmite like a section on
  a Turing Machine's Tape.
  A scene holds a two dimensional array of Cells.
*/

class Cell{
  //Variables
  private int state;
  
  //Constructors
  public Cell(int initState){
    this.state = initState;
  }
  
  //Methods
  /*
  * None!
  */
  
  //Getters & Setters
  public void setState(int newState){
    this.state = newState;
  }
  
  public int getState(){
    return this.state;
  }
}

