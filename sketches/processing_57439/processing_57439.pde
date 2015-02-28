
void setup(){
  size(200, 400);
  
}
int a = 255;
int b = 0;
int c = 0;
void draw(){
  translate(30,70);
frameRate(20);

  int i=10;
 
  background(0);
  while(i<260){
     stroke(a,b,c);
  line(10, i+ random(-2,3), 130, i+ random(-2,3));
  i+=20;
if(a==255){
  b+=1;
  c-=1;}
  if(b==255){
    a-=1;
    c+=1;
  }
  if(c==255){
    a+=1;
    b-=1;}
}

}

