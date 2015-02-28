



void setup() {
  // set the size of the window
  size(400,400);
}

void draw()
{
// draw a black background
  background(0);

// set CENTER mode
ellipseMode(CENTER);

if (mouseX < width/3) {
  background(255, 127, 76);
} else if (mouseX <2*width/3){
  background(127);
}else{
  background(0);
}
  
// BILLYS HEAD
  stroke(255);
  fill(155);
  ellipse(mouseX,mouseY-30,40,30);
  

//BILLYS BODY
  rectMode(CORNER);
  rect(170,150,40,30);

  rect(170,150,10,30);
  rect(200,150,10,30);
//BILLYS SHOULDERS  
  point(160,140);
  point(220,140);
  fill (255);

  

// BILLYS ARMS
  
//BILLYS LEFT ARM
  strokeWeight(10);
  line(160,160,120,120);
  
//BILLYS RIGHT ARM
  strokeWeight(10);
  line(220,160,250,135);
  
  
//BILLYS LEGS
  //LEFT
  rect(170,190,10,40);

//RIGHT
  rect(200,190,10,40);

//BILLYS FEET
  //left foot
  rect(150,220,10,10);
  
  //right foot
  rect (200,220,30,10);
}


