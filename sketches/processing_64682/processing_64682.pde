
int leng = 25;
int[] x;
int[] y;
int[] z;

int rleng = 40000;

color star;
float back = random(240, 255);

int[] mx;
int[] my ;
int[] mz ;

int rota = 0;

void setup() 
{
  size(700, 700, P3D);
  smooth();

  x = new int[leng];
  y = new int[leng];
  z = new int[leng];

  mx = new int[rleng];
  my =  new int[rleng]; 
  mz =  new int[rleng]; 

  colorMode(HSB);
  noStroke();

  sphereDetail(6, mouseX );
}

void draw()
{

  if (keyPressed==true)
  {
    float black = random(240, 255);
    
    background(255-black);
    for (int i=0; i< rleng ; i++)
    {
      star = color( random(150, 220), random(180, 250), random(240, 250), 40); 
      fill(star);
     pushMatrix();
      translate( mx[i] , my[i] ,  mz[i]);
      sphere(random(3));
      popMatrix();
    }
    
  }
  else
  {
    background(back);

    for (int i=0; i<leng-1; i++)
    {
      star = color( random(130, 220), random(180, 250), random(240, 250), 40); 
      fill(star);
      pushMatrix();
      translate(x[i], y[i], z[i]);
      sphere(random(i/2));
      popMatrix();
    }
  }
}

void mouseDragged(){
sav(x,y,z);
}

void mouseMoved()
{
 
  background(back);
  ppoints();


  for (int i=0; i<leng-1; i++)
  {
    star = color( random(130, 220), random(180, 250), random(240, 250), 40); 
    fill(star);

    pushMatrix();
    translate(x[i], y[i], z[i]);
    sphere(random(i/2));

    popMatrix();
  }
  
}

void ppoints()
{
  for (int i = 0; i<leng-1;i++)
  {
    x[i] = x[i+1];
    y[i] = y[i+1];
    z[i] = (int) random(100);
  }
  x[leng-1]= mouseX;
  y[leng-1]= mouseY;
}

void sav(int[] x, int[] y, int[] z)
{

  for (int i =0; i< leng ; i++)
  {
    mx[rota+i] = x[i];
    my[rota+i] = y[i];
    mz[rota+i] = z[i];
  }
  rota= rota + x.length ;
}


