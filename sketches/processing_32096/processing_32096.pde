
int x = 1;


void setup (){
 size (500, 500);
 background (255);
 noFill();
}  
  
void draw (){

  ellipse(250, 250, x, x);
  
  x = x + 5;
  
  
}

