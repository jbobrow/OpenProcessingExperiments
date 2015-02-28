
int L = 10;
int grad= 10;
int M =0;
int N = 0;
int P = 10;
 
         
         
void setup(){
  size(800,600);
 background(255,255,255);
 
 
}
 
void draw (){
   noStroke();
  while(L < height){
     
     
    fill(grad,L,P);
       rect(L,L,500,500);
       random(0,500);
    L = L + 50;
    grad= grad * 50;
     P= P + 10;
    }

    
for (int M = 0; M < height; M+=4) {
stroke (250,5,239);
line(0,M,width,M);
    
}    
}



