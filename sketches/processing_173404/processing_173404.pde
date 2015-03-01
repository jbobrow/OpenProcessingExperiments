
//PATTERNS
//The code generates a canvas with a random pattern based in rectngles and columns 
//*When any key is pressed the code calculates new sizes of the variables

//Written by Paco Rico with Processing. 
//http://pacorico.com

float rectx;
float recty;
float colx;
float intx;
float inty;
float scaleG;
float rotationG;

void setup() {
  size(500,500);
  
}

void draw() {
background(255);
  scaleG =1; // scale
  rectx =random(14, 24); // width of black rectangle
  recty =random(14, 24);  // height of black rectangle
  intx =rectx*random(1.1, 2.9); // width separation between rectangles
  inty =recty*random(1.1, 2.9);  //height separation between rectangles
  colx=rectx*random(.1, .9); // column width
  float rotationG = 0.0; //rotation

//the real loop
background(255);

  for (int i = -2*width; i < 2*width; i = i+int(intx)) {
  for (int j = -2*height; j < 2*height; j = j+int(inty)) {

    pushMatrix();
    translate (width/2, height/2);
    fill(0);
    scale(scaleG);
    rotate(rotationG);
    // translate(width/2,height/2);
    rect (i, j, rectx, recty);
    fill(0);
    rect ((i+(rectx/2-colx/2)), -2*height, colx, 4*height);

    popMatrix();

  }
} 
noLoop();
}

void keyPressed() {
  redraw();
}

