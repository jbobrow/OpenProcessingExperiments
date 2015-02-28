
void setup()
{
  size(500,500);
}
void draw()
{
  background(30,110,45);
  //inici i final
  fill(255);
  rect(0,height-20,40,height);
  rect(width-20,0,width,60);
  fill(255,0,0);
  triangle(10,height-2,30,height-2,20,height-15);
  fill(0);
  rect(0,height,-10,20);
  //circuit
  fill(130,75,30);
  rect(5,height-20,30,-380);
  rect(35,100,50,50);
  rect(85,100,-30,-100);
  rect(35,height-80,100,50);
  rect(100,height-80,35,-100);
  rect(100,height-180,150,-50);
  rect(215,height-230,35,-100);
  rect(215,height-300,150,-50);
  rect(330,height-350,35,-145);
  rect(365,5,115,50);
  //camins secundaris
  rect(100,height-180,35,-300);
  rect(135,height-480,150,50);
  rect(250,height-230,150,50);
  rect(400,height-180,35,-200);
  rect(135,height-150,300,50);
  rect(435,height-150,35,130);
  rect(435,height-20,-220,-50);
  noStroke();
  //persona
  fill(250,130,130);
  ellipse(mouseX,mouseY-7.5,15,15);
  rect(mouseX-6,mouseY+18,4,10);
  rect(mouseX+3,mouseY+18,4,10);
  rect(mouseX-10,mouseY+5,20,4);
  fill(0,0,255);
  triangle(mouseX,mouseY,mouseX-10,mouseY+18,mouseX+10,mouseY+18);
  noCursor();
  
}


