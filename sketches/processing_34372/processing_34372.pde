
ArrayList vertices = new ArrayList();
PGraphics fondo;
PImage brillo;
int cont=0,tx=100,ty=10,c1=2*tx/3,c2=4*tx/3;
void setup()
{
  size(450,450);
  fondo = createGraphics(900,450,JAVA2D);
  fondo.beginDraw();
  fondo.smooth();
  fondo.stroke(255,0,0);
  //fondo.strokeWeight(4);
  fondo.fill(0,0,244,100);
  fondo.noFill();
  fondo.endDraw();
  for(int i=0;i<tx;i++)
  {
    vertices.add(new PVector(-width/2+10*i,100+5*i));
    vertices.add(new PVector(width/2-10*i,100+5*i));
    vertices.add(new PVector(0,height-10*i));
  }
}
void draw()
{
  background(0);  
  //fondo.background(0);
  fondo.beginDraw();
  fondo.translate(width/2,0);
  fondo.beginShape();
  for(int i=0;i<cont;i++)
  {
    if(i==0)
      fondo.stroke(255,0,0);
    if(i==c1)
      fondo.stroke(0,255,0);
    if(i==c2)
      fondo.stroke(0,0,255);
    PVector a = (PVector)vertices.get(i);
    fondo.vertex(a.x,a.y);
  }
  fondo.endShape();
  fondo.endDraw();
  brillo = fondo.get(0,0,fondo.width,fondo.height);
  brillo.resize(0,width/2);
  brillo.filter(BLUR,6);
  brillo.resize(0,width);
  image(brillo,0,0);
  image(fondo,0,0);
  if(cont<vertices.size())
    cont+=3;
}
void mousePressed()
{
  vertices.add(new PVector(mouseX,mouseY));
}

