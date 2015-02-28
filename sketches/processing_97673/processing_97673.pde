
int Nboles=10;    
int r=50;

float [] pX = new float [Nboles];    // fixem les variables arrays
float [] pY = new float [Nboles];   
float [] vX = new float [Nboles];   
float [] vY = new float [Nboles];   



  void setup(){ 
     
 size(600,600);  
 background(#FCF569);
    
     
   
for (int i=0; i<Nboles;i++){ //marquem l'inici
  pX[i]= int ( random( width)); 
  pY[i]= int ( random( height));
  vX[i]= random( 0.5,1 );
  vY[i] =random ( 1,2);
}
  }
  
  void draw(){   //fem un bucle per dibuixar el fons
  background(#FCF569);
  int y1=height/width;
  int y2=width;
  for (int j =0; j < width; j+=5) {
    stroke(#FF0004);
    line(j, y1, j, y2);
    
    
     for( int i=0; i<Nboles; i++) //fem un segon bucle perque es moguin totes les boles a la vegada i marquem posicions.
     {
       pX[i] += vX[i];
       pY[i] += vY[i];
       
       if ( pX[i]<i || pX[i] >width ){ //limitem i fem canvi de velocitat
       vX[i] = - vX[i];
       }
       
       if ( pY[i] <i || pY[i] >height ){
       vY[i] = - vY[i];
       }
      
        fill ( random(255), random(255), random(255));  //fem el color aleatori
        ellipse(pX[i], pY[i], r, r);                    //posició elipse.
  }
  }
  }
  

  


