
void setup()
{
  size(700, 700);  
  smooth();
  background(0);
  float sw=5; //for stroke weight
  int al=300; // for alpha value
  int inc=0;
  int ang;
  
  for(int i=90; i<=190; i+=4  )
  { 
    sw= sw-0.1;
    al= al-12;
    ang=i+inc*2;
    lineAngle(350, 350, ang, 300, sw, al, 80);
    inc++;
  }
  
    for(int i=280; i<=360; i+=4  )
  { 
    sw= sw+0.1;
    al= al+12;
    ang=i-inc*2;
    lineAngle(350, 350, ang, 300, sw, al, 80);
    inc--;
  }
  for(int j=-90; j<=180; j+=10)
  {
    lineAngle(550, 150, j, 30, 1, 150, 10);
  }
}

void lineAngle(int x, int y, float angle, float length, float sw, int al, int gap)
{
  stroke(0, 255, 0, al);
  strokeCap(SQUARE);
  strokeWeight(sw);
  line(x+gap*cos(radians(angle)), y+gap*-sin(radians(angle)), x+cos(radians(angle))*length, y-sin(radians(angle))*length);
}

