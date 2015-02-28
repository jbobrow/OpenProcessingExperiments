


void setup() {
  size (800, 400);
  smooth();
}

void draw() {
  rectMode(CENTER);
  background(0);
  
  drawClown(200,200,114,color(255,100,100));
  drawClown(300,300,130,color(10,200,150));
  drawClown(500,100,300,color(255,255,10));

  

}



void drawClown(float clownX, float clownY, float clownSize,int clownHeadColour) {
  //Head
  ellipseMode(CENTER);
  fill(clownHeadColour);
  ellipse(clownX, clownY, clownSize, clownSize);

  //Hat
  strokeWeight(clownSize/20);
  stroke(0);
  fill(100, 240, 358);
  triangle(clownX-50, clownY-30, clownX, clownY-80, clownX+50, clownY-30);

  //mouth
 // noStroke();
  fill(150, 012, 034);
  ellipse(clownX, clownY+10,  clownSize*0.2,clownSize*0.1);

  //eye1
  stroke(0);
  strokeWeight(3);
  line(clownX-30, clownY-30, clownX+1, clownY+1);

  //eye2
 // noStroke();
  fill(random(255),random(255),random(255));
  ellipse(clownX+20, clownY-10, 20, 20);
  

  
}





