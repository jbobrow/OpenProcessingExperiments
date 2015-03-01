
int a=0;
int b=0;
int c=0;
int d=0;
int e=0;
 
void setup(){
  size(500,500);

}
 
void draw(){
  stroke(a,0,0);
  rect(390,a,40,10);
  rect(a,390,10,40);
  
  stroke(0,b,b);
  rect(b,120,100,40);
  rect(120,b,40,100);
  
  stroke(0,0,c);
  rect(c,210,100,40);
  rect(210,c,40,100);
  
  stroke(d,d,0);
  rect(d,300,100,40);
  rect(300,d,40,100);
  
  stroke(e,0,e);
  rect(30,e,40,30);
  rect(e,30,30,40);

  

  a+=2;
  b+=3;
  c+=4;
  d+=5;
  e+=6;
  //increasing the two variables by 2 and 3
}



