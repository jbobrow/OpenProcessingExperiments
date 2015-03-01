
float s = 220, l = 12, n, nz = 7, nthreshold = .48;
PVector nr = new PVector(random(123), random(123), random(123));//noise root
int nb, c1 = color(255, 80, 0), c2 = color(225, 190, 180);

void setup()
{
  size(300, 300, OPENGL);
  nb = int(s/l);
}

void draw()
{
  background(40);
  translate(width/2, height/2, -120);
  rotateX(map(mouseY, 0, height, PI/.8, -PI/.8));
  rotateY(map(mouseX, 0, width, -PI/.8, PI/.8));

  nr.add(new PVector(.04, .01, .01));  
  for (int i = 0; i < nb+1; i++)
  {
    for (int j = 0; j < nb+1; j++)
    {
      for (int k = 0; k < nb+1; k++)
      {
        n = noise(i/nz + nr.x, j/nz + nr.y, k/nz + nr.z);
        if (n > nthreshold)
        {         
          stroke(map(n, nthreshold, .7, 0, 1)*255, 180);
          fill(lerpColor(c1, c2, map(n, nthreshold, .65, 0, 1)), 150);
          pushMatrix();
          translate(i*l - s/2, j*l - s/2, k*l - s/2);
          box(l);
          popMatrix();
          /* 
          //works well in Java
          stroke(0, 150);
          strokeWeight(l);
          point(i*l - s/2, j*l - s/2, k*l - s/2);          
          stroke(lerpColor(c1, c2, map(n, nthreshold, .65, 0, 1)), 150);
          strokeWeight(l-3);
          point(i*l - s/2, j*l - s/2, k*l - s/2);  */     
        }
      }
    }
  }
}



