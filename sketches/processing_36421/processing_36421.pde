
//homework3
//copyright Joel McCullough Sept.6,2011 Pittsburgh PA 15221
//swipe the screen then let go of mouse, it animates after
//click to change background color
float x=20, y=20;//variable declarations

int value = 0;

void setup()
{
  size(400, 400);
  smooth();
  fill(202, 242, 0);
  frameRate(50);
  noCursor();
  noStroke();

  background(46, 50, 51);
  int value = 0;
}
void draw()
{
  background(value+10,value,value+50);
  fill(202, 242, 0);
  rect(0, 150, 200, 100);
  rect(200, 150, 200, 50);
  rect(0, 260, 280, 5);
  rect(220, 210, 180, 3);
  rect(0, 140, 280, 5);
  rect(300, 130, 100, 40);
  
  //moving rectangles
  fill(value, value, value);
  rect(0, 100, ++mouseX, 5);//not exactly sure what this does, I stumbled upon it
  rect(400, 300, --mouseX, 2);
  rect(400, 310, --mouseX-100, 1);
  rect(0, 290, ++mouseX, 3);
  fill(value, value, value);
  rect(50, 400, 10, --mouseX);
  fill(168, 38, 33);
  rect(139, 400, 20, --mouseX+400);
  rect(100,400,2,--mouseX+200);
  rect(0, 350, 400, 25);
  rect(400,50,--mouseX,5);
  rect(400,330,--mouseX+200,8);
  rect(400,80,--mouseX+300,20);
  rect(300, 400, --mouseX, 20);
  fill(23,34,38);
  rect(400,160,--mouseX+140,10);
  rect(350,0,30,300);
  rect(0,190,280,5);
  //group1
  rect(200,300,20,20);
  rect(230,300,20,20);
  rect(260,300,20,20);
  rect(290,300,20,20);
  //group2
  rect(50,100,30,30);
  rect(50,140,30,30);
  rect(50,180,30,60);
  //group3
  rect(220,20,20,50);
  rect(250,20,20,30);
  rect(280,20,20,60);
  rect(310,20,20,20);
  //groupB
  fill(29,130,168);
  rect(0,280,60,20);
  rect(70,280,20,20);
  rect(100,280,10,20);
  rect(120,280,30,10);
  //B2
  rect(220,230,40,20);
  rect(270,230,20,20);
  rect(300,230,20,50);
  
  //fill(105,115,31);
  //rect(0,20,mouseX+40,20);
}
void mouseReleased()
{
  if (value == 0)
  {
    value = 20;
  }
  else
  {
    value = 0;
  }
}
                
