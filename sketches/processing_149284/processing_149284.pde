
//Número de partículas
int numThings=10;
int count=0;
boolean MouseIsDown=false;
float[] y = {};
float[] d = {};
int[] c = {};
 
Particle [] particles = new Particle[numThings];
 
void setup()
{
background(255,255,255);
size (710,390);
for (int i=0;i<numThings;i++)
{
//Color y posición de la partículas
particles[i]= new Particle(255,255,255,100, random(width),random(height));     
}   
} 
void draw()

{
  background(209);   
        for(int i=0;i<numThings;i++)
        {
            particles[i].makeParticle();
            particles[i].update();
            }
//TESELACIÓN
//FIN TESELACIÓN
//aqui podríamos introducir el voronoi

//fin de voronoi
}
void mousePressed()
{
  MouseIsDown=true;
}
void mouseReleased()
{
  MouseIsDown=false;
  count++;
}
class Particle
{
//introducimos las variables de las partículas
  float R;
  float G;
  float B;
  float size;
  float x;
  float y;
  float speed = random(0.01,0.05);
  float direction = random(1,3);
  float mehX=0;
  float mehY=0;
  float easing=random(0.01,0.05);
  Particle(float r, float g, float b, float S, float XPos, float YPos)
  {
    R=r;
    G=g;
    B=b;
    size = S;
    x=XPos;
    y=YPos;
    //speed= random(1,2.3);
     
  }
  void makeParticle()
  {
    noStroke();
    fill(R,G,B,100);
    ellipse (x,y,5,5);
  }
   
  void update()
  {
  //diseñamos la velocidad y el rebote con los bordes
                  if (x > width)
                  {
                    //x = 0;
                    x=-x;
                    direction= abs(direction);
                  }
                
                  if (x < 0)
                  {
                    //x = width;
                    x= abs(x);
                    direction=-(direction);
                  }
                
                  if (y > height)
                  {
                    speed=-speed;
                    //direction= random(1,360);
                  }
                
                  if (y < 0)
                  {
                    speed= abs(speed);
                     //direction= random(1,360);
                  }
                   
                  //CHANGING POSITION
                   
                  //x = x + dX;
                  //y = y + dY;
              
 //Lineas de unión entre las particulas más cercanas                  
     for (int i = 0; i<numThings;i++)
      {
               Particle  I = particles[i];
              int num=40;
              if ((I.x-x)<num && (I.x-x)>-num)
              {
                if (I.y-y<num && (I.y-y>-num))
                {
//Centro sobre las lineas
                  stroke(0,0,0,0);
                  strokeWeight(1);
                  line(x,y, I.x,I.y);
                  noStroke();
                }
                 
              }
      }           
      
 //fin de las lineas de unión     
      if (MouseIsDown)
         {
            mehX = mouseX-x;
            if (abs(mehX)>1)
              {x = x + mehX * easing ;}
             
             mehY = mouseY-y;
            if (abs(mehY)>1)
              {y = y + mehY * easing ;}
          }
           
            y=y+speed;
            x=x+direction;
                            
    }
     
     
 
}
//intento de meter la teselación
