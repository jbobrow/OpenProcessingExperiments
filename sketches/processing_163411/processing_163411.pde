
float r = 200;

void setup()
{
  size(600, 600, P3D);
    smooth();
}
 
void draw()
{
  int dev; // how much flower grow.
  dev=mouseY/3;
  background(220-dev/2,60+dev/2,0);
   
  translate(width/2, height/2, 0);
  rotateX(radians(-120));
  rotateY(radians(0));
  rotateZ(mouseX/120);

    for (float deg1 = 0; deg1 < 360; deg1=deg1+30)
      {
        for (float deg2 =0; deg2 <dev; deg2=deg2+1)
          {
            float phi = radians(deg2);
            float theta = radians(deg1);
            float x = r * sin(phi) * cos(theta);
            float y = r * sin(phi) * sin(theta);
            float z = r * cos(phi);
 
            stroke(255,100+deg2/2,212);
            strokeWeight(deg2%36);
            point(x,y,z);
            stroke(127,255,212);
            strokeWeight(deg2%12+deg2/10);
            point(x,y,z);
            
           }
      }
}

