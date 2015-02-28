
//variables
int a = 0; //position left circle
int b = 500; //position right circle
int o = 0; //opacity
void setup () {
  size(500,500);
  background(#0a2b4b);
  noStroke();
  smooth();
}

void draw (){
  background(#0a2b4b);
  fill(#88cfa3,o);
  ellipse (a,height/2,50,50);
  fill(#FFFFFF,o);
  ellipse (b,height/2,50,50);
  a += 5;  
  b -= 5;
  o += 5;
  if(a > 250){
    a = 0; b = 500; o = 0;
  }
}

