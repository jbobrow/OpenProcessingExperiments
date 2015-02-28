
int L = 10;
int grad= 10;
int M =0;
int N = 0;

        
        
void setup(){
  size(800,600);
 background(232,83,56); 


}

void draw (){
  
  while(L < height){
    
    
    fill(grad,grad,grad);
       rect(L,L,100,100);
       random(0,500);
    L = L + 60;
    grad= grad - 50;
    
    }

 N = 0;


   while (N < width){
      while(M < 600){
      
           fill (227,3,87);
       
        rect(M+N,M,50,50);
        M = M + 15;
        grad = grad + 60;
      
      }
    N = N + 50;
    M = 0;
   }

  }
  


