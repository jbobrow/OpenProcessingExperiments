
void setup () {
  size(200,200);
background(150,0,200);
}
 
void draw(){
 
  for (int i=70; i <160; i=i+25)
  {
      fill (80,i,60,150);
    ellipse( i,40,40,40);
   
  }
  
int x=-100;
int y=-100;
  
while( x<200) {
  ellipse (x+100,y+100,10,10);
  x= x+10;
  y=x*x/100;
   
}}
