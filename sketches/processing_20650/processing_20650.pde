
float x = 0.85;

 
void setup(){
  size(700,900);
  background(0);
  smooth();
  
for(int i = 1; i < width; i+=7){
   for(int j = 1; j < i; j+=250){
   stroke(x*i, x*j, x*j);
   line(x, i*j, x*i, i);
    }
   
  }
}
 

   
   
   



