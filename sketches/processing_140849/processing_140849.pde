
void setup()
{
  size(500,500);
}
void draw()
{
  background(0,255,255);
  
  noStroke();
  fill(255);
  ellipse(20,120,50,50);
  ellipse(50,120,50,50);
  ellipse(80,120,50,50);
  ellipse(110,120,50,50);
  ellipse(140,120,50,50);
  ellipse(170,120,50,50);
  ellipse(200,120,50,50);
  ellipse(230,120,50,50);
  ellipse(260,120,50,50);
  ellipse(290,120,50,50);
  ellipse(320,120,50,50);
  ellipse(350,120,50,50);
  ellipse(380,120,50,50);
  ellipse(410,120,50,50);
  ellipse(440,120,50,50);
  ellipse(470,120,50,50);
  ellipse(500,120,50,50);
  fill(255,255,0);
  ellipse(470,40,100,100);
  stroke(0);
  fill(0);
  quad(0,500,0,120,500,120,500,500);
  fill(100);
  quad(0,500,150,120,350,120,500,500);
  fill(255,0,0);
  quad(0,500,30,400,120,400,100,500);
  fill(255);
  quad(30,400,60,300,140,300,120,400);
  fill(255,0,0);
  quad(60,300,90,200,160,200,140,300);
  fill(255);
  quad(90,200,114,120,175,120,160,200);
  
  //lado direito
  fill(100);
  fill(255,0,0); // editando
  quad(500,500,400,500,380,400,470,400);
  fill(255);
  quad(470,400,380,400,360,300,440,300);
  fill(255,0,0);
  quad(340,200,410,200,440,300,360,300);
  fill(255);
  quad(325,120,386,120,410,200,340,200);

 
  
}
