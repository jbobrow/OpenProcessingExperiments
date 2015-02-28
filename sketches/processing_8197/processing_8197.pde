
int turn=1;

void setup(){
  strokeWeight(7);
  smooth();
  translate(50,50);
  frameRate(20);
}

void draw(){
  background(0); // clear screen
  translate(50,50); // set new coordinate system at (50,50)
  
  // first we draw the brightest segment
  // based on how many times we been
  // through the Draw loop (turn)
  for (int i=0; i<turn ;i++)
    {
      rotate(PI/6);
    }
  stroke(#F29D1D, 150);
  line(25,0,35,0);

  // we then draw 7 segments of diminishing
  // brightness (i.e. alpha) by rotating
  // backwards PI/6 for each segment
  for (int j=1; j<8;j++)
    {
      rotate(-PI/6);
      stroke(#F29D1D, 160-(j*10));
      line(25,0,35,0);  
    }

  turn++;
  if (turn>12) // this is useless, but I like to keep my numbers down :)
    {
    turn=1;
    }
    
    // remember that all transformations are restored at the end of each draw 
}

