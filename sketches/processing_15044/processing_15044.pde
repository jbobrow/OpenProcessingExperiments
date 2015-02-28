
float degree,zoom;
float zStep = 3;
float rStep = 1.25;
float[] rLength = new float[20];

void setup()
{
  int i;

  size(800,300);
  background(255);

  zoom = 3;

  for(i=-10 ;i<10;i+=2) {
    rLength[i+10] = 50 * pow(cos(PI*i/40),0.5);
  }
}

void draw()
{
  int i,j;
  float theta, phi, sinT, cosT, sinP, cosP, valueA, valueB, valueC;
  float localX1, localY1, localZ1, localX0, localY0, localZ0;
  float cmp0,cmp1,cmp2,cmp3,cmp4;

  background(255);
  degree += 1.5;
  for(i=10;i<140;i++) {
    theta = PI*(i+degree/4)/35;
    rStep = sin(PI*i/140);

    cmp4 = i * zStep;

    for(j=-10 ;j<10;j+=2) {
      phi = PI*(i+j+degree/10)/40;

      sinT = sin(theta);
      cosT = cos(theta);
      sinP = sin(phi);
      cosP = cos(phi);

      valueA = j * rStep;
      valueB = rLength[j+10] * cosP;
      valueC = rLength[j+10] * sinP;

      cmp0 = cosT * valueA;
      cmp1 = sinT * valueB;
      cmp2 = sinT * valueA;
      cmp3 = cosT * valueB;

      localX1 = cmp0 + cmp1;
      localY1 = cmp2 - cmp3;
      localZ1 = cmp4 + valueC;
      localX0 = cmp0 - cmp1;
      localY0 = cmp2 + cmp3;
      localZ0 = cmp4 - valueC;

      strokeWeight(1);
      stroke(color(cosT*25+230,cosT*25+210,cosT*25+190,50));
      line3D(localZ0+200,localX0+140,localY0+70,localZ1+200,localX1+140,localY1+70);
    }
  }
}

void line3D(float z0,float x0,float y0,float z1,float x1,float y1) 
{
  float halfW = width/2;
  float halfH = height/2;
  float za = z0 - halfW;
  float xa = x0 - halfH;
  float zb = z1 - halfW;
  float xb = x1 - halfH;
  za += za*(zoom*y0)/width + halfW;
  xa += xa*(zoom*y0)/height + halfH;
  zb += zb*(zoom*y0)/width + halfW;
  xb += xb*(zoom*y0)/height + halfH;
  line(za,xa,zb,xb);
}

                
                
