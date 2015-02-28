
void setup ()
{
  size(600,600);
  background(#8C706B);
  noCursor();
}

int a=100;

void mouseDragged()
{
  background(#8C706B);
    a--;

  fill (#D8899B,a);
  rect (0,0,600,600);
  scratcher();
    String l = "AHHH....";
  fill(#FFFFFF);
  textSize(20);
  text(l,0,20);
  if (mouseX>500 && mouseY>500) 
  {
   background(#8C706B);
  
  a=a-5;
  fill (#D8899B,a);
  rect (0,0,600,600);
    String w = "WHOA... RIGHT THERE... KEEP DOING THAT...";
  fill(#FFFFFF);
  textSize(20);
  text (w,0,15);
}
}

void draw () 
{
  background(#8C706B);
  fill (#D8899B);
  rect (0,0,600,600);
  scratcher();
   String s = "WHY'D YOU STOP?";
  fill(#FFFFFF);
  textSize(20);
  text(s,0,20);
}

void mouseMoved() 
{
  background(#8C706B);
    fill (#D8899B);
  rect (0,0,600,600);
  scratcher();
  String h = "HEY! QUIT WAVING IT AROUND AND SCRATCH!";
  fill(#FFFFFF);
  textSize(20);
  text(h,0,20);
}

void scratcher () 
{
  fill (#EFEA07);
  noStroke();
  rect (mouseX,mouseY,50,400);
  rect (mouseX-70,mouseY,20,-200);
  rect (mouseX-30,mouseY,20,-200);
  rect (mouseX+90,mouseY,20,-200);
  rect (mouseX+50,mouseY,20,-200);
  rect (mouseX+10,mouseY,20,-200);
  rect (mouseX-70,mouseY,180,30);
}

