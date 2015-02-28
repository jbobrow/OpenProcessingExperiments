
float x;
float y;
float angle = 0;
float r=300;
float diff=5;
//or  float x,y;
void setup() {
  //  beginRecord(PDF, "everything.pdf");  
  size (600, 600);
  background(255, 113, 156);
}
void draw() {  
  x =  r * cos(angle);
  y =  r * sin(angle);




  strokeWeight(3);
  noFill();
  stroke(129, 22, 22, 25);



  translate(300, 300);
  rotate(r);

  ellipse( x/5, y/5, 50, 50);

  ellipse( x/1, y/1, 20, 20);
  fill(17, 208, 240, 50);
  strokeWeight(2);
  ellipse( x/5, y/5, 30, 30);

  strokeWeight(1);
  line(x/y, x/y, 480, 480);
  //line(x/3, y/3, 480, 480);

  point(x, y);

  angle = angle + 32;
  r= r-diff;

  if ( r==5 || r == 340) {
    diff = diff * +1;
  }

  println(r);
} 
void keyPressed() {
  if (key == 'q') {
    endRecord();
    exit();
  }
}
