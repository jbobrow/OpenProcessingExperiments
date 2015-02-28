
void setup() {
  size(800, 800);

  stroke(0);
  strokeWeight(1.5);

  frameRate(5);

  //drawCircle(width/2);
}
void draw() {
   background(0,191,255);
  rectMode(CENTER);
  drawRect (width/2, height/2, width);
}
void drawRect(float x, float y, float recSize) {
  // float rads = radians(frameCount);  
  for (int co = 0; co <= 30; co ++) {
    fill(random(200, 256), random(co, 255), random(0, 255));
  }
  rect(x, y, recSize/4, recSize/4);





  if ( recSize>25) {
    // pushMatrix();
    //translate(x,y);
    //rotate(rads); 
    drawRect(x+ recSize/3, y, recSize/2);//r
    // popMatrix();

    drawRect(x- recSize/3, y, recSize/2);//l
    drawRect(x, y+ recSize/3, recSize/2);//mid+dwn
    drawRect(x, y- recSize/3, recSize/2);//mid+up
    drawRect(x, y, recSize/2);//mid
  }
}



