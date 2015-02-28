
//barbara compagnoni mouse over box color change
void setup (){
    size (500, 500); //sets frames size to 500 x 500
 
}
int rectColor; //defines rectColor
int bkColor; //defines bkColor

void draw(){ //initiates draw function
  
  background (bkColor); //sets background color to bkColor
  fill (rectColor); //sets fill color to rectColor
  rectMode (CENTER); //sets rectangle to draw from center
  rect (height/2, width/2, 50, 50); //draws rectangle
  
      if (mouseX > 200 && mouseX < 400 && mouseY > 200 && mouseY < 400)
  { //if the mouse is over the box...
      rectColor = 255; //change rectFill color to white
      bkColor = 50; //change bkColor dark grey
    }
    else{ //if not...
      rectColor = 0; //change rectFill color to black
      bkColor = 200; //change bkColor light grey
    }}


