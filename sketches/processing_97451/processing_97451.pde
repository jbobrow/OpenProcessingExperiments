
void setup () {
  size(200,200);
background(255);
}

void draw(){

  for (int i=60; i <150; i=i+20)
  {
      fill (i,25,60,60);
    ellipse( i,40,40,40);
  
  }
 
int x=-100;
int y=-100;
 
while( x<200) {
  ellipse (x+100,y+100,10,10);
  x= x+10;
  y=x*x/100;
  
}}
