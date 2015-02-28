
float x, y;
float angle = 0 ;
float r = 100;
float diff = 3;

void setup() {

  size(600, 600);
  background(0,50,7);
}

void draw() {

     fill(0,100,0,100);
  ellipse(300,300,100,100);

  
  x=r*cos(angle);
  y=r*sin(angle);
  
  translate(width/2,height/2); 
  rotate(r);
  

  
  fill(255,255,0,90);
  stroke(0,20);
  strokeWeight(4);
  ellipse(x, 0, x, 50);
  ellipse(0, 0, x, y);
  line( 0, 0, x, y);
  
 
 
  angle = angle + 0.1;
  r = r + diff ;
  
  if ( r == 0 || r == 300) {
    diff = diff * -0.1;
  }


}
void keyPressed() {
  if (key == 'q') {
    endRecord();
    exit();
  }
}
