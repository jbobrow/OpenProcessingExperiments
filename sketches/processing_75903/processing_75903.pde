
int nElements = 5;
int array0[ ] = new int[nElements];

void setup(){ 
  size(500,100);
 for (int q=0; q<nElements; q++){
   int randomint0 = (int)random(255);
   array0[q] = randomint0;
 }
}
void draw(){
 background (255);
 strokeWeight(5);
 smooth();
 int time = 0;

 for (float i=0; i<5; i=i+1){
   stroke(255-array0[time]);
   fill(array0[time]);
   ellipse(100*i+50,50, 50,50);
   if(array0[time] == 255){
     array0[time] = 0; 
   }else{
       array0[time] = array0[time]+1;}
   time = time+1;
  

 }
}
