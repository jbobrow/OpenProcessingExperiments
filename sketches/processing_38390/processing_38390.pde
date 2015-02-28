
//Random Figures

//Left-click mouse to change composition of figures

void setup() {
  size (500, 500);
}

void draw() {
}

void mousePressed () {
  background(255);
  for (int countX=0; countX<width; countX+=50) {
    for (int countY=0;countY<width; countY+=50) {
      int randrect=floor(random(0, 50));
      noFill ();
      noStroke();
      rect(countX, countY, 50, 50);

      //25 - 50, figures will be blue

      if (randrect > 25) {
        fill(0, 50, 100);//blue figure
        rect(countX, countY, randrect, randrect);
      }

      //under 25, figures will be yellow 

      else {  

        fill(255, 204, 0);//yellow figure
        rect(countX, countY, randrect, randrect);
      }

      //15 - 35, figures will be green

      if (randrect > 15) {
        if (randrect < 35) {
          fill(29, 203, 39);//green figure
          rect(countX, countY, 50, 50);
        }
      }
    }
  }
}


