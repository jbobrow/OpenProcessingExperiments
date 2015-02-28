
void animatedDraw() {

  try {

    Exhib e= exhibs[exhibs.length-count];

    float xpos= map(e.y, 2003, 2012, 100, width-100);
    float mthAmount= map(e.m, 1, 12, 50, height-150);
    float dayAmt= map(e.d, 1, 31, 1, height/12);

    float ypos= dayAmt+mthAmount;
    float h= map(xpos, 0, width, 0, 100);

    if (isFilled) {
      noStroke();
      fill(h, 100, 110, 30);
    }
    else {
      noFill();
      stroke(h, 100, 110, 30);
    }
    float val=0;
    if (hourlyFigures) {
      for (int i=0; i<e.footfall.length-1; i++) {

        val=e.footfall[i];
        float hourAmt= i*(dayAmt/8);
        ypos+=hourAmt;
        ellipse(xpos, ypos-50, val*scaleFactor, val*scaleFactor);
      }
    }
    else {
      val= e.footfall[e.footfall.length-1];
      ellipse(xpos, ypos, val*scaleFactor, val*scaleFactor);
    }
    count++;
  }
  catch(Exception ee) {

    println("Data done");
    count=1;
    fill(0);
    background(100);
    for (int i=2003; i<2012; i++) {
      float xpos= map(i, 2003, 2012, 100, width-100);
      float ypos= height/2;
    }
  }
}


