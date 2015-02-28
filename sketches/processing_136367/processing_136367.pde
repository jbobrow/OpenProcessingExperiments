
// Global Variables

// Square List 
ArrayList<Square> listSquares = new ArrayList<Square>();
// Color Array
color[] colors = {#FFFFFF, #6EB252, #565EFF, #4BFF00, #CC4E14, #B26541};

// Setup the setting
void setup(){
   // Screen Size 
   size(800, 800);
   // Background
   background(255);
   fill(colors[0]);
   // Stroke
   stroke(0, 0, 0, 100);
   smooth();
   // Square Initial
   listSquares.add(new Square(0, 0, width));
}

// Dummy draw
void draw(){
  
}

// Drawing the square
void mouseClicked() {
  
  Square sq = findTheSquare(mouseX, mouseY);
  rect(sq.getX(), sq.getY(), sq.getSize(), sq.getSize());

}

// Find the square where the mouse is clickling in
Square findTheSquare(int pointX, int pointY){
  for(int i = 0; i<listSquares.size(); i++){
     Square sq = listSquares.get(i);
     if(sq.isInSquare(pointX, pointY)){
        listSquares.remove(i);
        
        listSquares.add(new Square(sq.getX(), sq.getY(), sq.getSize()/2));
        listSquares.add(new Square(sq.getX() + sq.getSize()/2, sq.getY(), sq.getSize()/2));
        listSquares.add(new Square(sq.getX(), sq.getY() + sq.getSize()/2, sq.getSize()/2));
        listSquares.add(new Square(sq.getX() + sq.getSize()/2, sq.getY() + sq.getSize()/2, sq.getSize()/2));
        
        return sq; 
     }
  }
  return null;
}

// Choose with the keynumbers different colors
// New graphic with r or R
void keyReleased(){
    if(key == 'r' || key == 'R'){
      background(255);
    }
  
    switch(key){
     case '1':
        fill(colors[0]);
        break;
     case '2':
        fill(colors[1]);
        break; 
     case '3':
        fill(colors[2]);
        break;
     case '4':
        fill(colors[3]);
        break;
     case '5':
        fill(colors[4]);
        break;
     case '6':
        fill(colors[5]);
        break;
    }
}


// Class for saving the squares which are 
// drawn on the Screen
class Square{
 
   // Attributes of the square
   private int x;
   private int y;
   private int size;
  
   // Constructor 
   public Square(int x, int y, int size){
     this.x = x;
     this.y = y;
     this.size = size;
   }
   
   // Is the point in the square?
   public boolean isInSquare(int pointX, int pointY){
      boolean test1 = pointX >= this.x;
      boolean test2 = pointY >= this.y;
      boolean test3 = (pointX <= (this.x + size));
      boolean test4 = (pointY <= (this.y + size));
     
      return test1 && test2 && test3 && test4; 
   }
   
   // GET X
   public int getX(){
      return this.x;
   } 
   
   // GET Y
   public int getY(){
     return this.y;
   }
   
   // GET SIZE
   public int getSize(){
      return this.size; 
   }
  
}


