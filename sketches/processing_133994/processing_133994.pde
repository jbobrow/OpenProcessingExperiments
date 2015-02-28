
int x=0;
int y =55;
void setup (){
  
size (300, 300);
background (13, 60, 12);
}

void  draw (){
  background (100, 160, 212);
  line (x,y,x+20,y-40);
line (x+10,y, x+30,y-40);
line (x+20,y,x+40,y-40);
x=x+4;
  println (x);
  if(x>200){
    x=-40;
  }
}


