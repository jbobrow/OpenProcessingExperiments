
//creating a program that makes Tic-Tac-Toe where two human players.
//Player one controlls the mouse by clicking on the letter O to place an O on the selected tile
//Player two uses the mouse to click on the selected tile to place an X
//To clear the game, press the key C and it will automatically place an O on the selected tile clearing the board as well

void setup(){
  size(300,300);
  background(255,255,0);
  
  //Creating the tic-tac-toe board
  strokeWeight(6);
  stroke(25,25,112);//Midnight Blue lines
  line(100,0,100,300);
  line(200,0,200,300);
  line(0,100,300,100);
  line(0,200,300,200);
}
  //Creating a mouse press funtion to create X's and O's
void draw() {
}
void mousePressed() {
    stroke(3);
    fill(0);//Black
    textSize(60);
    text("X",mouseX-20,mouseY+20);
}
void keyPressed() {
   if(keyCode == 'C') {
     background(255,255,0);
     strokeWeight(6);
     stroke(25,25,112);//Midnight Blue lines
     line(100,0,100,300);
     line(200,0,200,300);
     line(0,100,300,100);
     line(0,200,300,200);
   }
    else if (keyCode == 'O')
   strokeWeight(6);
   noFill();
   ellipse(mouseX,mouseY,50,50);
   
}




