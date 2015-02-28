
void setup (){
  size (500,500);
  background (0);
  stroke (0);
  
}


void draw (){

rectMode (CENTER);
noFill();

 for (int a=50; a<=width; a+=100){

 for (int i=0; i<=100; i+=10){

  for (int j=50; j<=height; j+=100){
          stroke (random(255),random(255),random(255));
rect (a,j, i,i);  
  }
 } 
 }




}


