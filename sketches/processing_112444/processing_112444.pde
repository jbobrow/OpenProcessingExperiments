
void setup(){
  size(600,400);
  
//  drawHouse();
  /*
  rotate(radians(15));
  drawHouse();
  */
  
  //translate(100, 100);
  /*
  scale(2,1);
  rotate(radians(45));
  */
  /*
  rotate(radians(45));
  translate(100, 100);
  */
  /*
  translate(100,100);
  rotate(radians(45));
  translate(-100,-100);
  */
  /*
  translate(200,0);
  rotate(radians(-20));
  translate(-200, 0);
  */
  /*
  //drawHouse();
  translate(100,100);
  scale(2,2);
  */
//  translate(-100,-100);
  drawHouse();
}


void drawHouse(){
  noFill();
  smooth();
  strokeWeight(3);
  rect(0,100, 200, 100);
  line(0,100, 100, 50);
  line(100, 50, 200, 100);
  line(150, 75, 150, 50);
  line(175, 87.5, 175, 50);
  line(150, 50, 175, 50);
  line(0,0, 200, 0);
}
