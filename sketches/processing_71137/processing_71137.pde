
  PFont abc1;
  PFont abc2;
  
void setup() {
              size(600,200);
             }
             
void draw()  
             {
                background(0,0,255);
                int n=65;
                abc1=createFont("Segoe Script",20);
                textFont(abc1);
                  
                for(int a=0;a<26;a++)
                  {
                    char c=char(n+a);
                    float ancho=textWidth(c);
                    text(c,ancho+20*a,50);
                        
                  }
  
          int b=97;
               abc2=createFont("Arial-Black-48",15);
               textFont(abc2);
 
                 for(int c=0;c<26;c++)
                     {
                     char d=char(b+c);
                     float abc2=textWidth(d);
                     text(d,abc2+20*c,150);
                     }
  
                }

