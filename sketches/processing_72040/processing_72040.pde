
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim minim;
AudioInput in;

PFont tipo_letra;

float ancho=0; //ancho de lam linea
float b1=2;
float b2=50;
  void setup(){
               size(400,400);
               smooth();
               
            
               stroke(255,0,0);
               frameRate(10);
               minim=new Minim(this);
               in= minim.getLineIn(Minim.MONO,512); 
                   tipo_letra=loadFont("Arial-BoldMT-48.vlw");
               //vivene en un solo canal y toma 512 muestras de la onda senoidal 
               //se esta digitalizando la señal
            }
            
 void draw()
             {
              background(#CCEEFF);
              
              float m=0;
              for(int i=0; i < in.bufferSize()-1; i++)
              {//el tamaño del buffder ya es estandsar
                  if(abs(in.mix.get(i))>m)  //hay algo de ruido ahi sacle el valor absoluto de loq ue esta metido  
                    {
                      m=abs(in.mix.get(i));
                    } 
                    
             ancho=int(m*500)+5;
             stroke(255,0,0);
             strokeWeight(ancho);//hazme esa linea para saber el ancho de la voz
              
               fill(255,0,0);
               ellipse(200,200,ancho+30,ancho+80);
              
             /*beginShape();
             vertex(240,230);
             vertex(250,260);*/
              println(ancho); 
             ancho=ancho+m;
            
             
             if((b2<ancho))
               {
                  background(0);
                  fill(255);
                  textFont(tipo_letra,30);
                  text("FELICIDADES GRITASTE",30,40);
                  text("MUY FUERTE",30,80);
                  text("ROMPISTE EL GLOBO",30,120);
                    
                   //ellipse(250,250,30,300);
               }
            
            
            }
             
           stroke(0);
             fill(0);
             bezier(200,240,200,300,195,310,190,320);
              
             
              
        }

