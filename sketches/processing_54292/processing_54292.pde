
float [] xCoord=new float [500];
float [] yCoord=new float [500];
float [] xMove=new float [500];
float [] yMove=new float [500];

void setup() {
  size(500, 500);
  for (int i = 0; i < 500; i++) {
    xCoord[i]= random(width);
    yCoord[i]= random(height);
    xMove[i]=random(-5, 5);
    yMove[i]=random(-5, 5);
  }
}

void draw () {
  fill(0, 20);
  rect(0, 0, width, height);
  stroke(255,142,240);
  for (int i=0; i < 500; i ++) {
    point(xCoord[i], yCoord[i]);
    xCoord[i]+=xMove[i];
    yCoord[i]+= yMove[i];
    
    //make it wiggle!! 
    xCoord[i] += random(-2,2);

    if (xCoord [i] > width || xCoord[i] <0) {
      xMove[i] *= -1;
    }
     if (yCoord [i] > height|| yCoord[i] <0) {
      yMove[i] *= -1;
     }
    }
  }



