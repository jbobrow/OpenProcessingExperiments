
size (750, 750); // set up window size
background (0);  // define background color
smooth(); // define the render to be smooth (anti-alias)

// enunciar variaveis de posiçao da rosa vermelha
float x1;
float x2;
float y1;
float y2;

// enunciar variaveis de posiçao da rosa vermelha
float a1;
float a2;
float b1;
float b2;



// variaveis para criar espaçamento
int step;
int step2;

// atribuir valores as variaveis
//margens do dseho
x1 = 70;
x2 = width-70;

y1 = 70;
y2 = height-70;

step = 3;//numero de repetiçoes

                //mesmo para arosa amarela
                    a1 = 170;
                    a2 = width-170;

                    b1 = 170;
                    b2 = height-170;


                    step2 = 2;






//preenchimento de cor vermelha e alpha de 50
  fill(255,0,0,50);
      noStroke();//sem preenchimento
      
      
            
     
// calculto do Interpolante

float stepSize = 10.0/ step;
for ( float tx = 0; tx<= 10;  tx = tx + stepSize)
{
  for ( float ty = 0; ty<= 10;  ty = ty + stepSize)
      {
         
          float x = x1 + (tx*0.1) *(x2 - x1);
          float y = y1 + (ty*0.1) *(y2 - y1);
          
          float a = a1 + (tx*0.1) *(a2 - a1);
          float b = b1 + (ty*0.1) *(b2 - b1);
     
        
 
       
       fill(255,0,0,50); //preenchimento decor vermelha
         
         
         //desenho das varias ellipse que contituem a rosa
         
          ellipse ( x,y, 10,10);
          
          ellipse(x+25, y,   50,50);
          ellipse(x,    y+25,50,50);   
          ellipse(x-25, y,   50,50);   
          ellipse(x,    y-25,50,50);



          ellipse(x+25, y,   100,100);
          ellipse(x,    y+25,100,100);   
          ellipse(x-25, y,   100,100);   
          ellipse(x,    y-25,100,100); 
          
          
        
          
        

          
      }
      
      

      
      
      //o mesmo codigo mas agora para desenhar as roas amarelas
      
   float stepSize2 = 10.0/ step2;
    for ( float ta = 0; ta<= 10;  ta = ta + stepSize2)
        {
      for ( float tb = 0; tb<= 10;  tb = tb + stepSize2)
                                                          {
                                                            
       float a = a1 + (ta*0.1) *(a2 - a1);
           float b = b1 + (tb*0.1) *(b2 - b1);
                                                               
 
       
            fill(255,255,0,20);//preenchimento decor vermelha
                   
                                                                       
            //desenho das varias ellipse que contituem a rosa
           ellipse(a+25, b,   50,50);
           ellipse(a,    b+25,50,50);   
           ellipse(a-25, b,   50,50);   
           ellipse(a,    b-25,50,50);


    
          ellipse(a+25, b,   100,100);
          ellipse(a,    b+25,100,100);   
          ellipse(a-25, b,   100,100);   
          ellipse(a,    b-25,100,100); 
          

          
      }

                                              }}


