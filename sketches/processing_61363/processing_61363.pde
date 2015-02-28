
int mx;
int my;
 
void setup(){
 
size(400,400);
background(255);

 
 
}
 
void draw(){
  for(int x=0; x<=255; x=x+1){ 
  background(random(0,x),random(0,x),random(0,x));
  }
  mx = mouseX;
  my = mouseY;
  


  
for(int x=0; x<=400; x=x+2){
line(mx,x,random(0,400),x);
}


for(int x=0; x<=400; x=x+2){
line(x,my,x,random(0,400));
}
}

