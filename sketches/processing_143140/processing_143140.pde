
float spacing = 60, elSize = 60;
int spotsx, spotsy, totalSpots;
float theta = 0, elrad = elSize/2;
int dotsize = 40, dotsize2 = 15, alph = 255, alph2 = 55;
int c1 = 153, c2 = 195;  //  160  210
float cpt1 = cos(QUARTER_PI), cpt2 = cos(PI + QUARTER_PI);
float cpt3 = cos(HALF_PI + QUARTER_PI), cpt4 = cos(TWO_PI - QUARTER_PI);
float spt1 = sin(QUARTER_PI), spt2 = sin(PI + QUARTER_PI);
float spt3 = sin(HALF_PI + QUARTER_PI), spt4 = sin(TWO_PI - QUARTER_PI);

void setup() {
  size(480, 480);
  colorMode(HSB);
  rectMode(CENTER);
  spotsx = int(width/spacing) - 1;
  spotsy = int(height/spacing) - 1;
  totalSpots = spotsx * spotsy;
  background(0, 0, 0);
  strokeWeight(2);
  noFill();
}

void draw() {
  background(0, 0, 255);
  for (int y = spotsy ; y > 0; y--) {
    for (int x = spotsx; x > 0; x--) {
      stroke(0, 0, 120, 180);
      noFill();
      pushMatrix();
      translate(x*spacing, y*spacing);
      rotate(calcrot2(x, y));
      ellipse(0, 0, elSize, elSize);

      noFill();
      //strokeWeight(2);
      //stroke(c1, 255, 255, alph);  //***
      line(elrad * cpt1, elrad * spt1, elrad * cpt2, elrad * spt2);
      stroke(c1, 255, 255, alph);   //***
      rect(elrad * cpt1, elrad * spt1, dotsize, dotsize);
      rect(elrad * cpt2, elrad * spt2, dotsize, dotsize);
      fill (c2, 255, 255, alph2);
      stroke(c2, 255, 255, alph);
      //strokeWeight(1);
      rect(elrad * cpt1, elrad * spt1, dotsize2, dotsize2);
      rect(elrad * cpt2, elrad * spt2, dotsize2, dotsize2);

      noFill();
      //strokeWeight(2);
      stroke(0, 0, 120, 180);        //***
      line(elrad * cpt3, elrad * spt3, elrad * cpt4, elrad * spt4);
      stroke(c2, 255, 255, alph);    //***
      rect(elrad * cpt3, elrad * spt3, dotsize, dotsize);      
      rect(elrad * cpt4, elrad * spt4, dotsize, dotsize);
      fill(c1, 255, 255, alph2);
      stroke(c1, 255, 255, alph);
      //strokeWeight(1);
      rect(elrad * cpt3, elrad * spt3, dotsize2, dotsize2);
      rect(elrad * cpt4, elrad * spt4, dotsize2, dotsize2);

      popMatrix();
    }
  }
  theta+=2;
  if (theta == 360) { 
    theta = 0;
  }

//    if (frameCount%4 == 0) {
//      saveFrame("frames/####.jpg");
//    }
}


float calcrot2(int x, int y) {
  if (x % 2 == 0) {
    if (y % 2 == 0) {
      return(radians(theta-90));
    } 
    else {
      return(radians(-theta));
    }
  } 
  else {
    if (y % 2 == 0) {
      return(radians(-theta));
    } 
    else {
      return(radians(theta-90));
    }
  }
}

