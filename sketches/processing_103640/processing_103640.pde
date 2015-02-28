
int screenWidth = 800;
int screenHeight = 600;
int numberTwo = 123;

void setup()
{
  size(screenWidth, screenHeight);
float circleXPos = 200;
drawConcentricCircles(200,200, "LOLOLOLOL");
drawConcentricCircles(200,300, "LOLOLOLOL");
drawConcentricCircles(200,400, "LOLOLOLOL");
drawConcentricCircles(200,500, "LOLOLOLOL");
drawConcentricCircles(200,100, "LOLOLOLOL");
drawConcentricCircles(60,100, "LOLOLOLOL");
drawConcentricCircles(60,200, "LOLOLOLOL");
drawConcentricCircles(60,300, "LOLOLOLOL");
drawConcentricCircles(60,400, "LOLOLOLOL");
drawConcentricCircles(60,500, "LOLOLOLOL");
drawConcentricCircles(350,500, "LOLOLOLOL");
drawConcentricCircles(350,400, "LOLOLOLOL");
drawConcentricCircles(350,300, "LOLOLOLOL");
drawConcentricCircles(350,200, "LOLOLOLOL");
drawConcentricCircles(350,100, "LOLOLOLOL");
drawConcentricCircles(500,500, "LOLOLOLOL");
drawConcentricCircles(500,400, "LOLOLOLOL");
drawConcentricCircles(500,300, "LOLOLOLOL");
drawConcentricCircles(500,200, "LOLOLOLOL");
drawConcentricCircles(500,100, "LOLOLOLOL");
drawConcentricCircles(650,500, "LOLOLOLOL");
drawConcentricCircles(650,400, "LOLOLOLOL");
drawConcentricCircles(650,300, "LOLOLOLOL");
drawConcentricCircles(650,200, "LOLOLOLOL");
drawConcentricCircles(650,100, "LOLOLOLOL");
}

void drawConcentricCircles (float xPos, float yPos, String CircleText)
{
  //drawcircles
fill(255,248,21);
ellipse(xPos,yPos,100,100);
ellipse(xPos,yPos,50,50);
ellipse(xPos,yPos,10,10);

fill(49,0,250);
textSize(20);
text(CircleText, xPos,yPos);
}
