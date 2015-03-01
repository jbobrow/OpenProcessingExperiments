
int y=0;
float speed=1.0;
int direction=1;

void setup() {
  size (768, 576);
}

void draw() {
  background(255);
  for (int n=6; n<=576; n+=20) {
    for (int m=4; m<=768; m+=20){
      strokeWeight(3);
      stroke(180);
      point(m,n);}
  }

  translate(width/2, height/2);
  frameRate(50);
  float a= map(y, 0, 376, 0, 160); 
  strokeWeight(10);
  stroke(0);
  line(-284, 188-y, -142, -188+y);
  line(-142, -188+y, 0, 80-a);
  line(0, 80-a, 142, -188+y);
  line(142, -188+y, 284, 188-y);
  y+=2*speed*direction;
  if ((y<0)||(y>376)) {
    direction=-direction;
  }
    //if ((frameCount % 5)==0) {
    //saveFrame("mw-####.tif");
  //}
}



