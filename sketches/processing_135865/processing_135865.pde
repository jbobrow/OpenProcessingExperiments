
int i;
float x;
float y;
void setup(){
  x=0;
  y=0;
}

void draw(){
  for(i=0;i<11;i++){
    x=random(9);
    y=random(9);
    x=round(x);
    y=round(y);
    println(x+">="+y+"is");
    println(x>=y);
  }
    
}


