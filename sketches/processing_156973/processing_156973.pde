
int[] xpos = new int[1000];
int[] ypos = new int[1000];


void setup() {
  size(600, 600); 
  for (int i = 0; i < xpos.length; i++ ) {
    xpos[i] = -100;
    ypos[i] = -100;
  }
}

void draw() {
  //background(255); 
  stroke(0); 




  //  for (int i = 0; i < xpos.length-1; i++ ) {
  //    for (int j = 0; j < ypos.length-1; j++ ) {
  //      float pointDist = dist(xpos[i], ypos[i], xpos[j], ypos[j]);
  //      float b = map(pointDist, 0, 100, 1, 254);
  //      stroke(b); 
  //      if ( pointDist < 100 ) {
  //        line(xpos[i], ypos[i], xpos[j], ypos[j]);
  //      }
  //    }
  //  }
  if (mousePressed) {
    for (int i = 0; i < xpos.length-1; i++ ) {
      //background(255);
      stroke(0, 50);

      line(xpos[i], ypos[i], xpos[i+1], ypos[i+1]);
      xpos[i] = xpos[i+1];
      ypos[i] = ypos[i+1]; 


      float distance = dist(xpos[xpos.length-1], ypos[ypos.length-1], xpos[i], ypos[i]);
      float b = map( distance, 0, 100, 0, 30);
      stroke(0, b); 
      if (distance < 70) {
        line(mouseX, mouseY, xpos[i], ypos[i]);
      }
    }

    if (mouseX != 0 || mouseY != 0 ) { 
      xpos[xpos.length-1] = mouseX;
      ypos[ypos.length-1] = mouseY;
    }
  }
} 



