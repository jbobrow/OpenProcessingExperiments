
int L = 50;
int grad= 10;
int M =0;
int N = 0;

        
        
void setup(){
  size(800,600);
 background(123,204,234); 


}

void draw (){
 background(123,204,234); 
  while(L < height){
    
    
    fill(grad,grad,grad);
       
       random(0,10);
    L = L + 60;
    grad= grad - 10;
    
    }

 N = 0;


   while (N < width){
      while(M < 600){
      rect(M+N,random(N),60,60);
      rect(M+N,random(M),10,10);
      rect(-50,random(M),-10,-10);
           fill (227,3,random(255));
       
        
        M = M + 15;
        grad = grad + 60;
      
      }
    N = N + 50;
    M = 0;
   }

  }
  


