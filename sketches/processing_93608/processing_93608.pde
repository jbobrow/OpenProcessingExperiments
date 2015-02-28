
void setup (){
size(200,200);
background(62,86,234);
noStroke();
}
 
void draw (){
for (int x=0; x < 20; x++)
{
 fill (204,208,232);
  stroke (33,44,116);
 rect(x*20, 75, 10, 10);
 rect (x*20, 105, 10, 10);
 rect (75,x*20,10,10);
 rect (105,x*20,10,10);
   
}
 
}
