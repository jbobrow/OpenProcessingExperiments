
int diameter = 5;

void setup()
{
background(255,255,255);
size(300,300);
noFill();
frameRate(12);
}
void draw(){
if (diameter<100){
  stroke(255,134,134);
  ellipse(120,150,diameter,diameter);
  stroke(214,147,224);
  ellipse(50,50,diameter,diameter);
  stroke(0,203,237);
  ellipse(50,120,diameter,diameter);
  stroke(157,255,163);
  ellipse(50,200,diameter,diameter);
  stroke(206,7,0);
  ellipse(120,70,diameter,diameter);
  stroke(179,88,255);
  ellipse(120,230,diameter,diameter);
  stroke(49,119,255);
  ellipse(190,50,diameter,diameter);
  stroke(197,255,90);
  ellipse(190,130,diameter,diameter);
  stroke(255,192,124);
  ellipse(190,210,diameter,diameter);
  stroke(124,214,255);
  ellipse(250,50,diameter,diameter);
  stroke(255,188,235);
  ellipse(250,130,diameter,diameter);
  stroke(205,154,242);
  ellipse(250,210,diameter,diameter);
  diameter = diameter + 5;}
}



