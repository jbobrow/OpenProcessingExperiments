
void setup (){

size(200,200);
background(0);
noStroke();
}
 
void draw (){
for (int x=0; x < 20; x++)
{
  
  fill (206,50,50);
 rect(x*30, 75, 10, 10);
 rect (x*30, 105, 10, 10);
 rect (75,x*30,10,10);
 rect (105,x*30,10,10);
   
}
 
}
