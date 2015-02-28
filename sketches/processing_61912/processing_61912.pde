
float [] x = new float [32];
float [] y = new float [32];


void setup () {
  size (500, 500);

  int boxnum = 0;

  while (boxnum < x.length)
  {
    x [boxnum] = 250;
    y [boxnum] = (boxnum-2)*50;
    boxnum = boxnum+1;
  }
}
void draw () {
  background (0);
  int boxnum = 0;
  beginShape();
  noFill();
  strokeWeight (5);
  stroke (255);
  smooth ();
  while (boxnum <  x.length)
  {
    curveVertex (x[boxnum], y[boxnum]);
    //ellipse(x[boxnum], y[boxnum], 10,10);
    float d;
    if (mousePressed) {
      d = dist(x[boxnum], y[boxnum], mouseX, mouseY);
      
      if (d<100) {
      float diff = (mouseX - x[boxnum]); 
        
              if (d<20) {
                        x[boxnum] = x[boxnum] + diff;

              }else{
                       x[boxnum] = x[boxnum] + diff/d;
 
              }

        
        
      }
    } else {
      x[boxnum] =  x[boxnum] + (250 -  x[boxnum])/10;
      if(x[boxnum] < 250.01 && x[boxnum] > 249.99) {
        x[boxnum] = 250;
      }
     }
      
    boxnum = boxnum+1;
  }

  endShape();
}


