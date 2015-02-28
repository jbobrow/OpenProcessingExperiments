
//non-objective Drawing Machine (NODM)
//In the given space tree objects forming differnt composition with mousepress
//The size of objects randomly pop up, but the ratio of objects is controled by setup  
//Each of two rectagles has 3:2, and 1:3 ratios.
//Circle is perfact circle.  

void setup() {
  size (500, 500);
  background (245, 237, 230);
  smooth();
}

void draw () {
}

void mousePressed () {
  background (245, 237, 230);
  O1 (random (width));           //Objetive 1_ 3:2 rectangle
  O2 (random (height));          //Objetive 2_ 1:3 rectagle
  O3 (random (height));          //Objetive 3_ Perfact circle

  //Setup the space here
  //To direct differnt space each mouse click, Use random strokeweight 
  stroke (0, 150);
  strokeWeight (random (3));
  line (width/2, 0, width/2, 6*height/7);
  strokeWeight (random (3));
  line (width/2, 6*height/7, 0, height);
  strokeWeight (random (1));
  line (width/2, 6*height/7, width, height);
}

//setup three objects here
void O1 (float a) { 
  noFill();
  strokeWeight (random (3));
  rect (a-width/5, a, 3*a/3, 2*a/3);  //3:2
}
void O2 (float b) { 
  noStroke();
  fill (242, 233, 190, 170);
  rect (b, b-height/5, b/3, 3*b/3);   //1:3
}
void O3 (float c) { 
  noStroke();
  fill (255, 150);
  ellipse (c, c, c/3, c/3);
}


