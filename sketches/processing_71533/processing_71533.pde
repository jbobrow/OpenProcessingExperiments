
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
int t=0;
AudioInput in;
Minim minim;
int ancho=0;
int q=0;
Cachos[] pedazos;
void setup()
{
   size(500,500);
   smooth();
   stroke(0,0,255);
   frameRate(25);
   minim=new Minim(this);
  in=minim.getLineIn(Minim.MONO,512); //512 son muestras de ondas por segundo en un solo canal
  pedazos = new Cachos[60]; // este es el constructor del objeto globo
  for(int i=0; i<pedazos.length; i++)
  {
    float a1=random(0,width);
    float b1=random(0,height);
    float a2=random(0,20);
    float b2=random(0,45);
    pedazos[i]=new Cachos(a1,b1,a2,b2);
  }
}
void draw()
{
   background(255);
   float m=0;
   for(int i=0; i<in.bufferSize()-1;i++)
   {
       if(abs(in.mix.get(i))>m) //compara si existe almacenado un sonido
       {
          m=abs(in.mix.get(i));
        
       }

   }
           ancho=int(m*150)+5;
           if(ancho>50)
          {
               t=t+ancho;
          }
              fill(0,0,255);
              ellipse(250,300,t+20,t+45);
              bezier(250,320,260,340,245,345,255,365);
             int p1=t+20;
             int p2=t+45;
             if(p1>900 && p2>900)//compara hasta el limite de expansion
             {
                //aqui van los pedazos pintados
                background(255);
                if(q==0)
               {
                for(int i=0; i<pedazos.length; i++)
                {  
                pedazos[i].paint();
                }q=1;
               }
               else
               {
                fill(255);
                rect(0,0,500,500);
                q=0; 
                noLoop();
               }
            }     
}//fin draw
class Cachos//clase cachos
{
  float x1;
  float y1;
  float t1;
  float t2;
     Cachos(float punto1,float punto2,float ancho1,float ancho2)
     {
        x1=punto1;
        y1=punto2;
        t1=ancho1;
        t2=ancho2;
     }
     void paint()
     {
        fill(0,0,255);
        ellipse(x1,y1,t1,t2); 
     }
}

