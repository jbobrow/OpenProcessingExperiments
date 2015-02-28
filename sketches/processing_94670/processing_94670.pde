
int totalPts = 1000;
float steps = 600;
float rand = 2;
float rand2 = 2;


void setup() {
  size(800, 800);
  background(0);
  
  //Color for the points
  stroke(255);
  //right
  for  (int i = 440; i < 800; i=i+1) {
    strokeWeight(2);
    point(i, (height/2)+random(-rand, rand));
    rand+=.2;
    //println("i = " + i);
  }
  //points left
  for  (int i = 360; i > 0; i=i-1) {
    strokeWeight(2);
    point(i, (height/2)+random(-rand2, rand2));
    rand2+=.2;
    //println("i = " + i);
  }



  //---------------------------------
  stroke(220);
  strokeWeight(3);
  line ((width/2)-40, height/2, (width/2)+40, height/2);
}



