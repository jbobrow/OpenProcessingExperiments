
//allonestring aug2011
float side = 32;
int bit = 32;
float weight = 64;
int alfa = 64;
color colour1 = color(255, 224, 0);
color colour2 = color(0, 255, 224);
color colour3 = color(224, 0, 255);

void setup()
{
  size(300, 300, P3D);
  background(160);
}

void draw()
{
  background(160);
  
  translate(width / 2, height / 2, 0);
  rotateX(frameCount * 0.001);
  rotateY(frameCount * 0.002);
  rotateZ(frameCount * 0.003);
  
  drawEdges(-side, -side, -side);
  drawEdges(side, side, -side);
  drawEdges(-side, side, side);
  drawEdges(side, -side, side);
}

void drawEdges(float x, float y, float z)
{
//uncomment this and play with side, bit and weight values ...  
//  float nx, ny, nz;
//  if(x > 0) nx = x - bit;
//  else nx = x + bit;
//  if(y > 0) ny = y - bit;
//  else ny = y + bit;
//  if(z > 0) nz = z - bit;
//  else nz = z + bit;
//  strokeWeight(weight/2);
//  stroke(colour1, alfa);
//  line(nx, y, z, -nx, y, z);
//  stroke(colour2, alfa);
//  line(x, ny, z, x, -ny, z);
//  stroke(colour3, alfa);
//  line(x, y, nz, x, y, -nz);
  
  for(int i = 0; i <= bit; i += 1)
  {
    strokeWeight((weight / bit) * i);
    float ix, iy, iz, ix1, iy1, iz1;
    
    if(x > 0) {ix = x - i; ix1 = x - i + 1;}
    else {ix = x + i; ix1 = x + i - 1;}
    if(y > 0) {iy = y - i; iy1 = y - i + 1;}
    else {iy = y + i; iy1 = y + i - 1;}
    if(z > 0) {iz = z - i; iz1 = z - i + 1;}
    else {iz = z + i; iz1 = z + i - 1;}

    stroke(colour1, alfa);
    line(ix, y, z, ix1, y, z);
    line(-ix, y, z, -ix1, y, z);
    stroke(colour2, alfa);
    line(x, iy, z, x, iy1, z);
    line(x, -iy, z, x, -iy1, z);
    stroke(colour3, alfa);
    line(x, y, iz, x, y, iz1);
    line(x, y, -iz, x, y, -iz1);
  }
}
  

