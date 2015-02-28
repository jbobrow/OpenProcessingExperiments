
class Sphere { 

  float xpos, ypos, swidth, sheight, vdetail, hdetail; 
  PImage texture1;
  verts[] points;

  Sphere (float x, float y, float w) {  
    xpos = x;
    ypos = y;
    swidth = w;
    sheight = w;
    vdetail = 10;
    hdetail = 10;
    getpoints();
  } 
  Sphere (float x, float y, float w, float h) {  
    xpos = x;
    ypos = y;
    swidth = w;
    sheight = h;
    vdetail = 10;
    hdetail = 10;
    getpoints();
  } 
  Sphere (float x, float y, float w, float h, float vd, float hd) {  
    xpos = x;
    ypos = y;
    swidth = w;
    sheight = w;
    vdetail = vd;
    hdetail = hd;
    getpoints();
  } 

  void getpoints() { 
    int count=0;
    points =  new verts[0];
    float x1, x2, x3, x4, y1, y2, y3, y4, z1, z2, z3, z4;
    noStroke();
    for (int i = 0; i<2.0*vdetail;i++) {
      for (int j = 0;j<hdetail;j++)
      {
        x1= cos(i/vdetail*PI*1.0);
        x1*=swidth*sin(j/hdetail*PI);
        x2 = cos((i+1)/vdetail*PI*1.0);
        x2*=swidth*sin(j/hdetail*PI);
        x3 = cos(i/vdetail*PI*1.0);
        x3*=swidth*sin((j+1)/hdetail*PI);
        x4 = cos((i+1)/vdetail*PI*1.0);
        x4*=swidth*sin((j+1)/hdetail*PI);
        y1= cos(j/hdetail*PI);
        y1*=swidth;
        y2=cos(j/hdetail*PI);
        y2*=swidth;
        y3=cos((j+1)/hdetail*PI);
        y3*=swidth;
        y4=cos((j+1)/hdetail*PI);
        y4*=swidth;
        z1= sin(i/vdetail*PI*1.0);
        z1*=sheight*sin(j/hdetail*PI);
        z2 = sin((i+1)/vdetail*PI*1.0);
        z2*=sheight*sin(j/hdetail*PI);
        z3 = sin(i/vdetail*PI*1.0);
        z3*=sheight*sin((j+1)/hdetail*PI);
        z4 = sin((i+1)/vdetail*PI*1.0);
        z4*=sheight*sin((j+1)/hdetail*PI);
        if (texture1!= null)
        {

          /*
          vertex(x1, y1, z1,i/vd*pg.height,j/(hd*2.0)*pg.width);
           
           
           vertex(x3, y3, z3,i/vd*pg.height,(j+1)/(hd*2.0)*pg.width);
           
           vertex(x4, y4, z4,(i+1)/vd*pg.height,(j+1)/(hd*2.0)*pg.width);
           vertex(x2, y2, z2,(i+1)/vd*pg.height,j/(hd*2.0)*pg.width);
           
           
           */
          points = (verts[])append(points, new verts(x1, y1, z1, i/vdetail*texture1.height, j/(hdetail*2.0)*texture1.width));
          points = (verts[])append(points, new verts(x3, y3, z3, i/vdetail*texture1.height, (j+1)/(hdetail*2.0)*texture1.width));
          points = (verts[])append(points, new verts(x4, y4, z4, (i+1)/vdetail*texture1.height, (j+1)/(hdetail*2.0)*texture1.width));
          points = (verts[])append(points, new verts(x2, y2, z2, (i+1)/vdetail*texture1.height, j/(hdetail*2.0)*texture1.width));
        }
        else
        {
          points = (verts[])append(points, new verts(x1, y1, z1));
          points = (verts[])append(points, new verts(x3, y3, z3));
          points = (verts[])append(points, new verts(x4, y4, z4));
          points = (verts[])append(points, new verts(x2, y2, z2));
        }
      }
    }
  }
  void draw()
  {
pushMatrix();

    beginShape(QUADS);
    if (this.texture1 != null)
    {
      texture(texture1);
      for (int i = 0; i<points.length;i++)
      {
        vertex(points[i].x, points[i].y, points[i].z, points[i].ht, points[i].vt);
      }
    }
    else{
      for (int i = 0; i<points.length;i++)
      {
        vertex(points[i].x, points[i].y, points[i].z);
      }
  }
  endShape();popMatrix();
  
}
void texturize(PImage graphic)
{
  textureMode(IMAGE);
  texture1 = graphic;
}
}
class verts {
  float x, y, z;
  float ht, vt;
  verts(float x, float y, float z)
  {
    this.x =x;
    this.y = y;
    this.z =z;
  }
  verts(float x, float y, float z, float ht, float vt)
  {
    this.x =x;
    this.y = y;
    this.z =z;
    this.ht = ht;
    this.vt = vt;
  }
}
Sphere[] s;
float fx, fy;
PGraphics pgra;
void setup()
{
  pgra = createGraphics(200, 100);
  pgra.beginDraw();
  pgra.background(255);
  pgra.fill(0);
  pgra.rect(0, pgra.height/3.0, 400, pgra.height/3.0);
  //pgra.rect(0,pgra.height-(pgra.height/3.0),100,pgra.height/3.0*2.0);
  pgra.fill(255);  
  pgra.ellipse(pgra.height/5.0, pgra.height/2.0, pgra.height/5.0, pgra.height/5.0);
  pgra.textSize(pgra.height/7.0);
  pgra.textAlign(CENTER);
  pgra.fill(0);
  pgra.stroke(0);
  pgra.text("8", pgra.height/5.0, pgra.height/2.0+(pgra.height/5.0/4.0));
  pgra.endDraw();
  fx = 0;
  fy =0 ;
  size(500, 500, P3D);
  s = new Sphere[10];
  
  for (int i = 0; i<10; i++)
  {
    
   s[i]= new Sphere(random(0,500), random(0,500), 20);
   s[i].texturize(pgra.get());
   s[i].getpoints();
  }
  
}
void draw()
{
  background(255);
  noStroke();
  fill(255, 100);
  //image(pgra.get(), 0, 0);
  for (int i = 0;i<10;i++)
  {
    
    pushMatrix();
      translate(s[i].xpos, s[i].ypos);
  fx += pmouseX-mouseX;
  fy += pmouseY-mouseY;
  rotateX(fx/PI/100);
  rotateY(fy/PI/100);
  s[i].draw();
  popMatrix();
  }
  
}

