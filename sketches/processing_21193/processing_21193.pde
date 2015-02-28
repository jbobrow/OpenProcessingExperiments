
import processing.pdf.*;
boolean record;
void setup() {
  size(480,720);
  background(169,124,80);
  smooth();
}
void draw() {
  //Funny Ellipses
  noFill();
  stroke(11,152,52,30);
  strokeWeight(5);
  ellipseMode(CENTER);
  for (int acr=0;acr<1720;acr+=20)
  {
   ellipse(0,0,acr,acr);
   ellipse(480,720,acr,acr);
  }
  noStroke();
    fill(240,183,60);
  for ( int raz=0;raz<360;raz+=40) {
    rect(raz+70,15,20,700);
  }
  //Happy Rectangles.
  
  fill(0,79,180);
  for(int cuad=0;cuad<450;cuad+=150) {
    rect(width/2-54,height/5+cuad,108,108);
  }
  //Blue lines
  for ( int loi=20;loi<600;loi+=75) {
    rect(30,loi+75,420,20);
  }
  //Some Ellipses
  fill(240,90,40);
  for ( int elli=60;elli<400;elli+=150) {
    ellipse(width/2,height/5+elli,58,58);
  }
  fill(101,45,144);
  //Thin lines
  strokeWeight(1);
  stroke(255,255,255,30);
  for (int a = 0; a<1000; a++) {
    rect(0,a+10,480,1);
    a=a+1;
  }
  stroke(194,181,155);
  strokeWeight(20);
 //Frame
  noFill();
  rect(10,10,width-20,height-20); // BACK
  if (record) {
    endRecord();
    record = false;
  }
}
void keyPressed () {
  record = true;
  noLoop();
}


                
                                
