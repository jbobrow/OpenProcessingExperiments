
float counter;

void setup()
{
size(500, 500);
background(#FFDEB4);
smooth();
}

void draw()
{
  background (#FFDEB4);
  translate(width/4, height/4);
  fill(255);
  stroke(0);
  ellipse(0,0,200,200);
  fill(0);
  ellipse(0,0, 50, 50);
  
  translate(width/2, 0);
  fill(255);
  stroke(0);
  ellipse(0,0,200,200);
  fill(0);
  ellipse(0,0, 50, 50);
  
float maxPos  = map(mouseY, 0, height, 0.05, 0.1);
float tearCol = map(sin(mouseY), -1, 1, 0, 100);
float tearPos = map(sin(counter), -1, 1, -100, 100);
float tear2Pos = map(cos(counter), -1, 1, -100, 100);

translate (0, (height/2.5)+tearPos);  //TRÃ�ï¿½NEN
stroke(0, 0, 255, 100);
fill(0, 0, 255, 100);
ellipse(0, 0, 20, 20);
translate (-width/2, tear2Pos-tearPos);
ellipse(0, 0, 20, 20);
counter+= maxPos;
}

