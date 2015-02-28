
int x = 20;
int y =20;
int spacing =50;

int diameter = 30;

void setup (){
  size ( 500,500); 
  background (0,0,0); 
  
  smooth ( ); 
  
}



void draw (){
  for ( int i =0; i<=500; i=i+spacing){
    for (int j=0; j<=500; j=j+spacing){
  fill ( #0FFFDD+i/2);
     
    for (int k= 0; k<=500; k=k+30){
      
      ellipse (i+j, i, 30-i/10 ,30-j/10);
    }
    }
  }
  
  
  
}   
                                
