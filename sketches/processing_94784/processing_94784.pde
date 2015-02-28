
void setup() {
  size(1100, 950);                                     //1100 pixels wide and 950 pixels high
  background(126);                                     //Set background color to gray
  smooth();                                            //Draws all geometry with smooth edges
  noStroke();                                          //Show no lines
}

void draw(){
  if (frameCount % 10 == 0) {
    fill(frameCount * 3 % 255, frameCount * 5 % 255,
      frameCount * 7 % 255);
    pushMatrix();
    translate(550, 500);
    rotate(radians(frameCount * 2  % 360));
    name(0,0);                                         //Draw Domo's name
    popMatrix();
  }
  domo(0,0);                                           //Draw domo in the center
}

void name(int x, int y){
  //Letter D
  rect(100, 157, 35, 80);                              //First line
  ellipse(140, 197, 80, 80);                           //Circle next to rectangle
  //Letter O
  ellipse(235, 197, 80, 80);                           //First letter 'O'
  ellipse(465, 197, 80, 80);                           //Second letter 'O'
  //Letter M
  rect(290, 157, 30, 80);                              //First line
  quad(320, 157, 320, 195, 350, 225, 350, 190);        //Second line
  quad(380, 157, 380, 195, 350, 225, 350, 190);        //Third line
  rect(380, 157, 30, 80);                              //Last line
  //Insides
  fill(126);                                           //Set to background color
  rect(118, 178, 23, 40);                              //Rectangle inside of letter 'D'
  ellipse(138, 198, 40, 40);                           //Circle inside of letter 'D'
  ellipse(235, 197, 30, 30);                           //Circle inside of first letter 'O'
  ellipse(465, 197, 30, 30);                           //Circle inside of second letter 'O'
}

void domo (int x, int y) {
  //Mouth
  fill(227, 0, 0);                                     //Set to Red
  rect(450, 490, 221, 150);                            //221 pixels wide and 150 pxels high
  //Eyes
  fill(0);                                             //Set to Black
  ellipse(450, 410, 40, 40);                           //Diameter is 40
  ellipse(670, 410, 40, 40);                           //Diameter is 40
  fill(255);                                           //Set to White
  ellipse(443, 400, 10, 10);                           //Diameter is 10
  ellipse(663, 400, 10, 10);                           //Diameter is 10
  //Bottom Teeth
  triangle(450, 640, 477, 595, 506, 640);              //First teeth from left
  triangle(450+55, 640, 477+55, 595, 506+55, 640);     //Second teeth from left
  triangle(450+110, 640, 477+110, 595, 506+110, 640);  //Third teeth from left
  triangle(450+165, 640, 477+165, 595, 506+165, 640);  //Last teeth from left
  //Teeth
  triangle(450, 490, 477, 535, 506, 490);              //First teeth from left
  triangle(450+55, 490, 477+55, 535, 506+55, 490);     //Second teeth from left
  triangle(450+110, 490, 477+110, 535, 506+110, 490);  //Third teeth from left
  triangle(450+165, 490, 477+165, 535, 506+165, 490);  //Last teeth from left
}



