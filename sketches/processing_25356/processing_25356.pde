
float angle =650;

void setup () {
  size(750,750);
  smooth();
}

void draw() {


 fill (255, 0, 0);
  translate(50,50);
  rect(0, 5, 70, 30);
 

  background (255);
  stroke (255,120);
  translate(60,30);
  //rotation movement
  rotate(angle);
  //speed
  angle += 0.01;

//drawing 85 rect, it will start at zero, then up to zero
// ++ it adds one, means -> i + 1
  for (int i=0; i<85; i ++) {
    strokeWeight (i);
    
    //how many times the rect is rotated, ie. PI divided by 110
    rotate (PI/110);
    //placement of the object
    rect (365,450,70,50);
  }
  
  
}


