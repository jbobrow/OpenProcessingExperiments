
//only flashes once :(
int color_value=0;
int millis=0;

void setup (){
  size(400,400);

}


void draw(){
  int m = millis();
  fill(255,255,color_value);
  rect(10,10,50,15);
  if (m>=500){
  color_value=255;
  }
  
  if (m>=501){
   millis=0;
  }
  
 
  }
  
  

 



