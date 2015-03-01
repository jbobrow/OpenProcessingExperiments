
void setup(){
size(500,500);
background(0);
frameRate(3);
}
void draw(){
for (int i = 0; i < 500; i++) {
 float x= random(500);
  
noFill();
stroke(260-x,10*i,90+x,x*random(90));
arc(i*x, i+x/i, i+x/4, i/x,x/2,i+3*x);

 }
}



