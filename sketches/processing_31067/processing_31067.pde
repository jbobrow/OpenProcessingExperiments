
float Y;
float S = random(10);
void setup() {  
    size(500,500);
    background(255,255,255);
    }
void draw(){
 background(255,255,255);
  Y = Y+S;
  
ellipse(100,Y,100,100);
if(Y>500){
    S=-S;
  }
   if(Y<1){
    S=-S;
   }
}




