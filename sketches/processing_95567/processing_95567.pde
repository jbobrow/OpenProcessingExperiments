
class Kulka {
  int x;
  int y;
  float vx;
  float vy;
  float r;
  float influence = 400;
  int maxDistance = 700;


  Kulka(int a, int b)
  {
    x = a;
    y = b;
    vx = int(random(2, 7));
    vy = int(random(2, 7));
    r = random(100, 20);
  }

  void plot() {
    noStroke();



    PVector mousePos, shapePos;
    mousePos = new PVector (mouseX, mouseY);
    shapePos = new PVector (x, y);

    float diameter = min (dist(mousePos.x, mousePos.y, shapePos.x, shapePos.y), influence);
    diameter =100+ (diameter*200/maxDistance);
    fill(random(0, 255), random(0, 255), random(0, 255), 50);
    ellipse( x, y, diameter, diameter);
    r= diameter;
  }

  void go() {
    x += vx;                     
    y += vy;                     

    if (x >= width - ((r/2)))          
      vx = -abs(vx);             
    if (y >= height - ((r/2)))       
      vy = -abs(vy);
    if (x <= r/2)                 
      vx = abs(vx);
    if (y <= r/2)                  
      vy = abs(vy);

    PVector mousePos2, shapePos2, moveShape;
    mousePos2 = new PVector (mouseX, mouseY);
    shapePos2 = new PVector (x, y);
    moveShape = new PVector ((mousePos2.x - shapePos2.x), (mousePos2.y - shapePos2.y));
    if (mag(moveShape.x, moveShape.y) < 100) {
      if (mousePos2.x < shapePos2.x)
        vx = vx-(abs(mousePos2.x-vx))/1000;
      if (mousePos2.x > shapePos2.x)
        vx = vx+(abs(mousePos2.x-vx))/1000;
      if (mousePos2.y < shapePos2.y)
        vy = vy-(abs(mousePos2.y-vy))/1000;
      if (mousePos2.y > shapePos2.y)
        vy = vy+(abs(mousePos2.y-vy))/1000;
    }
  }
}

Kulka [] kulki;
int maxK = 100;
int liczK;

void setup(){
size(1000,500);

kulki= new Kulka[maxK];
}
void draw(){
  background(0);
  

if(liczK < maxK && frameCount/200 > liczK )
  {
  kulki[liczK] = new Kulka(int(random(width)), 1);
  liczK++;

}
  for(int i = 0; i < liczK;i++)
  {
    kulki[i].go();
    kulki[i].plot();

  }
}





