
//*****************Key Definition**************************//
// non-case sensitive
// z increase xOffrate value, x decrease xOffrate
// c increase graphRate value, v decrease graphRate
// r reset all those four values to startup value
// s start .png image format
// q start quictime movie recording and space bar finish it
//*********************************************************//

void keyPressed() {
  switch(key) {
  case 'z':
  case 'Z':
    xOffrate+=0.01;
    xOffrate = min(xOffrate,1.5);
    break;
  case 'x':
  case 'X':
    xOffrate-=0.01;
    xOffrate = max(xOffrate,0.01);
    break;
  case 'c':
  case 'C':
    graphRate+=pow(0.02,2);
    graphRate = min(graphRate,0.5);
    break;
  case 'v':
  case 'V':
    graphRate-=pow(0.02,2);
    graphRate = max(graphRate,0.001);
    break;
  case 'r':
  case 'R':
    xOffrate = xOffstart;
    graphRate = graphStart;
    break;
  case 's':
  case 'S':
    numCount = 1;
    rec = false;
    break;
  case 'q':
  case 'Q':
    rec = true;
    numCount = 1;
    println("Recording quicktime movie: " + movieName);
    break;
  case ' ':
    rec = false;
    numCount = 0;
    movie.finish();
    println("Saving Stop");
  }
}


