
//Copy Right Hao-Yun Mei_Carnegie Mellon University
//processing noise() sample code
//Project 1 for Computing for the Arts with Processing, Jim Roberts

float yOffset = 0;
float colOffset = 0;

void setup() {
  size(600, 400);
  textAlign(CENTER,CENTER);
  rectMode(CENTER);
  textSize(15);

}

void draw() {
 
  lineNoise();
   backgroundCol();
  showFrameRate();
  
  //if(keyPressed) saveFrame("project1.jpg");
  
  
}


void backgroundCol()
{
  float x = 0;
  fill (0, 1.5);
  rect(0, 0, 2*width,2* height);
  
}

void lineNoise()
{
  float x = 0;


  while (x < width) {
    // stroke(255*noise(x/100,yOffset), 100*noise(x/200), 255*noise(x/100));
    stroke(300*noise(x/100, colOffset));
    point(x, height * noise(x /100, yOffset));
    x = x + 1;
  }
  colOffset = colOffset + .05;
  yOffset = yOffset + 0.02;
}

void showFrameRate( )
{
   fill( 255 );
   noStroke( );
   rect( 50,  20, 60, 20 );
   fill( 0 );
   text( frameRate, 50, 20 ); 
}




