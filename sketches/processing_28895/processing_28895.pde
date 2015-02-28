
//int i;

void setup(){
  size(500,500);
  smooth();
  strokeWeight(12);
  background(0, 0,0);
}

void draw(){
  //i = frameCount%10;
  loadFont("SansSerif-25.vlw");
  textSize(85);
  fill(255, 5);
  text("Hello", mouseX, mouseY);
}

void keyPressed()
{
if (key=='s'||key=='S')
{
 saveFrame("type-####.tif"); 
}
}


