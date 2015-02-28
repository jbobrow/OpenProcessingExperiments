
class Ball{
  float x, y, r;//posicion inicial en x e y, y el diametro
  int coll, direx, direy;//color, direccion en x e y
  float velx;//velocidad en x
  float vely; //velocidad en y
  Ball[] otras;

  // posicion x, pos y, radio, color, direccion x, direccion y, velocidad x e y, el array con las otras pelotas
  Ball(float xx, float yy, float rr, int col, int dirx, int diry, float vx, float vy, Ball[] ot)
  {
    x =xx;
    y = yy;
    r = rr;
    coll = col;
    direx = dirx;
    direy = diry;
    velx = vx;
    vely = vy;
    otras = ot;
  }
 
void mover()
{
 x += (velx * direx);
 y += (vely * direy);
}  

void borde()
{
if(x >= width-(r/2) || x <= r/2)
  {direx = -direx; x += (velx * direx);};
if(y >= height-(r/2) || y <= r/2)
  {direy = -direy; y += (vely * direy);};
}

void colision()
{
 for(int i = 0; i < pelota.length; i++)
    {               
     PVector posicion1 = new PVector(x - otras[i].x, y - otras[i].y);
     float distancia = sqrt((posicion1.x * posicion1.x) + (posicion1.y * posicion1.y));    
    float radio  = (r + otras[i].r)/2;//el radio con el q comparo abajo la distancia  

     if(distancia <= radio)
       {//cambio la direccion de las pelotitas
         if(direx != otras[i].direx)
           {
            direx = -direx;
            x += (velx * direx);
            otras[i].direx = -otras[i].direx;
            otras[i].x += (otras[i].velx * otras[i].direx);
            }; 
         if(direy != otras[i].direy)
           {
            direy = -direy;       
            y += (vely * direy);      
            otras[i].direy = -otras[i].direy;  
            otras[i].y += (otras[i].vely * otras[i].direy);  
            };          
         if(direx == otras[i].direx)
           {
            direy = -direy;          
            otras[i].direy = otras[i].direy;             
            }; 
         if(direy == otras[i].direy)
           {     
            direy = -direy;      
            otras[i].direy = otras[i].direy;
            };          
         }; 
     if(distancia >= radio + 1)
       {//cambio la direccion de las pelotitas
         direx = direx;
         direy = direy;        
         otras[i].direx = otras[i].direx;
         otras[i].direy = otras[i].direy;      
         };          
    };
}

void display()
{
     stroke(coll, 255, 255, 50);
     strokeWeight(2);
    line(x, y, 0, 0);
    line(x, y, width, 0);
    line(x, y, 0, height);
    line(x, y, width, height);  
fill(coll, 255, 255);
noStroke();
ellipse(x, y, r, r);
}
}

