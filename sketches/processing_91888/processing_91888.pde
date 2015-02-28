
class FloodIt{  
  int x=0;
  int y=0;
  int c=6; // colour chosen
  int counter = 0;
  int turns = 0;
  int maxTurns = 28;
  color c0= color(0) ; // last colour
  boolean win = false; // winner?

  // constructor
  FloodIt(){}

  void newGame() {
    if(mousePressed){
      if(450 < mouseX && mouseX < 575 && 250 < mouseY && mouseY < 278){
        startingColours();
        f = new FloodIt();
      }
    }
  }
  
  void buttons() {
    int distance = 450; 
    int c = -1;
    int ypos = 40;
    
    // Text
    fill(0);
    textSize(14); 
    textAlign(0);
    text("Choose a colour:",distance,30);
    
    // Colours to choose
    for(int j=0; j < 2; j++){
      distance = 400;
      for(int i=0; i < 3; i++){
        c++;
        distance += 50;
        stroke(1);
        fill(t.colour[c]);
        rect(distance,ypos,30,30);
        noStroke();
      }  
      ypos += 50;
    }
  }
  
  void startingColours(){
    // Paint 2D array
    for (int i = 0; i < t.rows; i++) {
      for (int j = 0; j < t.cols; j++) {
        t.squares[i][j] = t.colour[int(random(0,6))];
      }
    }
  }
  
  // choose a colour
  void select() {
    int ypos = 40;
    if(mousePressed){
      for(int i=0; i<2; i++){
      int xpos = 450;
      if(ypos < mouseY && mouseY < ypos+30) {
        for(int j=0; j<3; j++){
          if(xpos<mouseX && mouseX<xpos+30) {
            c = i*3 + j;
          }
          xpos += 50;  
        }
      }
      ypos += 50;
      }
    }
  }
    
  void paint(){
    if(win) {
      fill(255);
      textSize(32); 
      textAlign(CENTER);
      text("You Win!",210,210);
      println("You Win");      
    } else if(turns < maxTurns){
      // turns counter
      fill(0);
      textSize(32); 
      textAlign(0);
      text(turns,450,200);
      text("/"+maxTurns, 490, 200);
      println(mouseX + " " + mouseY);
      
      // save the last colour stored on that square
      c0 = t.squares[0][0]; 
      select(); // gives 'c' a value
      if(c0 != t.colour[c] && c < 6 && c > -1){     
        t.squares[0][0] = t.colour[c];
        changeAround();
        turns++;
      } 
      t.update(); // draw the squares again
    } else {
      // You lose
      fill(255);
      textSize(32); 
      textAlign(CENTER);
      text("You Lose!",210,210);
      println("You Lose");    
    }   
    
    // check if you win
    for (int i = 0; i < t.rows; i++) {
      for (int j = 0; j < t.cols; j++) {
        // Count squares of the same colour
        if(t.squares[i][j] == t.colour[c]){
          counter++;
         }
      }
    }
    if(counter<196){
      counter = 0;
    } else win = true;
    x=0; y=0; // leave x and y untouched
    //end of win check
    
  } // end of paint
  
    // change colours around
  void changeAround(){
    // remember that x = 0, y = 0
    x++;
    replaceSquare();
    x--;
    y++;
    replaceSquare();
    y-=2;
    replaceSquare();
    y++;
    x--;
    replaceSquare();
    x++;
    
  } // end of changeAround
  
  // it replaces a square only if its colour is c0 and it's not out of bounds
  void replaceSquare(){
    if(x >-1 && x<14 && y >-1 && y<14){
      if(t.squares[x][y] == c0){
        t.squares[x][y] = t.colour[c];
        changeAround();
      }
    }
  }
  
} // end of FloodIt

