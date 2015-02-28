
int x=0;
int y=0;
int a=1;
int b=1;
 
void setup () {
  size (300,200);
  smooth();
}
 
void draw() {
  background(128);
  noStroke();
  rect(x,y,20,20);
  x=x+1*a; 
  y=y+1*b;
  
  if((x<=0) || (x+20>=300)) 
  {
    a=a*-1;     
  }
   
  if((y<=0) || (y+20>=200)) 
  {
    b=b*-1;
  }  
}

