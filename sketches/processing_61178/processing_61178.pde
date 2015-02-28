
import processing.video.*;
MovieMaker m1;
int maxVel=1, radio=1, tam=300, divi=20;
float tu=.2;
color filling = color(random(255), random(255), random(255));
punto[] e = new punto[tam];
punto p;
void setup()
{
  size(450, 450);
  for (int i=0;i<tam;i++)
    e[i] = new punto(i);
  p = new punto(0, 400);
  strokeWeight(.1);
  //m1 = new MovieMaker(this,width,height,"hola.mov",24,MovieMaker.ANIMATION,MovieMaker.LOSSLESS);
}
void draw()
{
  background(0);
  if (mousePressed&&mouseButton==LEFT)
    filling = color(random(255), random(255), random(255));
  if (true)//mousePressed&&mouseButton==RIGHT)
    for (int i=0;i<tam;i++)
    {
      PVector d = new PVector(e[i].x, e[i].y);
      d.x-=mouseX+random(-10, 10);
      d.y-=mouseY+random(-50, 50);
      if (d.mag()<1000)
      {
        float tut=d.mag();
        tut*=0.0001;
        float angulo = atan2(d.y, d.x);
        e[i].vx-=cos(angulo)*tut;
        e[i].vy-=sin(angulo)*tut;
      }
    }
  //p.pintar();
  //p.colision();
  //p.avanzar();
  for (int i=0;i<tam;i++)
  {
    e[i].avanzar();
    e[i].pintar();
    e[i].cercanos();
    e[i].divisiones();
    //e[i].colision();
    e[i].colision1();
  }
  //m1.addFrame();
  //if(frameCount%24==0)
  //println(frameCount/24);
}
class punto
{
  float x, y, vx, vy, r;
  color col;
  int id, id_c, id_c1;
  punto(int i_)
  {
    id = i_;
    x = random(width/2-20, width/2);
    y = random(height/2-20, height/2);
    vx = random(-maxVel, maxVel);
    vy = random(-maxVel, maxVel);
    col = color(random(255), random(255), random(255));
    r = int(radio);
  }
  punto(int i_, float r_)
  {
    id = i_;
    x = random(width);
    y = random(height);
    vx = random(-maxVel, maxVel);
    vy = random(-maxVel, maxVel);
    col = color(random(255), random(255), random(255));
    r = r_;
  }
  void pintar()
  {
    fill(col);
    fill(255);
    ellipse(x, y, r, r);
  }
  void avanzar()
  {
    if (x<0||x>width)
    { 
      vx*=-1;
      if (vx>maxVel)vx=maxVel;
      if (vx<-maxVel)vx=-maxVel;
    }
    if (y<0||y>height)
    { 
      vy*=-1;
      if (vy>maxVel)vy=maxVel;
      if (vy<-maxVel)vy=-maxVel;
    }
    x+=vx;
    y+=vy;
  }
  void cercanos()
  {
    float dMin = 1E12, dx, dy, d=0;
    for (int i=0;i<tam;i++)
    {
      if (i==id)continue;
      dx = sq(e[i].x - x);
      if (dx < dMin)
      {
        dy = sq(e[i].y - y);
        if (dy<dMin)
        {
          d = dx+dy;
          if (d<dMin)
          {
            dMin = d;
            id_c = i;
          }
        }
      }
    }
    dMin = 1E12;
    for (int i=0;i<tam;i++)
    {
      if (i==id||i==id_c)continue;
      dx = sq(e[i].x - x);
      if (dx < dMin)
      {
        dy = sq(e[i].y - y);
        if (dy<dMin)
        {
          d = dx+dy;
          if (d<dMin)
          {
            dMin = d;
            id_c1 = i;
          }
        }
      }
    }
    stroke(filling);
    line(e[id_c].x, e[id_c].y, x, y);
    line(e[id_c1].x, e[id_c1].y, x, y);
  }
  void divisiones()
  {
    int lineas = 20;
    float dx, dy, d, ang, dx1, dy1, d1, ang1;
    dx = e[id_c].x-x;
    dy = e[id_c].y-y;
    d=dist(e[id_c].x, e[id_c].y, x, y);
    divi = int(map(d, 0, 100, 1, lineas));
    d = d/divi;
    ang = atan2(dy, dx);
    dx1 = e[id_c1].x-x;
    dy1 = e[id_c1].y-y;
    d1=dist(e[id_c1].x, e[id_c1].y, x, y);
    int divi1 = int(map(d1, 0, 100, 1, lineas));
    d1 = d1/divi1;
    ang1 = atan2(dy1, dx1);
    float[][] seg = new float[divi][2], seg1 = new float[divi1][2];
    for (int i=0;i<divi;i++)
    {
      seg[i][0] = x + cos(ang)*i*d;
      seg[i][1] = y + sin(ang)*i*d;
      //ellipse(seg[i][0],seg[i][1],5,5);
      //ellipse(seg1[i][0],seg1[i][1],5,5);
    }
    for (int i=0;i<divi1;i++)
    {
      seg1[i][0] = x + cos(ang1)*i*d1;
      seg1[i][1] = y + sin(ang1)*i*d1;
    }
    int cont=divi-1;
    int r = int((red(col)+red(e[id_c].col)+red(e[id_c1].col))/3);
    int g = int((green(col)+green(e[id_c].col)+green(e[id_c1].col))/3);
    int b = int((blue(col)+blue(e[id_c].col)+blue(e[id_c1].col))/3);
    stroke(r, g, b);
    stroke(filling);
    for (int i=0;i<divi;i++)
    {
      line(seg[i][0], seg[i][1], seg1[cont][0], seg1[cont][1]);
      cont--;
    }
  }
  void colision()
  {
    for (int i=0;i<e.length;i++)
    {
      float dx = e[i].x-x;
      float dy = e[i].y-y;
      float dis = sqrt(dx*dx + dy*dy);
      tu = map(dis, 0, r, 0.2, 0.05);
      if (dis<=r)
      {
        float angulo = atan2(dy, dx);
        float angulo1 = atan2(-dy, -dx);
        e[i].vx+=cos(angulo)*tu;
        e[i].vy+=sin(angulo)*tu;
      }
    }
  }
  void colision1()
  {
    for (int i=0;i<e.length;i++)
    {
      if (i==id)continue;
      float dx = e[i].x-x;
      float dy = e[i].y-y;
      float dis = sqrt(dx*dx + dy*dy);
      if (dis<=r*2) {
        float angulo = atan2(dy, dx);
        float angulo1 = atan2(-dy, -dx);
        vx-=cos(angulo)*tu;
        vy-=sin(angulo)*tu;
        e[i].vx+=cos(angulo)*tu;
        e[i].vy+=sin(angulo)*tu;
        //x-=(r*2-dis)*cos(angulo);
        //y-=(r*2-dis)*sin(angulo);
      }
    }
  }
}
void stop()
{
  //m1.finish();
}


