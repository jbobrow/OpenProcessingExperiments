
/**
*  25 squares sketch by Txemanu
*/

int noRows = 5;
int noCols = 5;
int squareSize = 80;  // << size of the square
int squareLooseness = 8; 
int gapSize = 4;     // << size of the gaps

int totWidth;
int totHeight;

float oddsToBeRed = (4.0 / 25.0);

ArrayList<Square> squareList;

void setup() {
  
  totWidth = noCols * squareSize + (noCols + 1) * gapSize;
  totHeight = noRows * squareSize + (noRows + 1) * gapSize;
  
  size(totWidth, totHeight);
  
  noStroke();
  
  randomSeed(hour() + minute() + second() + millis());
  prepareSquares();
  
};
void draw() {
  
  background(180); // clear the screen to grey
  
  for(Square square : squareList) {
     square.drawMe(); 
  }  
   // save your drawing when you press keyboard 's'
  if (keyPressed == true && key=='s') {
    saveFrame("yourName.jpg");
  }
  // redraw!
  if (keyPressed == true && key == 'r') {
    squareList.clear();
    prepareSquares();
  }  
}

public void prepareSquares() {
  
    squareList = new ArrayList<Square>();
  
    for (int i = 1; i <= noRows; i++) {    
     int posX = (i * gapSize) + (i - 1) * squareSize;
     
     for (int j = 1; j <= noCols; j++) {       
         int posY = (j * gapSize) + (j - 1) * squareSize;
         
         Square square = new Square(posX, posY);         
         squareList.add(square);
      
     }    
  }   
}

public class Square {
   private int posX;
   private int posY;
   private boolean isRed;  
  /**
  * Constructor
  */
   public Square(int x, int y) {
     this.posX = x;
     this.posY = y;     
     doMagicRandomness();
   }
   /**
    * Do some magic
    */
   private void doMagicRandomness() {
     int rndX = (int)(random(-squareLooseness, squareLooseness));
     int rndY = (int)(random(-squareLooseness, squareLooseness));
     this.posX = posX + rndX;
     this.posY = posY + rndY;
     
     float rnd = random(0, 100);     
     float oddsFloat = (oddsToBeRed * 100.0);    // << fixed value!
 
     isRed = (rnd < oddsFloat); // ? true : false;     
   }
   /**
   * Draw!
   */
   public void drawMe() {
     if (isRed) {
       fill(252, 51, 51, 220); // << red
     } else {
       fill(102, 12, 12, 220); // << brown
     }     
     rect(posX, posY, squareSize, squareSize);     
   }  
}
