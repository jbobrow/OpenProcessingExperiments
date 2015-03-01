


void setup()
{
  size(500,500);
  textFont(createFont("Dax-Bold",300));
  
}

void draw()
{
  background(255);
  float  x1 = map(mouseX, 0, 500, 0, 255);
  float  x2 = map(mouseY, 0, 500, 0, 255);
  textAlign(CENTER);
  String t = "B!";
//  float tw = textWidth(t);
  fill(x1,x2,0);
  text(t, (width)/2, (height)-125);
  println(mouseX + " : " + pmouseX);



//  if (mousePressed){
//  noLoop();
//} else { 
//  loop();
}



