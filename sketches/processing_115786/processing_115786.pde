
float x;
float y;
float px;
float py;

void setup() {
  size(700, 360);
  smooth();
  //stroke(0, 58);
  stroke(9,230,89);
  //fill (9,230,89);
}

//void draw() {
 void draw () {
      if (mousePressed == true) { 
        stroke(9,230,89);
  float targetX = mouseX;
  x += (targetX - x) ;
  float targetY = mouseY;
  y +=(targetY - y) ;
  float weight = dist(x,y,px,py);
  strokeWeight (weight);
  line(x,y,px,py);
  py=y;
  px=x; 
    } 
 if (mousePressed == false) {   
   stroke (98,0,150);
      float targetX = mouseX;
  x += (targetX - x) ;
  float targetY = mouseY;
  y +=(targetY - y) ;
  float weight = dist(x,y,px,py);
  strokeWeight (weight);
  line(x,y,px,py);
  py=y;
  px=x;
 }
 }




