
int startx=50;
int starty=0;
int endx=500;
int endy = 50; 



void setup () {
  size (500, 500); 
  background (0, 0, 0);
  stroke (15, 255, 221);
  smooth ();
}


void draw () {
  for (int i=0; i<500; i=i+50) {

    line (startx+i, starty, endx, endy+i);
  }
}

                                
