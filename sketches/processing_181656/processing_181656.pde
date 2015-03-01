
//LIBRAIRIES

//VARIABLES
float[] xballe;
float[] yballe;

float[] vxballe;
float[] vyballe;
int nombreBilles =90;


void setup()
{
  background(255);
  size(1200, 500);

  xballe =new float[nombreBilles];
  yballe= new float[nombreBilles];
  vxballe= new float [nombreBilles];
  vyballe= new float [nombreBilles];
  for (int i=0; i<nombreBilles; i=i+1)
  {
    xballe[i]= random(0, width);
    yballe[i]= random(0, height);
    vxballe[i]= random(-3, 3);
    vyballe[i]= random(-3, 3);
  }
}


void draw()
{

  noStroke();
  fill(255, 255, 255, 40);
  rect(0, 0, width, height);

  for (int i=0; i<nombreBilles; i=i+1) 
  {


    stroke(random(50, 170), random(50, 170), random(50, 170));
    fill(2, 2, 2, 0);
    ellipse(xballe[i], yballe[i], 1, 1);
    xballe[i]=xballe[i]+vxballe[i];
    yballe[i]= yballe[i] +vyballe[i];


    if (xballe[i]-2 <=0)//bordure gauche
    { 
      vxballe[i] = -vxballe[i];
    }

    if (xballe[i]+2 >=width)//bordure droite
    { 
      vxballe[i] = -vxballe[i];
    }

    if (yballe[i]-2 <=0)//bordure haute
    { 
      vyballe[i] = -vyballe[i];
    }
    if (yballe[i]+2 >=height)//bordure basse
    { 
      vyballe[i] = -vyballe[i];
    }

    for (int j=i+1; j<nombreBilles; j=j+1)
    {
      if (dist(xballe[i], yballe[i], xballe[j], yballe[j])<=100)//distance des intéractions
      {
        line(xballe[i], yballe[i], xballe[j], yballe[j]);
      }
    }
  }
}

