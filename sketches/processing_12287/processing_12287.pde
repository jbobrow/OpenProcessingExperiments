
// Bubbles by Paul Rada
// 09.17.2010
// click to show color difference\blending of turquiose 
// adjust the mouse around for a "3d" effect
// 
void setup()
{
  size(600,600);
  frameRate(30);
}
  int pos =0;
void draw()
{
  
  pos++;
  line(pos,20,pos,80);
  if(pos > width)  {
    pos =0;
  }
  float d = dist(50,50,pmouseX,pmouseY);
  fill(d*0,186,d*1);
  ellipse(pmouseX,pmouseY,pmouseX,pmouseY);
  println(frameCount);
  if(mousePressed){
    stroke(65,245,227);
    fill(100,211,221);
  } else {
    fill(145,221,230);
    stroke(145,221,230);
  }
 
    //background(180,238,241);
  fill(44,175,190);
  ellipse(mouseX,mouseY,40,40);
}


