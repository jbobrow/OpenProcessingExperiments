
/* Letter
Una clase para agrupar los puntos que componen un carácter en concreto.
This class gathers together every point in a certain char.
*/

class Letter {
  
  //The char
  String name;
  //The points
  RPoint[] rPoints; 
  
  //Constructor
  Letter (String name, RPoint[] rPoints) {
    this.rPoints = rPoints;
    this.name= name;
  }
  
  //Getters
  String getName(){
    return name;
  }
  
  RPoint[] getPoints(){
   return rPoints; 
  }
  
  //Display
  void display(int strk){
    stroke(strk);
    beginShape();
    for (int i=0; i<rPoints.length; i++){
      vertex (rPoints[i].x, rPoints[i].y);
    }
    endShape();
  }
  
  //In order to apply a Visitor pattern:
  void accept(LetterVisitor visitor){
    visitor.visit(this); 
  }  
}

/* FancyLetter
Extiende a Letter, permitiendo que cada punto tenga un color propio.
Extends Letter, allowing it to have different colors per vertex.
*/

class FancyLetter extends Letter {
  
  //The colors
  int[] pntColors;
  
  //Constructor
  FancyLetter (String name, RPoint[] rPoints) {
    super (name,rPoints);
    pntColors = new int[rPoints.length];
  }
  
  //Getters
  int[] getCols() {
    return pntColors; 
  }
  
  //Display
  void display(){
    beginShape();
    for (int i=0; i<rPoints.length; i++){
      stroke (pntColors[i]);
      vertex (rPoints[i].x, rPoints[i].y);
    }
    endShape();
  } 
  
}

