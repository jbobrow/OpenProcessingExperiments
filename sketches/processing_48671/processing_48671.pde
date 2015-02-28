
float rectWidth, rectHeight;

void setup()  {
  size(400,400);
  rectMode(CENTER);
  rectWidth = rectHeight = width;
  noFill();
  stroke(255, 20);
  background(0);
  //frameRate(5);
}

void draw()  {
  folia();
}

void folia()  {
  rect(width/2, height/2, rectWidth, rectHeight);
  rectWidth = rectWidth/1.01;
  rectHeight = rectHeight/1.01;
  if (rectWidth > 10)  {
    folia();
  } 
    
  println(rectWidth);
}
