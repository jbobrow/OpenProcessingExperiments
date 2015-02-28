
void setup (){
size (800,800);

background (0);
fill(0);
stroke(255); 
  for (int x=50; x<width/2; x+=50){
    rect (x,x,width-x-x,height-x);
   }
  }
