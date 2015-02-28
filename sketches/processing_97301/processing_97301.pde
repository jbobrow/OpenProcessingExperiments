
//author:ADRIÀ SÁNCHEZ GALLEGO
int i=0,j=0;
int canicas1=15;
int canicas2=15;
float color1=random(255);
float color2=0;
 
void setup(){
  size(192,157);
  background(255);
}
  
void draw(){
fill(10,220,102); 
ellipse(canicas2,canicas1,10,10);
canicas2=canicas2+15;
 
if(canicas2>192){
  canicas1=canicas1+15;
  canicas2=0;
}
if(canicas1>=157){
  canicas1=0;
  canicas2=0;
}
do{
    fill(10,220,102);
    ellipse(j,i,10,10);
    i+=20;
    if(i>height){
     j=j+20;
     i=0;
    }
    if(j>=width){
      i=0;
      j=0;
    }
   }while(0!=0); 
} 

