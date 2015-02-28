

int a = 10;
int b = 0;
int y = 0;

void setup () {
  
 size (500, 500);
 background (255);
 noFill();
}  
  
void draw (){
  
  while(a < 250){
  ellipse(b, y, a, a);
  a = a +10;
  
  }
  
  b = b + 100;
  a = 0;
  
  if(b > 500){
    y = y + 100;
    b = 0;
  }
}

