
//variables
int a = 0; //position left circle
int b = 500; //position right circle
int c = 300;//position left circle
int o = 0; //opacity
int e = 180;

void setup () {
  size(300,300);
  background(#0a2b4b);
  noStroke();
  smooth();
}
 
 
void draw (){
  background(#DBDDDD);
  fill(#F7A7A7,o);
  ellipse (a,height/2,200,200);
  fill(#F3B795,o);
  ellipse (b,height/5,40,40);
  fill (#F8EB92,o);
  ellipse (c, height/3,80,80);
  fill (#A5DAD5,o);
  ellipse (e, height/5,20,20);
  a += 5; 
  b -= 5;
  c -= 5;
  o += 15;
  e += 5;
  if(a > 250){
    a = 0; b = 500; o = 0; c = 300; e = 180;
  }
}
                
                                                                                                                                
