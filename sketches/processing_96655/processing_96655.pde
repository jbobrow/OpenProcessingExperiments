
class Location { // Define a new class called Location
   int row; // row id
   int column; // column id
   Location(int row, int column) {
     this.row = row;
     this.column = column;
   }
 }
 
ArrayList<Location> snake;
 final int COLS = 20;
 final int ROWS = 20;
 


void setup() {
   size(500, 500);
   startOfSnake();
 }
 
void startOfSnake() { //changed from reset to startOfSnake
   snake = new ArrayList<Location>();
   snake.add(new Location(1,3));
   snake.add(new Location(1,2));
   snake.add(new Location(1,1));
 //  addFood.add(new FoodLocation(random(FOOD_ROWS), random(FOOD_COLS)));
 }
 
/*
 void addFood() {
 
   
   How can we have a one block of food come up in a 
   random location?
    
   This didn't work:
    rect(20, 30, 50, 50);  

}
 */
 


void drawSnake(){
   for(Location l : snake){
     drawRect(l);
   }
 }
 
void drawRect(Location l) {
   int w = width / COLS;
   int h = height / ROWS;
   fill(0);
   stroke(255);
   rect(l.column * w, l.row * h, w, h);
 }
 
void draw() {
   background(100);    
   // updateSnake();
     drawSnake();
     
}
 
// Simple test of moving snake to the right
 void keyPressed() {
   int direction = RIGHT;
   if (key == CODED) {
     direction = keyCode;
   }
   // if(!gotFood){
   snake.remove(snake.size() - 1); // remove old tail
   Location head = snake.get(0); // current head
   Location newHead = null;
   
  switch(direction) {
     case RIGHT:
       newHead = new Location(head.row, head.column + 1);
       break;
     case LEFT:
       newHead = new Location(head.row, head.column - 1);
       break;
     case UP:
       newHead = new Location(head.row - 1, head.column);
       break;
     case DOWN:
       newHead = new Location(head.row + 1, head.column);
       break;
   }
    if ( newHead.row>=ROWS)
    {
      newHead.row=ROWS-1;
    }
    if ( newHead.column>=COLS)
    {
      newHead.column=COLS-1;
    }
     if ( newHead.row<0)
    {
      newHead.row=0;
    }
    if ( newHead.column<0)
    {
      newHead.column=0;
    }
   snake.add(0, newHead); // add new head to right of old
 }


