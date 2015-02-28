
float x=0;
float c=0.05;
int a=0,b=0,z=0,f=0,so=0,mb=0;
float incremento1=0.0;
float incremento2=0.0;

void setup()
            {
              size(600,400);
              //noFill();
            
              background(0);
              smooth();
               //Stroke();
            }     
   
   void draw()
               { 
                if(x>=0.8)
                    {x=-0.04;}
                if (x<=0)
                    {x=0.04;}
                background(0);
                x+=c;
                a+=1;
                b+=1;
                z+=1;
                f+=1; 
                so+=1;
                mb+=1;
                fill(255,255,0);
                   if((a>=301)&& (b>=305))
                      {
                         a=400;
                         b=450;
                         arc(a,130,130,130,x,TWO_PI-x);     
                         fill(0,0,0);
                         arc(a,110,20,20,0,TWO_PI);
                         fill(0,0,255);                
                         arc(a,190,140,140,0,PI);
                         noFill();
                         stroke(0,0,255);
                         arc(b,270,60,60,0+incremento1,QUARTER_PI+incremento1);
                         stroke(0,0,255); 
                         arc(b,270,80,80,0+incremento2,TWO_PI+incremento2);
                         
                         
                      }
                    else if((a<=300)&&(b<=304))
                    {
                       arc(a,130,130,130,x,TWO_PI-x);     
                       fill(0,0,0);
                       arc(a,110,20,20,0,TWO_PI);
                       fill(0,0,255);                
                       arc(a,190,140,140,0,PI);
                       noFill();
                       stroke(0,0,255);
                       arc(b,270,60,60,0+incremento1,QUARTER_PI+incremento1);
                       stroke(0,0,255); 
                       arc(b,270,80,80,0+incremento2,TWO_PI+incremento2);
                    }
                  
                    if((so>=302)&&(mb>=302))
                        {
                           so=360;
                           mb=385;
                           fill(240,230,10);
                           rect(so,60,80,20); 
                           fill(240,210,10);
                           rect(mb,30,30,30); 
                         }
                      else if((so<302)&&(mb<302))
                         {
                          fill(240,230,10);
                          rect(so,60,80,20); 
                          fill(240,210,10);
                          rect(mb,30,30,30);
                         }   

             
             if((z>=302) && (f>=302))
                 {
                 z=400;
                 f=320;
                noFill(); 
                stroke(0,0,255);
                arc(z,270,60,60,0+incremento1,QUARTER_PI+incremento1);
                stroke(0,0,255); 
                arc(z,270,80,80,0+incremento2,TWO_PI+incremento2);
               
                fill(255,190,80);
                arc(f,70,50,300,0.94,1.73);
                  }
               else if((z<=302)&&(f<302))
                  {
                     noFill();     
                     stroke(0,0,255);
                     arc(z,270,60,60,0+incremento1,QUARTER_PI+incremento1);
                     stroke(0,0,255); 
                     arc(z,270,80,80,0+incremento2,TWO_PI+incremento2);
                     fill(255,190,80);
                     arc(f,70,50,300,0.94,1.73);
                  
                  }   
                incremento1+=0.02;
                incremento2+=0.01;
                 
               }       

