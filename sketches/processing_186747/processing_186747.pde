
int m_minuts=60;
int m_segons=60;
int m_hores=12;

float [] s_col = new float [m_segons];
float [] m_col = new float [m_minuts];
float [] h_col = new float [m_hores];

int [] vs = new int [3];
int [] vm = new int [3];
int [] vh = new int [3];


void setup() 
{
  size(800, 800);
 
 
 

  
} 



void draw() 
{
  

reset_ini();     
cercleMinut(s_col,vs, second()+1, minute());

}




void reset_ini (){
  
   background(0);
   
  if(minute()==0)
  {}
  else
  {
      
    for(int i=0; i<minute(); i++){
    inicolor(s_col, vs);      
    cercleMinut(s_col,vs, 60, i);   
    }
    
  }
 
 
 //cercles minuts
 strokeWeight(0);
  fill(255,255,255,0);
 
 stroke (255,255,255,20);
  ellipse (400,400,610,610 ); //5min
  ellipse (400,400,560,560 ); //10min
  ellipse (400,400,460,460 ); //20min
  ellipse (400,400,410,410 ); //25min
  ellipse (400,400,310,310 ); //35min
  ellipse (400,400,260,260 ); //40min
  ellipse (400,400,160,160 ); //50min
  ellipse (400,400,110,110 ); //55min
  
  stroke (255,255,255,42);
  
  ellipse (400,400,510,510 ); //15min
  ellipse (400,400,360,360 ); //30min
  ellipse (400,400,210,210 ); //45min
  
}




void cercleMinut (float[] col, int[] vec, int salta, int minut ){

        int mostres = 60; //num barres
        float angle = 0.0;
        float inc = TWO_PI/mostres;
        
        
        
      float dExt=abs(minut-65)*5;
      float dInt=dExt-1;
     
    
      //dibuix cercle 1 minut. Avansa cada segon      
      for(int i=0; i<salta; i++) {
       
             stroke (col[0], col[1], col[2]);
             strokeWeight (2);
             line(400-sin(angle)*dInt, 400-cos (angle)*dInt, 400-sin(angle)*dExt, 400-cos (angle)*dExt); 
             angle = angle - inc;
             coloret (col, vec, mostres);
             
             }

}



void coloret (float [] c, int [] v, int total){
  
        float inccol =  255*6.05 / total; //valor variacio segons mostres
      
      
      //comprobacio vectors i inc/dec 
      
              if (v[0]==0)  { 
                c[0]=c[0]-inccol;
              } else {
                if (v[0]==1) {
                  c[0]=c[0]+inccol;
                  }
                }
                
              if (v[1]==0)  { 
                c[1]=c[1]-inccol;
              } else {
                if (v[1]==1) {
                  c[1]=c[1] + inccol;
                  }
                }
                
              if (v[2]==0)  { 
                c[2]=c[2]-inccol;
                } else {
                if (v[2]==1) {
                  c[2]=c[2]+inccol;
                  }
                }
         
       //actualitzacio vectors 
          
             //posar en repos  
             if (c[0]<=0) {
             c[0]=0;
             v[0]=2;
             }         
             if (c[0]>=255) {
             c[0]=255;
             v[0]=2;
             }
             
             if (c[1]<=0) {
             c[1]=0;
             v[1]=2;
             }         
             if (c[1]>=255) {
             c[1]=255;
             v[1]=2;
             }
             
             if (c[2]<=0) {
             c[2]=0;
             v[2]=2;
             }         
             if (c[2]>=255) {
             c[2]=255;
             v[2]=2;
             }
             
             
             //decrÃ�Â¨ixer
             if(c[0]==c[1] && c[0]==255) {
             v[0]=0;
             }
             if(c[1]==c[2] && c[1]==255) {
             v[1]=0;
             }
             if(c[2]==c[0] && c[2]==255) {
             v[2]=0;
             }
             
             
             //crÃ�Â¨ixer
              if(c[0]==c[1] && c[0]==0) {
             v[0]=1;
             }
             if(c[1]==c[2] && c[1]==0) {
             v[1]=1;
             }
             if(c[2]==c[0] && c[2]==0) {
             v[2]=1;
             }
                      
}
  
  
  
 void inicolor (float [] col, int [] vec)  //inicialitza la posiciÃ³ del vermell segons hora
 {
 
   if (hour()==0||hour()==12)
   {
        
          //inicialitza color 
          col[0]=255;
          col[1]=0;
          col[2]=0;
          //vectors de moviment del color. 0 decreixent, 1 creixent i 2 estatic
          vec[0]=2;
          vec[1]=1;
          vec[2]=2;
   }
    if (hour()==1||hour()==13)
   {
          //inicialitza color 
          col[0]=255;
          col[1]=0;
          col[2]=128;
          //vectors de moviment del color. 0 decreixent, 1 creixent i 2 estatic
          vec[0]=2;
          vec[1]=2;
          vec[2]=0;
   }
      if (hour()==2||hour()==14)
   {
          //inicialitza color 
          col[0]=255;
          col[1]=0;
          col[2]=255;
          //vectors de moviment del color. 0 decreixent, 1 creixent i 2 estatic
          vec[0]=2;
          vec[1]=2;
          vec[2]=0;
   }
   
     if (hour()==3||hour()==15)
   {
          //inicialitza color 
          col[0]=128;
          col[1]=0;
          col[2]=255;
          //vectors de moviment del color. 0 decreixent, 1 creixent i 2 estatic
          vec[0]=1;
          vec[1]=2;
          vec[2]=2;
   }
        if (hour()==4||hour()==16)
   {
          //inicialitza color 
          col[0]=0;
          col[1]=0;
          col[2]=255;
          //vectors de moviment del color. 0 decreixent, 1 creixent i 2 estatic
          vec[0]=1;
          vec[1]=2;
          vec[2]=2;
   }
         if (hour()==5||hour()==17)
   {
          //inicialitza color 
          col[0]=0;
          col[1]=127;
          col[2]=255;
          //vectors de moviment del color. 0 decreixent, 1 creixent i 2 estatic
          vec[0]=2;
          vec[1]=0;
          vec[2]=2;
   }
   
   
     if (hour()==6||hour()==18)
   {
          //inicialitza color 
          col[0]=0;
          col[1]=255;
          col[2]=255;
          //vectors de moviment del color. 0 decreixent, 1 creixent i 2 estatic
          vec[0]=2;
          vec[1]=0;
          vec[2]=2;
   }
       if (hour()==7||hour()==19)
   {
          //inicialitza color 
          col[0]=0;
          col[1]=255;
          col[2]=128;
          //vectors de moviment del color. 0 decreixent, 1 creixent i 2 estatic
          vec[0]=2;
          vec[1]=2;
          vec[2]=1;
   }
    if (hour()==8||hour()==20)
   {
          //inicialitza color 
          col[0]=0;
          col[1]=255;
          col[2]=0;
          //vectors de moviment del color. 0 decreixent, 1 creixent i 2 estatic
          vec[0]=2;
          vec[1]=2;
          vec[2]=1;
   }
   
    if (hour()==9||hour()==21)
   {
          //inicialitza color 
          col[0]=128;
          col[1]=255;
          col[2]=0;
          //vectors de moviment del color. 0 decreixent, 1 creixent i 2 estatic
          vec[0]=0;
          vec[1]=2;
          vec[2]=2;
   }
   
       if (hour()==10||hour()==22)
   {
          //inicialitza color 
          col[0]=255;
          col[1]=255;
          col[2]=0;
          //vectors de moviment del color. 0 decreixent, 1 creixent i 2 estatic
          vec[0]=0;
          vec[1]=2;
          vec[2]=2;
   }
   
   
         if (hour()==11||hour()==23)
   {
          //inicialitza color 
          col[0]=255;
          col[1]=128;
          col[2]=0;
          //vectors de moviment del color. 0 decreixent, 1 creixent i 2 estatic
          vec[0]=2;
          vec[1]=1;
          vec[2]=2;
   }
          
  }
