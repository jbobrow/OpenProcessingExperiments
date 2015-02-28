


profile eli; 
float thetaC,radC,altC; // coordenades cilindriques del punt central del perfil,
                       // p. ex. el centre de l'el.lipse.



void setup() 
{
  
  strokeWeight(3);
size(400,400,P3D); 
  camera(400,400,0,0,0,0,0,0,1);
  smooth(); 
  background(255); 
  frameRate(25);

  
  eli= new profile();
  initPath(); 
 
}

void draw()
{
   
   path(); 
   if(180*180-altC*altC > 100*100)
   {
   disp3D();
   } 

}

void disp3D()
{
  float[] x = new float[eli.t.length];
  float[] y = new float[eli.t.length];
  float[] z = new float[eli.t.length];
  
  // [NOU]
  stroke (abs(altC*2),abs((altC/50)*180),120);
  
  for(int j=0; j<eli.t.length;j++)  // canvi de coord 2D a cilindriques 3D 
  {
   x[j]=cos(thetaC)*(radC + eli.X[j]);
   y[j]=sin(thetaC)*(radC + eli.X[j]);
   z[j]=altC+eli.Y[j];
  point(x[j],y[j],z[j]); 
  
  }
  
}

void initPath()  // punt de partida
{
  altC=-180;
  thetaC=PI/4;
  radC=180;
}

void path() // calcul dels passos successius
{
 float step=1;
 altC=altC+step;
 thetaC=thetaC-0.08*step;

radC=abs(180-abs(altC));
  
}

void mouseClicked()
{
 
}

