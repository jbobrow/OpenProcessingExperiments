

    float rot; float rotaa; float rota; float rotb; float rotc;
    float modifcouleur = 4;
    float couleur;
    float mouvement;
    float mouvemendeux;
    float boxsize = 80; float minboxsize =10;
    float a = 0.01;
    float pi = 3.141592654;


    void setup()
    {
      size(800,800, P3D);
    }

    void draw()
    {
      background(0);
      translate((width/2), (height/2)+100);
      if(mousePressed){a=-a;} // inversion du sensfff

rot+=a;
if (rot<2*pi)
  {
   rota=rot;
  rotb=0; 
    
  }
if (rot>2*pi)
  {
   rotb=rot;
  rota=0; 
    
  }

if (rot>4*pi)
  {
   rotb=rot;
  rota=rot; 
    
  }
if (rot>6*pi)
{rot=0;}

     

      fill (couleur,255-couleur,128-(couleur/2));          
      box(boxsize);   
      dragon(boxsize);}
 
    void dragon(float h) 
    {          
    if (h > minboxsize)     
      { 
        h *= 0.707107; 
        
        pushMatrix();        
        translate(-h/0.707/2,-h*0.707*2,0);
        rotateZ(-pi*5/4-rota);
        box(h);    
        dragon(h);  
        popMatrix();

        pushMatrix();        
        translate(h/0.707/2,-h*0.707*2,0);
        rotateZ(pi*5/4+rotb);
        box(h);    
        dragon(h);  
        popMatrix();

        
      }
   }

