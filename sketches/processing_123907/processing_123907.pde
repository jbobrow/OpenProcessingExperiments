
int numBurbujas = 20;

    Burbuja[] Burbujas;
   
void setup()
{
    size(120, 400);
       
  Burbujas = new Burbuja[numBurbujas];
  
        
        for (int i = 0; i < numBurbujas; i++) {
          
          
  Burbujas[i] = new Burbuja();
    }
}
   
void draw()

{
    background(#F8E6B3);
    smooth();
       
    for (int i = 0; i < Burbujas.length; i++) {
        Burbujas[i].update();
        Burbujas[i].render();
        
    if (Burbujas[i].loc.y < -50) {
       Burbujas[i].reset();
       
       
        }
    }
}
       
       
           
  
class Burbuja
{
    PVector loc; //pos
    
    float   vel;//velocidad
    
    float   tam;//tamaño
       
    Burbuja()
    {
        loc = new PVector( random(width), random(height) ); //pos burbuja principio
        
        vel = random(1, 1.4); //velocidad burbuja principio
        
        tam = random( 1, 3 ); //tamaño burbuja principio
    }
       
    void update()
    {
        loc.y -= vel;
        
           }
       
       
    void render()
    {
          
        fill(#FFFFFF);
        for (int i = 1; i < 3; i++) {
            ellipse( loc.x, loc.y, i * tam * 2, i * tam * 2 );
        }
    }
    
    
       
    void reset()  //repeticion de las burbujas +lentas + pequeñas
    
    {
        loc.x = random(width); 
        loc.y = height + 40;
        vel = random(0.4, 1);
        tam = random( 0.5,1.5 );
    }
       
}



