
//Martin Costa, CP1, Mods 4-5

void setup()
{
  size(600,400);
  strokeWeight(5);
  frameRate(60);
  background(125);
}

int x1 = 10;
float x2 = 0;


void draw()
{
  recoil();
  shot();
  
    if (x2 < -0.5)
  {
    x2 = 0;
    x3 = 180;
    x4 = 185;
  }
  
  

}


void recoil()
{
  background(125);
  if(x1 > 400)
  {
    x1 = 10;
  }
  //ellipse(x1,x1,x1,x1);
  x1 = x1 + 10;
  line(100,350,120,310); //legs
  line(140,350,120,310);
  line(120,310,120,270); //body
  ellipse(120,255,30,30); //head
  
  translate(120,270);
  rotate(x2*PI/2);
  translate(-120,-270);
  line(120,270,130,280); //arms
  line(120,270,135,275);
  line(130,280,150,270);
  line(135,275,150,270);
  
  
  
  
  //quad(150,280,150,260,160,260,160,280);
  fill(0);
  strokeWeight(1);
  beginShape(); //gun
  vertex(150,280);
  vertex(150,260);
  vertex(180,260);
  vertex(180,270);
  vertex(160,270);
  vertex(160,280);
  vertex(150,280);
  endShape();
  x2 = x2 - 0.025;

}

int x3 = 180;
int y3 = 262;
int x4 = 185;
int y4 = 265;
int speed = 10;
  
void shot()
{
  
 
  
  translate(120,270);
  rotate(-1*(x2*PI/2));
  translate(-120,-270);
  noStroke();
  fill(200,200,20);
  quad(x3,y3,x3,y4,x4,y4,x4,y3);
  fill(0);
  stroke(0);
  x3 = x3 + speed;
  x4 = x4 + speed;
}
