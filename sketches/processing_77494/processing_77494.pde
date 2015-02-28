
PImage foto,foto2,foto3,foto4,foto5;
PFont tipo_letra;

int [] coordenadasXinvasor={int(random(600)),int(random(600)), 
int(random(600)),int(random(600)), int(random(600))};
int [] coordenadasYinvasor={0,0,0,0,0};
//variables
int diametroInvasor=30;
int diametroAstronauta=200;
int diametroArma=100;
int contador=0;
char[] winner = {'G','a','n','a','s','t','e'};
char[] lost = {'P','e','r','d','i','s','t','e'};
//el escenario 

void setup() {
              size(600,600); 
              foto=loadImage("universo2.jpg");
              foto2=loadImage("ma1.gif");
              foto3=loadImage("astro1.gif");
              foto4=loadImage("linus1.png");
              foto5=loadImage("explo2.gif");
              tipo_letra=loadFont("Arial-Black-48.vlw");
              smooth();
              }
//las funciones
void draw() {
               background(foto);
               image(foto3,200,100,diametroAstronauta,
                     diametroAstronauta);
               arma();
               invasores();
               
               finjuego();
             }
//el arma
void arma() {
             fill(0,255,0);
             stroke(color(0,255,0));
            // rect(mouseX-40,560,100,20);
             //triangle(mouseX,580,mouseX,565,mouseX,580); 
             image(foto4,mouseX-50,510,diametroArma,diametroArma);
            }
            
//Invasores
void invasores()
                {
                 stroke(255);
                 fill(255);
                  for (int i=0; i<5; i++) 
                     {
                       //ellipse(coordenadasXinvasor[i],coordenadasYinvasor[i]++,
                         //      diametroInvasor,diametroInvasor);
                       image(foto2,coordenadasXinvasor[i],coordenadasYinvasor[i]++,diametroInvasor,diametroInvasor);  
                    
                       
                   }
                 } 

//el disparo clic en el mouse

void mousePressed() {
                         
                         proyectil(mouseX);//tomamos la posición x del disparo(de mouse)
                        
                        }

void proyectil(int disparoX ){
                               boolean acertar=false;                                  
                               for(int i=0; i<5; i++)
                                    {       
                                     if((disparoX >=(coordenadasXinvasor[i]-diametroArma/2))
                                     && (disparoX <=(coordenadasXinvasor[i]+diametroArma/2)))
                                       {
                                       acertar=true;
                                       strokeWeight(3);
                                       stroke(255,255,0);
                                       line(mouseX,580,mouseX,coordenadasYinvasor[i]);
                                       stroke(255,255,0);
                                       fill(255,255,0);
                                       //ellipse(coordenadasXinvasor[i],coordenadasYinvasor[i],
                                         //      diametroInvasor+25,diametroInvasor+25);//explota el invasor
                                       image(foto5,coordenadasXinvasor[i],coordenadasYinvasor[i],diametroInvasor+25,
                                             diametroInvasor+25);  
                                      
                                      
                                      
                                       coordenadasXinvasor[i]=int(random(600));
                                       coordenadasYinvasor[i]=0;
                                       contador++;
                                          
                                       if(contador == 15)
                                        {
                                          noLoop();
                                          int x=110;
                                          for(int j=0; j<7; j++)
                                           {
                                             fill(255);
                                             textFont(tipo_letra,30);
                                             text(winner[j],x,350);
                                             x +=40;
                                           }    
                                        } 
                                      } }      
                                        if(acertar==false)
                                         { line(mouseX,565,mouseX,0);//fallo proyectil se va arriba } 
                                  }}  
                                



void finjuego() {
                  for(int i=0; i<5; i++)
                     {
                       if(coordenadasYinvasor[i]==600)
                        { 
                           
                           noLoop();
                             int x=110;
                                          for(int j=0; j<8; j++)
                                           {
                                             fill(0,0,255);
                                             textFont(tipo_letra,30);
                                             text(lost[j],x,350);
                                             x +=40;
                                           }                             
                         }
                     }
               }


