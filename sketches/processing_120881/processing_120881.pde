
//Denne kode er designet til at vise objekter som falder ned mod jorden
//Erklærer variablerne for objekterne
Rain regn1;
Rain regn2;
Rain regn3;
Rain regn4;
Rain regn5;

void setup()
{
  //Beskriver størrelsen og frameraten af programmet
  size(1280,720);
  frameRate(60);
  //Initialiserer objekterne
  regn1 = new Rain();
  regn2 = new Rain();
  regn3 = new Rain();
  regn4 = new Rain();
  regn5 = new Rain();
}

void draw()
{
  //Tegner baggrunden aktivt for at refreshe baggrunden hver frame
  background(#ffffff);
  //Starter den første regndråbe
  regn1.rainFall();
  regn1.physics();
  //Starter den anden regndråbe
  regn2.rainFall();
  regn2.physics();
  //Starter den tredje regndråbe
  regn3.rainFall();
  regn3.physics();
  //Starter den fjerde regndråbe
  regn4.rainFall();
  regn4.physics();
  //Starter den femte regndråbe
  regn5.rainFall();
  regn5.physics();
}
class Rain
{
float  xPos; 
float  yPos;  
int  stor;  
float  speed;
  Rain()
  { 
    speed = random(4,20);
    xPos = random(1,1280); 
    yPos = random(-100,-10);  
  }
  void rainFall()
  {  
    fill(0,0,0);
    ellipse(xPos,yPos,10,10);
  }
  void physics()
  {
    yPos = yPos+speed;
    if(yPos>715)
    {
      yPos = random(-100,-10);
      xPos = random(1,1280);
      speed = random(4,20);    
    }
  }

}


