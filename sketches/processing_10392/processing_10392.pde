

int breite = 10;
int v=2;
int le=0;
int re;

void setup()

{
size (480,640);
  background (0);
 smooth ();
noStroke ();
noLoop ();

}


void draw (){


for (int b= 0; b < 24; b++ )

                                      // zeichnen bis zu breite von 20 px.
  
  {
    
    re=le+breite;
      
  triangle (le,0,re,0,re,height);
  
  le=re;
  breite +=v;
  
  if (b==8 )
  
  {
  v=-1;
  }



  }
  

  
  
    
    
    
    
    
  
  
  }
  
  
  


