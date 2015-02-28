
int value=0;

void setup(){
  size(750, 450);                                 //750 pixels wide and 450 pixels high
  background(0);                                  //Set background color to gray
  frameRate(5);                                   //Change color slowly
  noStroke();                                     //Show no lines
  fill(0);                                        //Start out black
  smooth();
}

void draw(){
  name(0,0);                                      //Draw Domo's name
  fill(value);
}

void name(int x, int y){
  //Letter D
  rect(100, 157, 58, 126);                        //First line
  ellipse(163, 220, 125, 125);                    //Circle next to rectangle
  //Letter O
  ellipse(300, 220, 125, 125);                    //First letter 'O'
  ellipse(580, 220, 125, 125);                    //Second letter 'O'
  //Letter M
  rect(375, 157, 30, 126);                        //First line
  quad(405, 157, 405, 205, 440, 250, 440, 210);   //Second line
  quad(475, 157, 475, 205, 440, 250, 440, 210);   //Third line
  rect(475, 157, 30, 126);                        //Last line
  //Insides
  fill(0);                                        //Set to background color
  rect(132, 189, 27, 62);                         //Rectangle inside of letter 'D'
  ellipse(163, 220, 62, 62);                      //Circle inside of letter 'D'
  ellipse(300, 220, 60, 60);                      //Circle inside of first letter 'O'
  ellipse(580, 220, 60, 60);                      //Circle inside of second letter 'O'
}

void mouseMoved() {
  value = value + 5;                              //Changes the color when you move
  if (value > 255) {                              //the mouse across the image
    value = 0;
  }
}

