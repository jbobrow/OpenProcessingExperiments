
//Rafael Santin
void setup (){
size(200,200);
background(0,0,255);
noStroke();
}
 
void draw (){
for (int x=0; x < 15; x++)
{
  noFill ();
  stroke (107,193,192);
 rect(x*25, 70, 12, 12);
 rect (x*35, 115, 8, 8);
 rect (60,x*20,15,15);
 rect (105,x*30,10,10);
   
}
 
}
