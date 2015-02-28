
int totalpoints =100;// reference to how big the array is. 
int [] x=new int [totalpoints]; 
int [] y= new int [totalpoints];


void setup ( ) {
  size ( 800, 800); 
  smooth ();
   frameRate(30); 
}


void draw ( ) {
  background (211,147,210);

  //we want to redraw background everytime. 

  for (int i= x.length-1; i>0 ; i--) {
    x[i]= x [ i-1];
    y [i]= y [i-1];   // shift everything down by one
  }
  x [0]= mouseX; 
  y [0]= mouseY;
   

  fill ( #FCFC0F, 99);
  
  stroke (#C54CDE); 
  for ( int i=x.length-1 ; i>0; i--){
    ellipse (x[i],y[i],100-i,100-i);
    }
  

  
  
} 

                
                                
